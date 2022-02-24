import 'package:flutter/material.dart';
import 'package:holedo/screens/profile-pages/home-pages/header.dart';
import 'package:holedo/screens/profile-pages/home-pages/profile-overview.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  Widget buildProfileMenuBtn(String profileMenuBtn) {
    return TextButton(
      onPressed: () {},
      child: Text(
        profileMenuBtn,
        style: const TextStyle(color: Color(0xFF8f9ea6), fontSize: 18),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: Container(
        color: const Color(0xFFdddfe3),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const Header(),
              const HeaderCard(),
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          RichText(
                            text: TextSpan(
                              style: const TextStyle(color: Color(0xFF171f39)),
                              children: [
                                WidgetSpan(
                                  child: Container(
                                    height: 25,
                                    width: 25,
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                            'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                          ),
                                          fit: BoxFit.cover),
                                    ),
                                  ),
                                ),
                                const TextSpan(
                                    text: 'Noberto Holden ',
                                    style: TextStyle(
                                      fontSize: 16,
                                    )),
                                const TextSpan(
                                    text: 'MHL',
                                    style: TextStyle(fontSize: 11)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        buildProfileMenuBtn('Profile overview'),
                        buildProfileMenuBtn('Timeline'),
                        buildProfileMenuBtn('Articles'),
                        buildProfileMenuBtn('Activity'),
                        buildProfileMenuBtn('References')
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        children: [
                          SizedBox(
                            height: 40,
                            child: ElevatedButton(
                              onPressed: () {},
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: const [
                                  Icon((Icons.edit)),
                                  SizedBox(width: 10),
                                  Text(
                                    'EDIT PROFILE',
                                    style: TextStyle(
                                        fontSize: 18,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w700),
                                  ),
                                ],
                              ),
                              style: ElevatedButton.styleFrom(
                                primary: const Color(0xFF0d9bdc),
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              const SizedBox(height: 25),
              const ProfileOverview(),
            ],
          ),
        ),
      ),
    );
  }
}
