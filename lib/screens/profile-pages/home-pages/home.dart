import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/profile-edit/profile-edit.dart';
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
        child: DefaultTabController(
          animationDuration: const Duration(milliseconds: 2),
          length: 5,
          child: NestedScrollView(
            scrollDirection: Axis.vertical,
            headerSliverBuilder: (context, innerBoxIsScrolled) {
              return [
                SliverToBoxAdapter(
                  child: Column(
                    children: [
                      HeaderCard(),
                      Container(
                        height: 46,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 50.0),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  Container(
                                    height: 26,
                                    width: 26,
                                    decoration: const BoxDecoration(
                                        image: DecorationImage(
                                            image: NetworkImage(
                                                'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'))),
                                  ),
                                  const Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 8.0),
                                    child: Text(
                                      'Noberto Holden',
                                      style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.w700,
                                          color: Color(0xFF272E41)),
                                    ),
                                  ),
                                  const Text(
                                    'MHL',
                                    style: TextStyle(
                                      fontSize: 12,
                                      fontWeight: FontWeight.w700,
                                      color: Color(0xFF272E41),
                                    ),
                                  ),
                                ],
                              ),
                              Row(
                                children: const [
                                  TabBar(
                                    isScrollable: true,
                                    automaticIndicatorColorAdjustment: true,
                                    tabs: [
                                      Padding(
                                        padding:
                                            EdgeInsets.symmetric(vertical: 15),
                                        child: Text(
                                          'Profile overview',
                                          style: TextStyle(
                                              color: Color(0xFF879399),
                                              fontWeight: FontWeight.w600,
                                              fontSize: 14),
                                        ),
                                      ),
                                      Text(
                                        'Timeline',
                                        style: TextStyle(
                                            color: Color(0xFF879399),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        'Articles',
                                        style: TextStyle(
                                            color: Color(0xFF879399),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        'Activity',
                                        style: TextStyle(
                                            color: Color(0xFF879399),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                      Text(
                                        'References',
                                        style: TextStyle(
                                            color: Color(0xFF879399),
                                            fontWeight: FontWeight.w600,
                                            fontSize: 14),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                              Container(
                                height: 36,
                                child: ElevatedButton.icon(
                                  onPressed: () {
                                    ProfileEdit.isEditable? setState(() {
                                      ProfileEdit.isEditable =false;

                                    }):

                                    setState(() {
                                      ProfileEdit.isEditable =true;

                                    });

                                  },
                                  icon: ProfileEdit.isEditable
                                      ? Icon(
                                          Icons.done,
                                          size: 9,
                                        )
                                      : Icon(
                                          Icons.edit,
                                          size: 9,
                                        ),
                                  label: ProfileEdit.isEditable
                                      ? Text(
                                          'Done editing',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        )
                                      : Text(
                                          'Edit Profile',
                                          style: TextStyle(
                                              fontWeight: FontWeight.w400,
                                              fontSize: 14),
                                        ),
                                  style: ElevatedButton.styleFrom(
                                      primary: ProfileEdit.isEditable
                                          ? Color(0xFF7DC81B)
                                          : Color(0xFF32A3FD)),
                                ),
                              ),
                            ],
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ];
            },
            body: TabBarView(
              children: [
                ProfileOverview(),
                Timeline(),
                ProfileOverview(),
                ProfileOverview(),
                References(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
