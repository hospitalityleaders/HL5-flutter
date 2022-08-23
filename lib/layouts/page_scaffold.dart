import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/common/common_widget.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/profile/presentation/popups/profile_connection_request_popup.dart';
import 'package:holedo/profile/presentation/popups/profile_submenu_popup.dart';
import 'package:holedo/profile/presentation/providers/app_provider.dart';
import 'package:holedo/profile/presentation/ui/components/appbar_notification.dart';
import 'package:holedo/profile/presentation/ui/components/appbar_textfield.dart';
import 'package:holedo/profile/presentation/ui/components/custom_appbar.dart';
import 'package:holedo/profile/presentation/ui/components/custom_icon_button.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/mobile_slide_menu.dart';
import 'package:holedo/profile/presentation/ui/flutter_slider_drawer/slider.dart';
import 'package:holedo/profile/presentation/ui/pages/profile_mobile_view/profile_mobile_view_page.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/images.dart';
import 'package:holedo/profile/presentation/utill/responsive.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';
import 'package:holedo/responsive/responsive.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:routemaster/routemaster.dart';

export 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
export 'package:holedo/layouts/cards/holedo_cards.dart';
export 'package:holedo/layouts/pages/category_page.dart';
export 'package:holedo/layouts/pages/home_page.dart';
export 'package:holedo/layouts/pages/jobs_page.dart';
export 'package:holedo/layouts/pages/jobsfront_page.dart';
export 'package:holedo/layouts/pages/login_page.dart';
export 'package:holedo/layouts/pages/news_page.dart';
export 'package:holedo/layouts/pages/newsfront_page.dart';
export 'package:holedo/layouts/pages/profile_page.dart';
export 'package:holedo/layouts/pages/recruitment_page.dart';
export 'package:holedo/layouts/pages/search_page.dart';

class PageScaffold extends StatefulWidget {
  final String title;
  final Widget body;
  final String? searchQuery;
  final bool isNewDesign;

