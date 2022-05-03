import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:holedo/services/loginServices.dart';

import '../../controller/menu_controller.dart';
import '../profile-pages/profile/profile-page.dart';

class LogIn extends StatefulWidget {
  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  static const String route = '/four';

  final List<Item> _data = generateItems(1);

  MenuController _menuController = Get.find();

  // GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

  List drawerItem = ['Home', 'Profile', 'News', 'Jobs', 'Recruitment', 'Help'];

  buildMenuButton(String buttonName, routName) {
    return TextButton(
        onPressed: () {},
        child: Text(
          buttonName,
          style: const TextStyle(color: Color(0xff6C779E)),
        ));
  }

  ///footer
  buildFooterCard(
      IconData icon, String follower, String subtext, double height) {
    return Column(
      children: [
        Icon(
          icon,
          color: const Color(0xffB5BDC2),
          size: 25,
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(
          follower,
          style: const TextStyle(
              color: const Color(0xffB5BDC2),
              fontSize: 14,
              fontWeight: FontWeight.bold),
        ),
        SizedBox(
          height: height * 0.01,
        ),
        Text(subtext,
            style: const TextStyle(
              color: const Color(0xffB5BDC2),
              fontSize: 8,
            ))
      ],
    );
  }

  builTextButton(String textName, routName) {
    return GestureDetector(
      onTap: () {},
      child: Text(
        textName,
        style: const TextStyle(fontSize: 9, color: const Color(0xffB5BDC2)),
      ),
    );
  }

  bool checked = false;

  /// api integration functionality

  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  buildSocialButton(IconData socialIcon) {
    return Container(
      child: FaIcon(socialIcon),
    );
  }

  callLoginApi(String email, String password) {
    final service = ApiServices();
    service.apiCallLogin({
      'email': email.trim(),
      'password': password.trim(),
    }).then(
      (value) {
        if (value.error != null) {
          print('success');
          // Navigator.push(
          //   context,
          //   MaterialPageRoute(
          //     builder: (BuildContext context) {
          //       return const LogIn();
          //     },
          //   ),
          // );
        } else {
          Text('failed');
        }
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    var screenSize = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          Container(
            height: 46,
            width: double.infinity,
            color: const Color(0xff384677),
            child: Padding(
              padding:
                  EdgeInsets.symmetric(horizontal: screenSize.width * 0.027),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Expanded(
                      flex: 2,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Image.network(
                              'https://images.pexels.com/photos/9843280/pexels-photo-9843280.jpeg?auto=compress&cs=tinysrgb&w=50&h=50&dpr=1',
                              fit: BoxFit.fitWidth),
                          SizedBox(
                            width: screenSize.width * 0.012,
                          ),
                          const Text(
                            'Holedo',
                            style: TextStyle(color: Color(0xff99A7C0)),
                          ),
                        ],
                      )),
                  Expanded(
                    flex: 3,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        buildMenuButton('News', null),
                        buildMenuButton('Jobs', null),
                        buildMenuButton('Membership grades', null),
                        buildMenuButton('Recruitment', null),
                      ],
                    ),
                  ),
                  Expanded(
                    flex: 2,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        ElevatedButton.icon(
                            style:
                                ElevatedButton.styleFrom(primary: Colors.black),
                            icon: const Icon(
                              Icons.lock,
                              size: 13,
                            ),
                            onPressed: () {},
                            label: const Text(
                              'Log in',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )),
                        SizedBox(
                          width: screenSize.width * 0.01,
                        ),
                        ElevatedButton(
                            onPressed: () {},
                            child: const Text(
                              'Sign Up Free',
                              style: const TextStyle(
                                fontSize: 13,
                              ),
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 36,
          ),
          const Text(
            'Log In',
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          RichText(
              text: const TextSpan(
                  text: 'Not yet a member?',
                  style: TextStyle(
                    fontSize: 13,
                    fontWeight: FontWeight.w400,
                  ),
                  children: <TextSpan>[
                TextSpan(
                  text: 'Sign up',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Color(0xff32A3FD),
                  ),
                ),
              ])),
          const SizedBox(
            height: 132,
          ),
          Container(
            //height: 318,
            width: 435,
            color: const Color(0xffFFFFFF),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Continue with',
                        style: TextStyle(
                          fontSize: 12,
                          fontWeight: FontWeight.w500,
                        ),
                      )
                    ],
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    buildSocialButton(FontAwesomeIcons.twitter),
                    SizedBox(
                      width: screenSize.width * 0.014,
                    ),
                    // buildSocialButton(Buttons.Google),
                    buildSocialButton(FontAwesomeIcons.google),
                    SizedBox(
                      width: screenSize.width * 0.014,
                    ),
                    buildSocialButton(FontAwesomeIcons.linkedinIn),
                    SizedBox(
                      width: screenSize.width * 0.014,
                    ),
                    buildSocialButton(FontAwesomeIcons.facebook),
                    SizedBox(
                      width: screenSize.width * 0.014,
                    ),
                    buildSocialButton(FontAwesomeIcons.apple),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 14.0, bottom: 12.0),
                  child: Text(
                    'Or',
                    style: TextStyle(
                      fontSize: 12,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    children: [
                      TextField(
                        controller: emailController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'Username or email address',
                          fillColor: Colors.black12,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      TextField(
                        controller: passwordController,
                        obscureText: false,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(5)),
                          hintText: 'Password',
                          fillColor: Colors.grey,
                        ),
                      ),
                      const SizedBox(
                        height: 12,
                      ),
                      SizedBox(
                        width: 379,
                        height: 42,
                        child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                primary: const Color(0xff32A3FD)),
                            onPressed: () {
                              callLoginApi(emailController.toString(),
                                  passwordController.toString());
                            },
                            child: const Text(
                              'LOG IN NOW',
                              style: TextStyle(
                                fontSize: 13,
                              ),
                            )),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Checkbox(
                                  checkColor: Colors.white,
                                  value: checked,
                                  onChanged: (bool? value) {
                                    setState(() {
                                      checked = value!;
                                    });
                                  })
                            ],
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: const [
                              Text('Keep me logged in',
                                  style: TextStyle(
                                    fontSize: 11,
                                  )),
                            ],
                          ),
                          SizedBox(
                            width: screenSize.width * 0.105,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: const [
                              Text('Forgot your password',
                                  style: TextStyle(
                                    color: Color(0xffB5BDC2),
                                    fontSize: 11,
                                  )),
                            ],
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          const SizedBox(
            height: 126,
          ),
          Container(
            padding: const EdgeInsets.fromLTRB(130, 55.4, 130, 20),
            // height: 370,
            width: double.infinity,
            color: const Color.fromRGBO(29, 38, 69, 1),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildFooterCard(Icons.facebook_outlined, '67.9k', 'FANS',
                        screenSize.height),
                    buildFooterCard(Icons.facebook_outlined, '4.0k',
                        'FOLLOWERS', screenSize.height),
                    buildFooterCard(Icons.youtube_searched_for_outlined, '105',
                        'SUBSCRIBERS', screenSize.height),
                    buildFooterCard(Icons.facebook_outlined, '48.7k',
                        'FOLLOWERS', screenSize.height),
                  ],
                ),
                const SizedBox(
                  height: 17,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    buildFooterCard(Icons.linked_camera_outlined, '1.2k',
                        'FOLLOWERS', screenSize.height),
                    buildFooterCard(Icons.facebook_outlined, '268', 'FANS',
                        screenSize.height),
                    buildFooterCard(Icons.facebook_outlined, '95', 'FOLLOWERS',
                        screenSize.height),
                    buildFooterCard(Icons.favorite_border, '122.2k',
                        'FANS LOVE US', screenSize.height),
                  ],
                ),
                const SizedBox(
                  height: 40,
                ),
                const Divider(height: 2, color: Color(0xffDADEE0)),
                const SizedBox(
                  height: 25,
                ),
                Row(
                  children: [
                    Expanded(
                      flex: 3,
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Image.network(
                                  'https://images.pexels.com/photos/9843280/pexels-photo-9843280.jpeg?auto=compress&cs=tinysrgb&w=30&h=30&dpr=1',
                                  fit: BoxFit.cover),
                              SizedBox(
                                width: screenSize.width * 0.0095,
                              ),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  IntrinsicHeight(
                                    child: Row(
                                      children: [
                                        builTextButton('Hospitality.pro', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Home', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Help', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Login', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Register', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Industry News', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Jobs', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Publish', null),
                                        const VerticalDivider(
                                          color: Color(0xffB5BDC2),
                                          thickness: 1,
                                        ),
                                        builTextButton('Recruitment', null),
                                      ],
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 3,
                                  ),
                                  Row(
                                    children: const [
                                      Text(
                                        'Hospitality Leaders Ltd. All Rights Reserved. Imprint. Terms of service. Privacy Protection',
                                        style: TextStyle(
                                          fontSize: 9,
                                          color: Color(0xffB5BDC2),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: const [
                          Text(
                            'Privacy Policy',
                            style: TextStyle(
                              fontSize: 9,
                              color: Color(0xffB5BDC2),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
