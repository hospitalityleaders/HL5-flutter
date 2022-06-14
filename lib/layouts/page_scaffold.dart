
import 'package:holedo/layouts/cards/holedo_cards.dart';
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

import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/common/common_widget.dart';

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
  final double maxWidth = 1280;

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
        barrierDismissible: false,
        // disables popup to close if tapped outside popup (need a button to close)
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
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(46),
          child: _buildAppBar(),
        ),
        body: SafeArea(
          child: ListView(children: <Widget>[
            Container(
              height: constraints.maxHeight,
              child: Column(
                children: [
                  Expanded(
                    child: Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: widget.body),
                    ),
                  ),
                ],
              ),
            ),
            _buildFooter(),
          ]),
        ),
      );
    });
  }

  Widget _buildFooter() {
    return Container(
      height: 650,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background.png'),
          fit: BoxFit.fitWidth,
          alignment: Alignment.bottomRight,
          repeat: ImageRepeat.noRepeat,
        ),
        color: Color.fromARGB(255, 215, 215, 224),
      ),
      child: Center(
        heightFactor: 10,
        child: Container(
          height: 450,
          width: maxWidth,
          padding: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * 0.10,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorPicker.kPrimaryLight, width: 3))),
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Holedo Links',
                          style: FontTextStyle.kWhite16W400SSP),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    for (final pages in Get.put(HoledoDatabase()).pages)
                      FooterLinkCard(
                          title: pages.title.toString(),
                          path: '/pages/${pages.slug}'),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * 0.10,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorPicker.kPrimaryLight, width: 3))),
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Holedo Pages',
                          style: FontTextStyle.kWhite16W400SSP),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    for (final pages in Get.put(HoledoDatabase()).pages)
                      FooterLinkCard(
                          title: pages.title.toString(),
                          path: '/pages/${pages.slug}'),
                  ],
                ),
              ),
              SizedBox(
                width: Get.width * 0.02,
              ),
              Container(
                padding: const EdgeInsets.only(top: 5),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: Get.width * 0.10,
                      decoration: BoxDecoration(
                          border: Border(
                              bottom: BorderSide(
                                  color: ColorPicker.kPrimaryLight, width: 3))),
                      padding: const EdgeInsets.only(left: 5),
                      child: Text('Holedo Direct Links',
                          style: FontTextStyle.kWhite16W400SSP),
                    ),
                    SizedBox(
                      height: 5,
                    ),
                    for (final pages in Get.put(HoledoDatabase()).pages)
                      FooterLinkCard(
                          title: pages.title.toString(),
                          path: '/${pages.slug}'),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAppBar() {
    final appState = Provider.of<AppState>(context);
    return Container(
        height: 46,
        color: ColorPicker.kPrimaryLight1,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image(
                image: AssetImage('assets/icons/logo1.png'),
              ),
            ),
            SB.SW10(),
            // SizedBox(
            //   width: 10,
            // ),
            Container(
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                  color: ColorPicker.kWhite,
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(3),
              child: TextFormField(
                cursorColor: ColorPicker.kWhite,
                style: FontTextStyle.kWhite16W400SSP,
                decoration: InputDecoration(
                  hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
                  filled: true,
                  fillColor: ColorPicker.kPrimaryLight,
                  hintText: "Search",
                  border: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPicker.kPrimary),
                      borderRadius: BorderRadius.circular(5)),
                  focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPicker.kPrimary),
                      borderRadius: BorderRadius.circular(5)),
                  enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: ColorPicker.kPrimary),
                      borderRadius: BorderRadius.circular(5)),
                  prefixIcon: Icon(
                    Icons.search,
                    color: ColorPicker.kPrimaryLightBlue,
                  ),
                  suffixIcon: Container(
                    margin: EdgeInsets.only(right: 5, bottom: 5, top: 5),
                    height: 40,
                    width: Get.width * 0.045,
                    decoration: BoxDecoration(
                      color: ColorPicker.kPrimaryLight1,
                      borderRadius: BorderRadius.circular(5),
                    ),
                    child: Center(
                      child: CommonWidget.text(
                        'People',
                        style: FontTextStyle.kPrimaryLightBlue16W400SSP,
                      ),
                    ),
                  ),
                ),
              ),
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Container(
              width: 430,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: _buildNavBarChildren(inDrawer: false),
              ),
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Container(
              width: Get.width * 0.05,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3),
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: Center(
                  child: Stack(
                //overflow: Overflow.visible,
                children: [
                  Icon(
                    Icons.email,
                    color: ColorPicker.kPrimaryLightBlue,
                  ),
                  Positioned(
                    right: -5,
                    top: -5,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: ColorPicker.kRed,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: CommonWidget.text(
                          '2',
                          style: FontTextStyle.kWhite12W700SSP,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Container(
              width: Get.width * 0.05,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: Center(
                  child: Stack(
                //overflow: Overflow.visible,
                children: [
                  Icon(
                    Icons.flag,
                    color: ColorPicker.kPrimaryLightBlue,
                  ),
                  Positioned(
                    right: -5,
                    top: -5,
                    child: Container(
                      height: 16,
                      width: 16,
                      decoration: BoxDecoration(
                        color: ColorPicker.kRed,
                        borderRadius: BorderRadius.circular(3),
                      ),
                      child: Center(
                        child: CommonWidget.text(
                          '2',
                          style: FontTextStyle.kWhite12W700SSP,
                        ),
                      ),
                    ),
                  ),
                ],
              )),
            ),
            Container(
              width: 90,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: Center(
                  child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.person_add,
                    color: ColorPicker.kPrimaryLightBlue,
                  ),
                  SizedBox(
                    width: 5,
                  ),
                  Container(
                    height: 20,
                    width: 30,
                    decoration: BoxDecoration(
                      color: Color(0xff546088),
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: CommonWidget.text('352',
                          style: FontTextStyle.kPrimaryLight10W700SSP),
                    ),
                  ),
                ],
              )),
            ),

            if (appState.isLoggedIn)
              Container(
                width: Get.width * 0.05,
                decoration: BoxDecoration(
                    border: Border(
                        right: BorderSide(
                            color: ColorPicker.kPrimaryLight, width: 3))),
                child: Center(
                  child: Container(
                    height: 26,
                    width: 26,
                    child: appState.profile?.avatarCdn != null
                        ? CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                appState.profile!.avatarCdn.toString()),
                          )
                        : Icon(
                            CupertinoIcons.profile_circled,
                            size: 55,
                            color: Colors.grey,
                          ),
                  ),
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
            /**/
          ],
        ));
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    List<DropdownMenuItem<String>> menuItems = [
      DropdownMenuItem(child: Text("USA"), value: "USA"),
      DropdownMenuItem(child: Text("Canada"), value: "Canada"),
      DropdownMenuItem(child: Text("Brazil"), value: "Brazil"),
      DropdownMenuItem(child: Text("England"), value: "England"),
    ];
    return menuItems;
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
          padding: const EdgeInsets.fromLTRB(12, 10, 12, 10),
          child: Text(
            title,
            style: TextStyle(color: Colors.white),
          ),
        ),
      ),
    );
  }
}
