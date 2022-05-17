import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:holedo/controller/auth_controller.dart';
import 'package:holedo/services/loginServices.dart';
import 'package:holedo/utils/validator.dart';
import '../../controller/menu_controller.dart';
import '../news/update/update_news.dart';
import '../profile-pages/profile/profile-page.dart';

class LogIn extends StatefulWidget {
  static const String route = '/login';

  const LogIn({Key? key}) : super(key: key);

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final List<Item> _data = generateItems(1);
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();
  final ApiServices _apiClient = ApiServices();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  bool _showPassword = false;
  bool checked = false;
  MenuController _menuController = Get.find();
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();

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
  // buildFooterCard(
  //     IconData icon, String follower, String subtext, double height) {
  //   return Column(
  //     children: [
  //       Icon(
  //         icon,
  //         color: const Color(0xffB5BDC2),
  //         size: 25,
  //       ),
  //       SizedBox(
  //         height: height * 0.01,
  //       ),
  //       Text(
  //         follower,
  //         style: const TextStyle(
  //             color: const Color(0xffB5BDC2),
  //             fontSize: 14,
  //             fontWeight: FontWeight.bold),
  //       ),
  //       SizedBox(
  //         height: height * 0.01,
  //       ),
  //       Text(subtext,
  //           style: const TextStyle(
  //             color: const Color(0xffB5BDC2),
  //             fontSize: 8,
  //           ))
  //     ],
  //   );
  // }
  //
  // builTextButton(String textName, routName) {
  //   return GestureDetector(
  //     onTap: () {},
  //     child: Text(
  //       textName,
  //       style: const TextStyle(fontSize: 9, color: const Color(0xffB5BDC2)),
  //     ),
  //   );
  // }

  /// api integration functionality

  // buildSocialButton(IconData socialIcon) {
  //   return Container(
  //     child: FaIcon(socialIcon),
  //   );
  // }
  //
  // callLoginApi(String email, String password) {
  //   final service = ApiServices();
  //   service.apiCallLogin({
  //     'email': email.trim(),
  //     'password': password.trim(),
  //   }).then(
  //     (value) {
  //       if (value.error != null) {
  //         print('success');
  //         // Navigator.push(
  //         //   context,
  //         //   MaterialPageRoute(
  //         //     builder: (BuildContext context) {
  //         //       return const LogIn();
  //         //     },
  //         //   ),
  //         // );
  //       } else {
  //         Text('failed');
  //       }
  //     },
  //   );
  // }

  final userData = GetStorage();

  Future<void> login() async {
    if (_formKey.currentState!.validate()) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: const Text('Processing Data'),
          backgroundColor: Colors.green.shade300,
        ),
      );

      dynamic res = await _apiClient.login(
        emailController.text,
        passwordController.text,
      );

      ScaffoldMessenger.of(context).hideCurrentSnackBar();

      if (res['errors'] == null) {
        String accessToken = res['data']['token'];
        print(accessToken);

        userData.write('token', accessToken);
        userData.write('isLoggedIn', true);

        final model = Get.put(AuthController()).restoreModel();
        model.setToken = accessToken;
        model.setIsLogined = true;
        Get.find<AuthController>().authModel(model);

        Navigator.push(
          context,
          MaterialPageRoute(
              builder: (context) =>
                  _menuController.menuIndex == 0 ? UpdateNews() : LogIn()),
        );
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Error: ${res['messages']}'),
            backgroundColor: Colors.red.shade300,
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.blueGrey[200],
      body: Form(
        key: _formKey,
        child: Stack(children: [
          SizedBox(
            width: size.width,
            height: size.height,
            child: Align(
              alignment: Alignment.center,
              child: Container(
                width: size.width * 0.85,
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(20),
                ),
                child: SingleChildScrollView(
                  child: Center(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        // SizedBox(height: size.height * 0.08),
                        const Center(
                          child: Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.06),
                        TextFormField(
                          controller: emailController,
                          validator: (value) {
                            return Validator.validateEmail(value ?? "");
                          },
                          decoration: InputDecoration(
                            hintText: "Email",
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.03),
                        TextFormField(
                          obscureText: _showPassword,
                          controller: passwordController,
                          validator: (value) {
                            return Validator.validatePassword(value ?? "");
                          },
                          decoration: InputDecoration(
                            suffixIcon: GestureDetector(
                              onTap: () {
                                setState(() => _showPassword = !_showPassword);
                              },
                              child: Icon(
                                _showPassword
                                    ? Icons.visibility
                                    : Icons.visibility_off,
                                color: Colors.grey,
                              ),
                            ),
                            hintText: "Password",
                            isDense: true,
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                            ),
                          ),
                        ),
                        SizedBox(height: size.height * 0.04),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Expanded(
                              child: ElevatedButton(
                                onPressed: login,
                                style: ElevatedButton.styleFrom(
                                    primary: Colors.indigo,
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 40, vertical: 15)),
                                child: const Text(
                                  "Login",
                                  style: TextStyle(
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ]),
      ),
    );
  }
}
