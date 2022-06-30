import 'package:holedo/layouts/cards/holedo_cards.dart';
import 'package:holedo/models/models.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/presentation/ui/components/custom_appbar.dart';
import 'package:holedo/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/presentation/ui/pages/mobile_view_section/mobile_profile_overview_section.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/images.dart';
import 'package:holedo/presentation/utill/nav.dart';
import 'package:holedo/presentation/utill/responsive.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:holedo/responsive/responsive.dart';
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

import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';
import 'package:holedo/common/common_widget.dart';

class PageScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final String? searchQuery;
  final bool isNewDesign;

  PageScaffold({
    Key? key,
    required this.title,
    required this.body,
    this.searchQuery,
    this.isNewDesign = false,
  }) : super(key: key);

  @override
  _PageScaffoldState createState() => _PageScaffoldState();
}

class _PageScaffoldState extends State<PageScaffold> {
  final TextEditingController _searchController = TextEditingController();
  late double maxWidth;
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
    if (_searchController.text.length > 3) {
      Routemaster.of(context).push(
        '/search',
        queryParameters: {'query': _searchController.text},
      );
    }
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
    final GlobalKey<ScaffoldState> _scaffoldKey =
        new GlobalKey<ScaffoldState>();
    final menuItems = Get.put(HoledoDatabase()).menuItems;

    bool inDrawer = true;

