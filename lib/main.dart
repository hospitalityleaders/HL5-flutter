import 'package:flutter/material.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/models/models.dart';

import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';

import 'includes/url_strategy.dart';

void main() async {
  usePathUrlStrategy();

  await Get.put(HoledoDatabase()).init();
  WidgetsFlutterBinding.ensureInitialized();
  runApp(BookStoreApp());
}

bool _isValidCategory(String? category) {
  return Get.put(HoledoDatabase()).articleCategories.any(
        (e) => e.slug == category,
      );
}

bool _isValidBookId(String? id) {
  return true;
  //holedoDatabase.books.any((book) => book.id == id);
}

final holedoDatabase = Get.put(HoledoDatabase());
var dataModel = holedoDatabase.getModel();

// ignore: prefer_expression_function_bodies
RouteMap _buildRouteMap(BuildContext context) {
  return RouteMap(
    // ignore: prefer_expression_function_bodies
    onUnknownRoute: (path) {
      return NoAnimationPage(
        child: PageScaffold(
          title: 'Page not found',
          body: Center(
            child: Text(
              "Couldn't find page '$path'",
              style: Theme.of(context).textTheme.headline3,
            ),
          ),
        ),
      );
    },
    routes: {
      '/': (route) => NoAnimationPage(child: HomePage()),
      '/home': (route) => NoAnimationPage(child: HomePage()),
      '/help': (route) => NoAnimationPage(child: HomePage()),
      '/login': (route) => NoAnimationPage(
            child: LoginPage(
              redirectTo: route.queryParameters['redirectTo'],
            ),
          ),
      '/recruitments': (route) => NoAnimationPage(child: RecruitmentPage()),
      '/recruitments/:id': (route) =>
          NoAnimationPage(child: ProfilePage(id: route.pathParameters['id']!)),
      '/news': (route) => TabPage(
            child: NewsfrontPage(),
            paths: [
              'all',
              'featured'
            ], //Get.put(HoledoDatabase()).articlePaths,
            pageBuilder: (child) => NoAnimationPage(child: child),
          ),
      '/news/all': (route) => NoAnimationPage(
            child: NewsfrontListPage(mode: 'all'),
          ),
      '/news/featured': (route) => NoAnimationPage(
            child: NewsfrontListPage(mode: 'featured'),
          ),
      '/news/all/:category': (route) =>
          _isValidCategory(route.pathParameters['category'])
              ? NoAnimationPage(
                  child: NewsfrontListPage(
                      mode: 'all',
                      category: Get.put(HoledoDatabase())
                          .articleCategories
                          .firstWhere(
                            (e) => e.slug == route.pathParameters['category'],
                          )),
                )
              : NotFound(),
      '/category/:category': (route) =>
          _isValidCategory(route.pathParameters['category'])
              ? NoAnimationPage(
                  child: CategoryPage(
                    category:
                        Get.put(HoledoDatabase()).articleCategories.firstWhere(
                              (e) => e.slug == route.pathParameters['category'],
                            ),
                  ),
                )
              : NotFound(),
      '/article/:category/:id': (route) =>
          NoAnimationPage(child: NewsPage(slug: route.pathParameters['id'])),
      '/news2/:category/:id': (route) => _isValidCategory(
                  route.pathParameters['category']) &&
              _isValidBookId(route.pathParameters['id'])
          ? NoAnimationPage(child: NewsPage(id: route.pathParameters['id']!))
          : NotFound(),
      '/jobs': (route) => TabPage(
            child: JobsfrontPage(),
            paths: ['all', 'premium'],
            pageBuilder: (child) => NoAnimationPage(child: child),
          ),
      '/jobs/all': (route) => NoAnimationPage(
            child: JobsfrontListPage(mode: 'all'),
          ),
      '/jobs/premium': (route) => NoAnimationPage(
            child: JobsfrontListPage(mode: 'premium'),
          ),
      '/job/:id': (route) =>
          NoAnimationPage(child: JobsPage(slug: route.pathParameters['id'])),
      '/search': (route) => NoAnimationPage(
              child: SearchPage(
            query: route.queryParameters['query'] ?? '',
            sortOrder: SortOrder.values.firstWhere(
              (e) => e.queryParam == route.queryParameters['sort'],
              orElse: () => SortOrder.name,
            ),
          )),
      '/profile': (route) {
        final appState = Provider.of<AppState>(context, listen: false);
        if (appState.isLoggedIn) {
          return Redirect('/profile/${appState.profile?.slug}');
        }
        return Redirect('/login', queryParameters: {'redirectTo': route.path});
      },
      '/profile/:id': (route) =>
          NoAnimationPage(child: ProfilePage(slug: route.pathParameters['id'])),
      //'/profile/add': (route) => AddProfilePage(),
      '/interactive/:id': (route) {
        final appState = Provider.of<AppState>(context, listen: false);

        if (appState.isLoggedIn) {
          return NoAnimationPage(
            child: ProfilePage(id: route.pathParameters['id']),
          );
        }

        return Redirect('/login', queryParameters: {'redirectTo': route.path});
      },
    },
  );
}

final loggedOutRouteMap = RouteMap(
  routes: {
    '/': (route) => NoAnimationPage(child: LoginPage()),
  },
);

class NoAnimationPage<T> extends TransitionPage<T> {
  NoAnimationPage({required Widget child})
      : super(
          child: child,
          pushTransition: PageTransition.none,
          popTransition: PageTransition.none,
        );
}

class BookStoreApp extends StatelessWidget {
  final String? username;
  final bool siteBlockedWithoutLogin;
  final RouteInformationProvider? routeInformationProvider;

  BookStoreApp({
    Key? key,
    this.username,
    this.siteBlockedWithoutLogin = false,
    this.routeInformationProvider,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => AppState(
          username: Get.put(HoledoDatabase()).getModel().user?.fullName,
          profile: Get.put(HoledoDatabase()).getModel().user),
      child: MaterialApp.router(
        title: 'Holedo',
        theme: ThemeData(
          primaryColor: Color(0xFF131921),
          elevatedButtonTheme: ElevatedButtonThemeData(
            style: ElevatedButton.styleFrom(
              primary: Color(0xfffebd68),
              onPrimary: Color(0xff333333),
            ),
          ),
          platform: TargetPlatform.macOS,
        ),
        routeInformationParser: RoutemasterParser(),
        routeInformationProvider: routeInformationProvider,
        routerDelegate: RoutemasterDelegate(
          routesBuilder: (context) {
            final state = Provider.of<AppState>(context);
            // Provider.of<AppState>(context).profile = Get.put(HoledoDatabase()).getModel().user ?? null;
            return siteBlockedWithoutLogin && !state.isLoggedIn
                ? loggedOutRouteMap
                : _buildRouteMap(context);
          },
        ),
      ),
    );
  }

  //.profile = Get.put(HoledoDatabase()).getModel().user ?? null
}