  const PageScaffold({
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
  bool showADialog = false;

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  void initState() {
    super.initState();
    _updateSearchQuery();

    WidgetsBinding.instance.addPostFrameCallback((_) {
      final appState = Provider.of<AppProvider>(context, listen: false);

      if (appState.notify == null) {
        if (!appState.isLoggedIn)
          appState.notify = AppNotify(
            appbarNotificationColor: AppbarNotificationColor.green,
            buttonText: "Create Account",
            title:
                "New to Hospitality Leaders? Sign up now to join our membership",
            onButtonPressed: () {
              Routemaster.of(context).push('/login');
            },
          );
        else
          appState.notify?.title = "Welcome to Hospitality Leaders";
      }
    });
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

  void showMessageBar(BuildContext context, String text) {
    ScaffoldMessenger.of(context).showSnackBar(new SnackBar(
      content: Text(text, style: FontTextStyle.kBlueLight114W400PR),
      behavior: SnackBarBehavior.floating,
      backgroundColor: const Color(0xffCCE8FE),
      shape: RoundedRectangleBorder(
          side: BorderSide.none, borderRadius: BorderRadius.zero),
      duration: Duration(minutes: 5),
      action: SnackBarAction(
        label: 'X',
        textColor: Colors.black,
        onPressed: () {
          ScaffoldMessenger.of(context).hideCurrentSnackBar();
        },
      ),
      margin: EdgeInsets.only(
          bottom: MediaQuery.of(context).size.height - 85, right: 0, left: 0),
    ));
  }

  void showSnackBar(BuildContext context, String text) {
    final snackBar = SnackBar(
      content: Text(text),
      duration: const Duration(seconds: 1), //default is 4s
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
          title: const Text(
            "title",
          ),
          content: const Text("your text here"),
          //buttons?
          actions: <Widget>[
            FlatButton(
              child: const Text("Close"),
              onPressed: () {
                Navigator.of(context).pop();
              }, //closes popup
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final appState = Provider.of<AppProvider>(context);

    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    final isSmallerThanDesktop =
        ResponsiveWrapper.of(context).isSmallerThan(DESKTOP);
    return LayoutBuilder(
      builder: (context, constraints) {
        maxWidth = constraints.maxWidth;
        return Scaffold(
          backgroundColor: Cr.backgroundColor,
          key: _scaffoldKey,
          /*floatingActionButton: FloatingActionButton(
                  child: const Text('Chat'),
                  onPressed: () async {
                    if (appState.isLoggedIn) {
                      await Intercom.instance.loginIdentifiedUser(
                        email: appState.profile?.email.toString(),
                      );
                      await Intercom.instance.updateUser(
                        email: appState.profile?.email.toString(),
                        name: appState.profile?.fullName.toString(),
                        phone: appState.profile?.contactableSms.toString(),
                        company: appState.profile?.company?.name.toString(),
                        companyId: appState.profile?.companyId.toString(),
                        userId: appState.profile?.id.toString(),
                      );
                    }
                    await Intercom.instance.displayMessenger();
                  },
                ),*/
          appBar: AppBar(
            toolbarHeight: 45,
            actions: <Widget>[
              if (isSmallerThanDesktop)
                IconButton(
                  icon: const Icon(Icons.add_alert),
                  tooltip: 'Show Snackbar',
                  onPressed: () {
                    ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('This is a snackbar')));
                  },
                ),
              if (isSmallerThanDesktop)
                IconButton(
                  icon: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    mainAxisSize: MainAxisSize.min,
                    children: const [
                      Icon(
                        Icons.menu,
                        color: Cr.darkBlue9,
                      ),
                      Text(
                        "MENU",
                        style: TextStyle(
                          fontSize: 9,
                          fontFamily: "SourceSansPro",
                          fontWeight: FontWeight.bold,
                          color: Cr.darkBlue9,
                        ),
                      )
                    ],
                  ),
                  tooltip: 'Show Navigation Menu',
                  onPressed: () => _scaffoldKey.currentState?.openEndDrawer(),
                ),
            ],
            flexibleSpace: SizedBox(
              child: CustomAppbar(
                searchController: _searchController,
                onSearch: (searchText) {
                  _search();
                },
              ),
            ),
          ),
          endDrawer: isSmallerThanDesktop
              ? Drawer(
                  elevation: 16.0,
                  child: Container(
                    color: Color(0xFF232f3e),
                    child: MobileSlideMenu(onCloseTap: () => {}),
                  ),
                )
              : null,
          body: Scaffold(
            appBar: AppbarNotification(),
            extendBodyBehindAppBar: true,
            body: Stack(
              children: [
                Center(
                  child: Container(
                    child: Column(
                      children: [
                        ElevatedButton(
                          onPressed: () {
                            Provider.of<ProfileProvider>(context, listen: false)
                                .profileNotifyListeners();
                          },
                          child: Text("data"),
                        ),
                        Text("Profile page"),
                      ],
                    ),
                  ),
                ),
                Container(
                  decoration: const BoxDecoration(
                    color: ColorPicker.kBG,
                  ),
                  child: widget.body,
                ),
                if (!isTableOrMobile(context)) ...[
                  !(Provider.of<ProfileProvider>(context)
                          .showConectionRequestPopo)
                      ? Di.ESB
                      : Positioned(
                          right: isSmallerThanDesktop ? 65 : 195,
                          child: const ProfileConnectionRequestPopup(),
                        ),
                  // !profileProviderValue.showProfileSubMenus
                  !(Provider.of<ProfileProvider>(context).showProfileSubMenus)
                      ? Di.ESB
                      : Positioned(
                          right: isSmallerThanDesktop ? 5 : 130,
                          child: const ProfileSubMenuPopup(),
                        ),
                ],
              ],
            ),
          ),
        );
      },
    );
  }

  Widget _buildFooter() {
    final bool isMobile = Di.getScreenSize(context).width < 1000;
    return Container(
      height: isMobile ? 400 : 650,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: AssetImage('assets/images/Background.png'),
          fit: BoxFit.fill,
          alignment: Alignment.bottomRight,
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
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Holedo Links',
                        style: FontTextStyle.kWhite16W400SSP,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    for (final pages in Get.put(HoledoDatabase()).pages)
                      FooterLinkCard(
                        title: pages.title.toString(),
                        path: '/pages/${pages.slug}',
                      ),
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
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Holedo Pages',
                        style: FontTextStyle.kWhite16W400SSP,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    for (final pages in Get.put(HoledoDatabase()).pages)
                      FooterLinkCard(
                        title: pages.title.toString(),
                        path: '/pages/${pages.slug}',
                      ),
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
                      decoration: const BoxDecoration(
                        border: Border(
                          bottom: BorderSide(
                            color: ColorPicker.kPrimaryLight,
                            width: 3,
                          ),
                        ),
                      ),
                      padding: const EdgeInsets.only(left: 5),
                      child: Text(
                        'Holedo Direct Links',
                        style: FontTextStyle.kWhite16W400SSP,
                      ),
                    ),
                    const SizedBox(
                      height: 5,
                    ),
                    for (final pages in Get.put(HoledoDatabase()).pages)
                      FooterLinkCard(
                        title: pages.title.toString(),
                        path: '/${pages.slug}',
                      ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  List<DropdownMenuItem<String>> get dropdownItems {
    final List<DropdownMenuItem<String>> menuItems = [
      const DropdownMenuItem(value: "USA", child: Text("USA")),
      const DropdownMenuItem(value: "Canada", child: Text("Canada")),
      const DropdownMenuItem(value: "Brazil", child: Text("Brazil")),
      const DropdownMenuItem(value: "England", child: Text("England")),
    ];
    return menuItems;
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
    final appState = Provider.of<AppProvider>(context);
    final bool isMobile = Responsive.isMobile(context);
    final menuItems = Provider.of<AppProvider>(context)
        .model
        .settings
        ?.fetch('Menus', 'title', 'Top Menu');
    final bool isDesktop = Responsive.isDesktop(context);
    const bool inDrawer = false;

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
                    (item.loginOnly == appState.isLoggedIn))
                  return NavigationLink(
                    title: item.title!,
                    path: item.slug!,
                    inDrawer: inDrawer,
                  );

                return const SizedBox();
              }).toList(),
            ),

          Container(
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.end,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                if (appState.isLoggedIn && !isMobile)
                  Container(
                    width: isDesktop ? 55 : Get.width * 0.07,
                    decoration: const BoxDecoration(
                      border: Border(
                        left: BorderSide(
                          color: ColorPicker.kPrimaryLight,
                          width: 3,
                        ),
                        right: BorderSide(
                          color: ColorPicker.kPrimaryLight,
                          width: 3,
                        ),
                      ),
                    ),
                    child: NavigationBox(
                      inDrawer: false,
                      body: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Icon(
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
                        ),
                      ),
                    ),
                  ),
                if (appState.isLoggedIn && !isMobile)
                  Container(
                    width: isDesktop ? 55 : Get.width * 0.07,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: ColorPicker.kPrimaryLight,
                          width: 3,
                        ),
                      ),
                    ),
                    child: NavigationBox(
                      inDrawer: false,
                      body: Center(
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Icon(
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
                        ),
                      ),
                    ),
                  ),
                if (appState.isLoggedIn && !isMobile)
                  Container(
                    width: isDesktop ? 75 : Get.width * 0.07,
                    decoration: const BoxDecoration(
                      border: Border(
                        right: BorderSide(
                          color: ColorPicker.kPrimaryLight,
                          width: 3,
                        ),
                      ),
                    ),
                    child: NavigationBox(
                      inDrawer: false,
                      body: Center(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Icon(
                              Icons.person_add,
                              color: ColorPicker.kPrimaryLightBlue,
                            ),
                            const SizedBox(
                              width: 5,
                            ),
                            Container(
                              height: 20,
                              width: 30,
                              decoration: BoxDecoration(
                                color: const Color(0xff546088),
                                borderRadius: BorderRadius.circular(3),
                              ),
                              child: Center(
                                child: CommonWidget.text(
                                  '3',
                                  style: FontTextStyle.kPrimaryLight10W700SSP,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                NavigationBox(
                  title: appState.isLoggedIn ? '' : 'Login',
                  path: appState.isLoggedIn
                      ? '/profile/${appState.profile!.slug}'
                      : '/login',
                  inDrawer: false,
                  body: Container(
                    padding: const EdgeInsets.all(2),
                    width: 30,
                    child: Center(
                      child: SizedBox(
                        height: 30,
                        width: 30,
                        child: (appState.isLoggedIn &&
                                appState.profile?.avatarCdn != null)
                            ? CircleAvatar(
                                radius: 30,
                                backgroundImage: NetworkImage(
                                  appState.profile!.avatarCdn.toString(),
                                ),
                              )
                            : const Icon(
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
      ),
    );
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
      color:
          isCurrent || isHover ? const Color(0xff068597) : Colors.transparent,
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
      color: isCurrent ? const Color(0xff068597) : Colors.transparent,
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
          style: bodySmallRegular.copyWith(
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