    return widget.isNewDesign
        ? widget.body
        : LayoutBuilder(builder: (context, constraints) {
            final bool isMobile = Responsive.isMobile(context);
            final bool isTablet = Responsive.isTablet(context);
            final bool isDesktop = Responsive.isDesktop(context);
            maxWidth = constraints.maxWidth;
            return Scaffold(
              backgroundColor: Cr.backgroundColor,
              key: _scaffoldKey,
              endDrawer: isTableOrMobile(context)
                  ? Drawer(
                      child: Center(
                        child: SingleChildScrollView(
                          child: Container(
                            padding: EdgeInsets.only(top: Di.PSS),
                            color: Cr.colorPrimary,
                            child: Column(
                              children: [
                                Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    AppbarEmailButton(),
                                    // VerticalDivider(
                                    //   thickness: 3.3,
                                    //   color: Cr.darkBlue5,
                                    // ),
                                    AppbarNotificationsButton(),
                                    AppbarConnectionRequestButton(),
                                    CustomIconButton(
                                      onTap: () {
                                        Nav.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.close,
                                        color: Cr.darkBlue9,
                                      ),
                                    ),
                                  ],
                                ),
                                Divider(
                                  thickness: 1.2,
                                  color: Cr.darkBlue5,
                                ),
                                SingleChildScrollView(
                                  child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        for (var item in menuItems)
                                          if (item.loginOnly == null ||
                                              (item.loginOnly ==
                                                  appState.isLoggedIn))
                                            if (inDrawer == true &&
                                                item.inDrawer == true) ...[
                                              Padding(
                                                padding: EdgeInsets.only(
                                                  left: Di.PSL,
                                                  bottom: Di.PSD,
                                                ),
                                                child: ListTile(
                                                  title: Text(
                                                    item.title!,
                                                    style: TextStyle(
                                                      // fontSize: 18,
                                                      color: Cr.whiteColor,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Routemaster.of(context)
                                                        .push(item.path!);
                                                  },
                                                ),
                                              ),
                                              Divider(
                                                thickness: 1.2,
                                                color: Cr.darkBlue5,
                                              ),
                                            ] else if (inDrawer == false &&
                                                item.inNav == true)
                                              Padding(
                                                padding: EdgeInsets.only(
                                                    left: Di.PSL),
                                                child: ListTile(
                                                  title: Text(
                                                    item.title!,
                                                    style:
                                                        defaultRegular.copyWith(
                                                      color: Cr.whiteColor,
                                                    ),
                                                  ),
                                                  onTap: () {
                                                    Routemaster.of(context)
                                                        .push(item.path!);
                                                  },
                                                ),
                                              )
                                      ]

                                      // _buildNavBarChildren(
                                      //     inDrawer: true,
                                      //     isLogin: appState.isLoggedIn),

                                      ),
                                ),
                                Di.ESB,
                              ],
                            ),
                          ),
                        ),
                      ),
                    )
                  : null,
              appBar: PreferredSize(
                preferredSize: Size.fromHeight(45),
                child: (isTableOrMobile(context))
                    ? ProfileMobileAppbar(
                        onTap: () => _scaffoldKey.currentState?.openEndDrawer(),
                        searchController: _searchController,
                        onSearch: (searchText) {
                          _search();
                        },
                      )
                    : CustomAppbar(
                        searchController: _searchController,
                        onSearch: (searchText) {
                          _search();
                        },
                      ),
              ),
              // appBar: PreferredSize(
              //   preferredSize: Size.fromHeight(46),
              //   child: AppBar(
              //     backgroundColor: ColorPicker.kPrimaryLight1,
              //     automaticallyImplyLeading: (!isDesktop),
              //     title: BuildAppbar(
              //       context: context,
              //       constraints: constraints,
              //       searchController: _searchController,
              //       onSearch: (searchText) {
              //         _search();
              //       },
              //     ),
              //     // title: _buildAppBar(context, constraints),
              //   ),
              // ),
              body: Container(
                  decoration: BoxDecoration(
                    color: ColorPicker.kBG,
                  ),
                  child: widget
                      .body /* ListView(children: <Widget>[
            Container(
                height: constraints.maxHeight,
                child: Column(
                  children: [
                    Expanded(
                        child: Container(
                      child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 0),
                          child: widget.body),
                    )),
                  ],
                )),
            _buildFooter(isMobile),
          ]),*/
                  ),
            );
          });
  }

  Widget _buildFooter(bool isMobile) {
    return Container(
      height: isMobile ? 400 : 650,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background.png'),
          fit: BoxFit.fill,
          alignment: Alignment.bottomRight,
          repeat: ImageRepeat.noRepeat,
        ),
        color: Color.fromARGB(255, 215, 215, 224),
      ),
      child: Center(
        heightFactor: 10,
        child: Container(
          width: maxWidth,
          padding: const EdgeInsets.only(top: 15),
          alignment: Alignment.center,
          child: ListView(
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

  Widget _buildAppBar(BuildContext context, BoxConstraints constraints) {
    final appState = Provider.of<AppState>(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isDesktop = Responsive.isDesktop(context);

    return Container(
        height: 46,
        padding: const EdgeInsets.all(0),
        color: ColorPicker.kPrimaryLight1,
        child: Row(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: !isDesktop
              ? MainAxisAlignment.spaceBetween
              : MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image(
                image: AssetImage(isMobile
                    ? 'assets/icons/logo.png'
                    : 'assets/icons/logo1.png'),
              ),
            ),
            SB.SW10(),
            if (isDesktop) // search
              Container(
                width: Get.width * 0.2,
                decoration: BoxDecoration(
                    color: ColorPicker.kWhite,
                    borderRadius: BorderRadius.circular(5)),
                margin: EdgeInsets.all(3),
                child: TextFormField(
                  controller: _searchController,
                  onChanged: (_) =>
                      _search(), // , onSubmitted: (_) => _search(),
                  cursorColor: ColorPicker.kWhite,
                  style: FontTextStyle.kWhite18W600PR,
                  decoration: InputDecoration(
                    contentPadding: EdgeInsets.all(4),
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
                      borderRadius: BorderRadius.circular(5),
                    ),
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
            if (isDesktop)
              SizedBox(
                width: Get.width * 0.02,
              ),
            if (isDesktop) // navigation
              Container(
                width: 430,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: _buildNavBarChildren(
                    inDrawer: false,
                    isLogin: appState.isLoggedIn,
                  ),
                ),
              ),
            if (isDesktop)
              SizedBox(
                width: Get.width * 0.02,
              ),
            _userNavMenu(context, constraints),

            /**/
          ],
        ));
  }

  Widget _userNavMenu(BuildContext context, BoxConstraints constraints) {
    final appState = Provider.of<AppState>(context);
    final bool isMobile = Responsive.isMobile(context);
    final bool isTablet = Responsive.isTablet(context);
    final bool isDesktop = Responsive.isDesktop(context);
    return Container(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          if (appState.isLoggedIn && !isMobile)
            Container(
              width: (isDesktop ? 55 : Get.width * 0.07),
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3),
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: NavigationBox(
                inDrawer: false,
                body: Center(
                    child: Stack(
                  clipBehavior: Clip.none,
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
            ),
          if (appState.isLoggedIn && !isMobile)
            Container(
              width: (isDesktop ? 55 : Get.width * 0.07),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: NavigationBox(
                inDrawer: false,
                body: Center(
                    child: Stack(
                  clipBehavior: Clip.none,
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
            ),
          if (appState.isLoggedIn && !isMobile)
            Container(
              width: (isDesktop ? 75 : Get.width * 0.07),
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: NavigationBox(
                inDrawer: false,
                body: Center(
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
                        child: CommonWidget.text('3',
                            style: FontTextStyle.kPrimaryLight10W700SSP),
                      ),
                    ),
                  ],
                )),
              ),
            ),
          NavigationBox(
            title: appState.isLoggedIn ? '' : 'Login',
            path: appState.isLoggedIn
                ? '/profile/${appState.profile!.slug}'
                : '/login',
            inDrawer: false,
            body: Container(
              padding: EdgeInsets.all(2),
              width: 30,
              child: Center(
                child: Container(
                  height: 30,
                  width: 30,
                  child: (appState.isLoggedIn &&
                          appState.profile?.avatarCdn != null)
                      ? CircleAvatar(
                          radius: 30,
                          backgroundImage: NetworkImage(
                              appState.profile!.avatarCdn.toString()),
                        )
                      : Icon(
                          CupertinoIcons.profile_circled,
                          size: 26,
                          color: Colors.grey,
                        ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
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

  List<Widget> _buildNavBarChildren({
    required bool inDrawer,
    required bool isLogin,
  }) {
    final menuItems = Get.put(HoledoDatabase()).menuItems;
    return [
      for (var item in menuItems)
        if (item.loginOnly == null || (item.loginOnly == isLogin))
          if (inDrawer == true && item.inDrawer == true)
            NavigationLink(
              title: item.title!,
              path: item.path!,
              inDrawer: inDrawer,
            )
          else if (inDrawer == false && item.inNav == true)
            NavigationLink(
              title: item.title!,
              path: item.path!,
              inDrawer: inDrawer,
            )
    ];
  }
}

class BuildAppbar extends StatelessWidget {
  final TextEditingController? searchController;
  final BuildContext context;
  final BoxConstraints constraints;

  final void Function(String)? onSearch;
  const BuildAppbar({
    Key? key,
    required this.searchController,
    required this.context,
    required this.constraints,
    this.onSearch,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppState>(context);
    final bool isMobile = Responsive.isMobile(context);
    final menuItems = Get.put(HoledoDatabase()).menuItems;
    final bool isDesktop = Responsive.isDesktop(context);
    bool inDrawer = false;

    return Container(
        color: Cr.colorPrimary,
        height: 45,
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          // mainAxisAlignment: !isDesktop
          //     ? MainAxisAlignment.spaceBetween
          //     : MainAxisAlignment.center,
          children: [
            //Padding(
            //   padding: const EdgeInsets.all(4.0),
            //   child: Image(
            //     image: AssetImage(isMobile
            //         ? 'assets/icons/logo.png'
            //         : 'assets/icons/logo1.png'),
            //   ),
            // ),
            Image.asset(
              Images.logo1,
              width: Di.FSOTL + 10,
            ),
            Di.SBWD,
            AppbarTextField(
              searchController: searchController,
              onSearchChange: onSearch,
            ),
            Di.SBWD,
            // CustomTextButton(
            //   text: "Home",
            //   color: Cr.whiteColor,
            // ),

            if (!isMobilePhone(context)) // navigation
              Row(
                children: menuItems.map((item) {
                  if (item.loginOnly == null ||
                      (item.loginOnly == appState.isLoggedIn)) if (inDrawer ==
                          true &&
                      item.inDrawer == true)
                    return NavigationLink(
                      title: item.title!,
                      path: item.path!,
                      inDrawer: inDrawer,
                    );
                  else if (inDrawer == false && item.inNav == true)
                    return NavigationLink(
                      title: item.title!,
                      path: item.path!,
                      inDrawer: inDrawer,
                    );
                  return SizedBox();
                }).toList(),
              ),

            Container(
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  if (appState.isLoggedIn && !isMobile)
                    Container(
                      width: (isDesktop ? 55 : Get.width * 0.07),
                      decoration: BoxDecoration(
                          border: Border(
                              left: BorderSide(
                                  color: ColorPicker.kPrimaryLight, width: 3),
                              right: BorderSide(
                                  color: ColorPicker.kPrimaryLight, width: 3))),
                      child: NavigationBox(
                        inDrawer: false,
                        body: Center(
                            child: Stack(
                          clipBehavior: Clip.none,
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
                    ),
                  if (appState.isLoggedIn && !isMobile)
                    Container(
                      width: (isDesktop ? 55 : Get.width * 0.07),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: ColorPicker.kPrimaryLight, width: 3))),
                      child: NavigationBox(
                        inDrawer: false,
                        body: Center(
                            child: Stack(
                          clipBehavior: Clip.none,
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
                    ),
                  if (appState.isLoggedIn && !isMobile)
                    Container(
                      width: (isDesktop ? 75 : Get.width * 0.07),
                      decoration: BoxDecoration(
                          border: Border(
                              right: BorderSide(
                                  color: ColorPicker.kPrimaryLight, width: 3))),
                      child: NavigationBox(
                        inDrawer: false,
                        body: Center(
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
                                child: CommonWidget.text('3',
                                    style:
                                        FontTextStyle.kPrimaryLight10W700SSP),
                              ),
                            ),
                          ],
                        )),
                      ),
                    ),
                  NavigationBox(
                    title: appState.isLoggedIn ? '' : 'Login',
                    path: appState.isLoggedIn
                        ? '/profile/${appState.profile!.slug}'
                        : '/login',
                    inDrawer: false,
                    body: Container(
                      padding: EdgeInsets.all(2),
                      width: 30,
                      child: Center(
                        child: Container(
                          height: 30,
                          width: 30,
                          child: (appState.isLoggedIn &&
                                  appState.profile?.avatarCdn != null)
                              ? CircleAvatar(
                                  radius: 30,
                                  backgroundImage: NetworkImage(
                                      appState.profile!.avatarCdn.toString()),
                                )
                              : Icon(
                                  CupertinoIcons.profile_circled,
                                  size: 26,
                                  color: Colors.grey,
                                ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            // _userNavMenu(context, constraints),

            /**/
          ],
        ));
  }
}

class NavigationBox extends StatefulWidget {
  final String? title;
  final String? path;
  final Widget? body;
  final bool inDrawer;
  final bool isHover;

  const NavigationBox({
    Key? key,
    this.title,
    this.path,
    this.body,
    required this.inDrawer,
    this.isHover = false,
  }) : super(key: key);

  @override
  _NavigationBox createState() => _NavigationBox();
}

class _NavigationBox extends State<NavigationBox> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final currentPath = RouteData.of(context).fullPath;
    final isCurrent =
        widget.path != null ? currentPath.startsWith(widget.path!) : false;

    return Container(
      padding: const EdgeInsets.all(5),
      color: isCurrent || isHover ? Color(0xff068597) : Colors.transparent,
      child: InkWell(
        onTap: () {
          if (widget.path != null) {
            if (widget.inDrawer) {
              Navigator.pop(context);
            }
            Routemaster.of(context).push(widget.path!);
          }
        },
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            if (widget.body != null) Container(child: widget.body),
            if (widget.title != null)
              Padding(
                padding: const EdgeInsets.fromLTRB(5, 5, 5, 5),
                child: Text(
                  widget.title!,
                  style: isCurrent
                      ? FontTextStyle.kWhite18W600PR
                      : isHover
                          ? FontTextStyle.kWhite18W600PR
                          : FontTextStyle.kPrimaryLightBlue18W400SSP,
                ),
              )
          ],
        ),
      ),
    );
  }
}

class NavigationLink extends StatefulWidget {
  final String title;
  final String path;
  final bool inDrawer;
  final bool isHover;

  const NavigationLink({
    Key? key,
    required this.title,
    required this.path,
    required this.inDrawer,
    this.isHover = false,
  }) : super(key: key);

  @override
  _NavigationLink createState() => _NavigationLink();
}

class _NavigationLink extends State<NavigationLink> {
  bool isHover = false;

  @override
  Widget build(BuildContext context) {
    final currentPath = RouteData.of(context).fullPath;
    final isCurrent = currentPath.startsWith(widget.path);

    return Container(
      color: isCurrent ? Color(0xff068597) : Colors.transparent,
      child: InkWell(
        onTap: () {
          if (widget.inDrawer) {
            Navigator.pop(context);
          }

          Routemaster.of(context).push(widget.path);
        },
        onHover: (value) {
          setState(() {
            isHover = value;
          });
        },
        child: Text(
          widget.title,
          style: (bodySmallRegular).copyWith(
            color: Cr.whiteColor,
            //  Cr.accentBlue1,
          ),
          // isCurrent
          //     ? FontTextStyle.kWhite16W400SSP
          //     : isHover
          //         ? FontTextStyle.kWhite16W400SSP
          //         : FontTextStyle.kPrimaryLightBlue16W400SSP,
        ),
      ),
    );
  }
}
