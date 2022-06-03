import 'package:holedo/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:routemaster/routemaster.dart';
export 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
export 'package:holedo/layouts/cards/holedo_cards.dart';

export 'package:holedo/layouts/pages/home_page.dart';
export 'package:holedo/layouts/pages/recruitment_page.dart';

export 'package:holedo/layouts/pages/profile_page.dart';
export 'package:holedo/layouts/pages/category_page.dart';
export 'package:holedo/layouts/pages/search_page.dart';
export 'package:holedo/layouts/pages/login_page.dart';
export 'package:holedo/layouts/pages/newsfront_page.dart';
export 'package:holedo/layouts/pages/news_page.dart';

export 'package:holedo/layouts/pages/jobsfront_page.dart';
export 'package:holedo/layouts/pages/jobs_page.dart';

import 'appbar/appbar.dart';

class PageScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final String? searchQuery;

  PageScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.searchQuery,
  }) : super(key: key);

  @override
  _PageScaffoldState createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  final TextEditingController _searchController = TextEditingController();

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _updateSearchQuery();
  }

  @override
  void didUpdateWidget(covariant PageScaffold oldWidget) {
    super.didUpdateWidget(oldWidget);
    _updateSearchQuery();
  }

  void _updateSearchQuery() {
    if (widget.searchQuery != null) {
      _searchController.text = widget.searchQuery!;
    }
  }

  void _search() {
    Routemaster.of(context).push(
      '/search',
      queryParameters: {'query': _searchController.text},
    );
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: Duration(seconds: 1), //default is 4s
    );
    // Find the Scaffold in the widget tree and use it to show a SnackBar.
    ScaffoldMessenger.of(context).showSnackBar(snackBar);
  }

  void showPurchaseDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible:
            false, // disables popup to close if tapped outside popup (need a button to close)
        builder: (BuildContext context) {
          return AlertDialog(
            title: Text(
              "title",
            ),
            content: Text("your text here"),
            //buttons?
            actions: <Widget>[
              FlatButton(
                child: Text("Close"),
                onPressed: () {
                  Navigator.of(context).pop();
                }, //closes popup
              ),
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);

    final routemaster = Routemaster.of(context);
    final canGoBack = routemaster.history.canGoBack;
    final canGoForward = routemaster.history.canGoForward;

    return LayoutBuilder(builder: (context, constraints) {
      final isMobile = constraints.maxWidth < 600;

      return Scaffold(
        drawer: isMobile
            ? Drawer(
                child: Container(
                  color: Color(0xFF232f3e),
                  child: ListView(
                    children: _buildNavBarChildren(inDrawer: true),
                  ),
                ),
              )
            : null,
        appBar: AppBarTop(),
        body: Column(
          children: [
            Container(
              color: Color(0xFF232f3e),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(width: 20),
                  SizedBox(
                    width: 40,
                    child: InkWell(
                      onTap:
                          canGoBack ? () => routemaster.history.back() : null,
                      child: Icon(
                        Icons.arrow_back_ios,
                        color: canGoBack
                            ? Colors.white
                            : Colors.white.withAlpha(30),
                      ),
                    ),
                  ),
                  InkWell(
                    onTap: canGoForward
                        ? () => routemaster.history.forward()
                        : null,
                    child: SizedBox(
                      width: 40,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: canGoForward
                            ? Colors.white
                            : Colors.white.withAlpha(30),
                      ),
                    ),
                  ),
                  Expanded(
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Flexible(
                          child: Container(
                            width: 300,
                            padding: EdgeInsets.all(16),
                            child: CupertinoTextField(
                              controller: _searchController,
                              onSubmitted: (_) => _search(),
                            ),
                          ),
                        ),
                        SizedBox(width: 10),
                        ElevatedButton(
                          onPressed: _search,
                          child: Text('Search'),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(width: 20),
                  if (appState.isLoggedIn)
                    Text(
                      'Hello, ${appState.username}!',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                      ),
                    )
                  else
                    InkWell(
                      onTap: () {
                        Routemaster.of(context).push(
                          '/login',
                          queryParameters: {
                            'redirectTo': RouteData.of(context).fullPath,
                          },
                        );
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Log in',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  SizedBox(width: 20),
                ],
              ),
            ),
            Expanded(
              child: Row(
                children: [
                  if (!isMobile)
                    Container(
                      width: 200,
                      color: Color(0xFF232f3e),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: _buildNavBarChildren(inDrawer: false),
                      ),
                    ),
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (ModalRoute.of(context)?.canPop == true)
                          CupertinoNavigationBarBackButton(),
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20),
                            child: widget.body,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      );
    });
  }

  List<Widget> _buildNavBarChildren({required bool inDrawer}) {
    return [
      NavigationLink(
        title: 'Home',
        path: '/home',
        inDrawer: inDrawer,
      ),
      NavigationLink(
        title: 'News',
        path: '/news',
        inDrawer: inDrawer,
      ),
      NavigationLink(
        title: 'Profile',
        path: '/profile',
        inDrawer: inDrawer,
      ),
      NavigationLink(
        title: 'Jobs',
        path: '/jobs',
        inDrawer: inDrawer,
      ),
      NavigationLink(
        title: 'Recruitments',
        path: '/recruitments',
        inDrawer: inDrawer,
      ),
      NavigationLink(
        title: 'Help',
        path: '/help',
        inDrawer: inDrawer,
      ),
    ];
  }
}

class NavigationLink extends StatelessWidget {
  final String title;
  final String path;
  final bool inDrawer;

  const NavigationLink({
    Key? key,
    required this.title,
    required this.path,
    required this.inDrawer,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final currentPath = RouteData.of(context).fullPath;
    final isCurrent = currentPath.startsWith(path);

    return Container(
      color: isCurrent ? Color(0xff068597) : Colors.transparent,
      child: InkWell(
        onTap: () {
          if (inDrawer) {
            Navigator.pop(context);
          }

          Routemaster.of(context).push(path);
        },
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
