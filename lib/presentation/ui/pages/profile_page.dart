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

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
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
      // backgroundColor: Color(0xffF7F8FA),
      backgroundColor: Colors.lightBlue,
      body: SingleChildScrollView(
        child: Column(
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
              width: Di.getScreenSize(context).width * .8,
              height: 5000,
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
