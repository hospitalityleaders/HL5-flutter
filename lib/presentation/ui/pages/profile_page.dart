import 'package:flutter/material.dart';
import 'package:holedo/presentation/ui/components/custom_appbar.dart';
import 'package:holedo/presentation/ui/pages/components/profile_tabbar.dart';
import 'package:holedo/presentation/ui/pages/components/profile_image_banner.dart';
import 'package:holedo/presentation/ui/pages/sections/activity_section/activity_section.dart';
import 'package:holedo/presentation/ui/pages/sections/articles_section/articles_section.dart';
import 'package:holedo/presentation/ui/pages/sections/page_overview/page_overview_section.dart';
import 'package:holedo/presentation/ui/pages/sections/reference_section/reference_section.dart';
import 'package:holedo/presentation/ui/pages/sections/timeline_section/timeline_section.dart';
import 'package:holedo/presentation/utill/color_resources.dart';
import 'package:holedo/presentation/utill/dimensions.dart';
import 'package:holedo/presentation/utill/styles.dart';
import 'package:responsive_framework/responsive_framework.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  static const String mobileBreakPoint = "Mobile";
  static const String desktopBreakPoint = "Desktop";

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      builder: (context, child) => ResponsiveWrapper.builder(
        child,
        breakpoints: [
          ResponsiveBreakpoint.autoScaleDown(450, name: MOBILE),
          ResponsiveBreakpoint.autoScaleDown(1200, name: DESKTOP),
        ],
      ),
      debugShowCheckedModeBanner: false,
      home: ProfilePage(),
    );
  }
}

class ProfilePage extends StatefulWidget {
  const ProfilePage({Key? key}) : super(key: key);

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage>
    with TickerProviderStateMixin {
  int tabBar = 0;
  late TabController _tabController;

  @override
  void initState() {
    _tabController = TabController(length: 5, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.lightBlue,
      body: ResponsiveWrapper.of(context).isSmallerThan(MOBILE)
          ? Center(
              child: Text(
                "Mobile View",
                style: h2Bold.copyWith(fontSize: 100),
              ),
            )
          : Center(
              child: ListView(
                shrinkWrap: true,
                children: [
                  CustomAppbar(),
                  Container(
                    height: 50,
                    width: Di.getScreenSize(context).width,
                    color: Cr.red3,
                    child: Center(
                      child: Text(
                        "Your profile is only 25% complete. Complete it now to earn your first Hospitality Leaders grade.",
                        textAlign: TextAlign.center,
                        style: bodyLarge.copyWith(
                          color: Cr.redTextColor,
                        ),
                      ),
                    ),
                  ),
                  ProfileImageBanner(),
                  ProfileTabbar(tabController: _tabController),
                  Di.SBHEL,
                  SizedBox(
                    // width: Di.getScreenSize(context).width,
                    height: 1500,
                    child: TabBarView(
                      controller: _tabController,
                      children: <Widget>[
                        PageOverviewSection(),
                        TimelineSection(),
                        ArticlesSection(),
                        ActivitySection(),
                        ReferenceSection(),
                      ],
                    ),
                  ),
                  Di.SBHOTL,
                ],
              ),
            ),
    );
  }
}
