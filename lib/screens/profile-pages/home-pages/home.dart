import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/profile-edit/profile-edit.dart';
import 'package:holedo/screens/profile-pages/home-pages/header.dart';
import 'package:holedo/screens/profile-pages/profile-overview/profile-overview.dart';
import 'package:holedo/screens/profile-pages/references/references.dart';
import 'package:holedo/screens/profile-pages/timeline/timeline.dart';
import 'header-card.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {


  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        color: const Color(0xFFdddfe3),
        child: ListView(
          children: [
             Header(),
             HeaderCard(),
            // Sliver app bar
            SizedBox(
              width: _width,
              height: _height,
              child: DefaultTabController(
                animationDuration: const Duration(milliseconds: 2),
                length: 5,
                child: NestedScrollView(
                  headerSliverBuilder: (context, value) {
                    return [
                      SliverAppBar(
                        floating: true,
                        actions: [
                          ElevatedButton(
                            onPressed: () {
                              setState(() {
                                ProfileEdit.isEditable = !ProfileEdit.isEditable;
                                print(ProfileEdit.isEditable);
                              });
                            },
                            child: const Text('Edit Profile'),
                          ),

                        ],
                        backgroundColor: Colors.white,
                        bottom: const TabBar(
                          isScrollable: true,
                          automaticIndicatorColorAdjustment: true,
                          tabs: [
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Text(
                                'Profile overview',
                                style: TextStyle(
                                    color: Color(0xFF879399),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Text(
                                'Timeline',
                                style: TextStyle(
                                    color: Color(0xFF879399),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Text(
                                'Articles',
                                style: TextStyle(
                                    color: Color(0xFF879399),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Text(
                                'Activity',
                                style: TextStyle(
                                    color: Color(0xFF879399),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.only(bottom: 14),
                              child: Text(
                                'References',
                                style: TextStyle(
                                    color: Color(0xFF879399),
                                    fontWeight: FontWeight.w600,
                                    fontSize: 14),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ];
                  },
                  body:    TabBarView(
                    children: [
                      ProfileOverview(),
                      Timeline(),
                      ProfileOverview(),
                      ProfileOverview(),
                      References()
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
