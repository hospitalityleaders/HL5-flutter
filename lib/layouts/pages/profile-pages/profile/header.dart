import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:holedo/controller/menu_controller.dart';
import 'package:holedo/common/common_widget.dart';
import 'package:holedo/constant/colorPicker/color_picker.dart';
import 'package:holedo/constant/fontStyle/font_style.dart';
import 'package:holedo/constant/sizedbox.dart';

import 'package:holedo/services/holedo_api_services.dart';

class Header extends StatefulWidget {
  const Header({
    Key? key,
  }) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  ///logout functionality

  final ApiServices _apiServices = ApiServices();

  final MenuController _controller = Get.find();
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
  List drawerItem = ['Home', 'Profile', 'News', 'Jobs', 'Recruitment', 'Help'];

  Widget buildHeaderGesture(
    String menuName,
    TextStyle _fontStyle,
    BuildContext context,
    routeName,
    int index,
  ) {
    return GestureDetector(
      onTap: () {
        _controller.setIndex(index);
        debugPrint('$index');
      },
      child: Text(menuName, style: _fontStyle),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 46,
      width: MediaQuery.of(context).size.width,
      color: ColorPicker.kPrimaryLight1,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Padding(
            padding: EdgeInsets.all(4.0),
            child: Image(
              image: AssetImage('assets/icons/logo1.png'),
            ),
          ),
          SB.SW10(),
          Container(
            width: Get.width * 0.2,
            decoration: BoxDecoration(
              color: ColorPicker.kWhite,
              borderRadius: BorderRadius.circular(5),
            ),
            margin: const EdgeInsets.all(3),
            child: TextFormField(
              cursorColor: ColorPicker.kWhite,
              style: FontTextStyle.kWhite16W400SSP,
              decoration: InputDecoration(
                hintStyle: FontTextStyle.kPrimaryLightBlue16W400SSP,
                filled: true,
                fillColor: ColorPicker.kPrimaryLight,
                hintText: "Search",
                border: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorPicker.kPrimary),
                  borderRadius: BorderRadius.circular(5),
                ),
                focusedBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorPicker.kPrimary),
                  borderRadius: BorderRadius.circular(5),
                ),
                enabledBorder: OutlineInputBorder(
                  borderSide: const BorderSide(color: ColorPicker.kPrimary),
                  borderRadius: BorderRadius.circular(5),
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: ColorPicker.kPrimaryLightBlue,
                ),
                suffixIcon: Container(
                  margin: const EdgeInsets.only(right: 5, bottom: 5, top: 5),
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
          SizedBox(
            width: 380,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                buildHeaderGesture(
                  'Home',
                  FontTextStyle.kWhite16W400PR,
                  context,
                  '/home',
                  0,
                ),
                buildHeaderGesture(
                  'Profile',
                  FontTextStyle.kPrimaryLightBlue16W400PR,
                  context,
                  '/home',
                  1,
                ),
                buildHeaderGesture(
                  'News',
                  FontTextStyle.kPrimaryLightBlue16W400PR,
                  context,
                  '/home',
                  2,
                ),
                buildHeaderGesture(
                  'Jobs',
                  FontTextStyle.kPrimaryLightBlue16W400PR,
                  context,
                  '/home',
                  3,
                ),
                buildHeaderGesture(
                  'Recruitment',
                  FontTextStyle.kPrimaryLightBlue16W400PR,
                  context,
                  '/home',
                  4,
                ),
                buildHeaderGesture(
                  'Help',
                  FontTextStyle.kPrimaryLightBlue16W400PR,
                  context,
                  '/home',
                  5,
                ),
              ],
            ),
          ),
          SizedBox(
            width: Get.width * 0.02,
          ),
          Container(
            width: Get.width * 0.05,
            decoration: const BoxDecoration(
              border: Border(
                left: BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
                right: BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
              ),
            ),
            child: Center(
              child: Stack(
                // //overflow: Overflow.visible,
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
          Container(
            width: Get.width * 0.05,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: ColorPicker.kPrimaryLight,
                  width: 3,
                ),
              ),
            ),
            child: Center(
              child: Stack(
                // //overflow: Overflow.visible,
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
          Container(
            width: 90,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(
                  color: ColorPicker.kPrimaryLight,
                  width: 3,
                ),
              ),
            ),
            child: Center(
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
                      color: ColorPicker.kPrimaryLight3,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: CommonWidget.text(
                        '352',
                        style: FontTextStyle.kPrimaryLight10W700SSP,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            width: Get.width * 0.05,
            decoration: const BoxDecoration(
              border: Border(
                right: BorderSide(color: ColorPicker.kPrimaryLight, width: 3),
              ),
            ),
            child: Center(
              child: SizedBox(
                height: 26,
                width: 26,
                child: const Image(
                  image: AssetImage('assets/images/avatar.png'),
                ),
              ),
            ),
          ),
          // TextButton(
          //     onPressed: () async {
          //       // await _apiServices.logout('${userData.read('token')}');
          //       await _apiServices.logout(
          //           '${Get.put(AuthController()).restoreModel().token}');
          //       Routemaster.of(context).push("/login");
          //     },
          //     child: Text('Log out'))
        ],
      ),
    );
  }
}
