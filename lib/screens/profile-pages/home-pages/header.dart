// import 'dart:js';
// import 'dart:math';
// import 'package:flutter/material.dart';
// import 'package:auto_size_text/auto_size_text.dart';
// import 'package:holedo/screens/profile-pages/home-pages/home.dart';
//
// import '../../news/categories/news_signal.dart';
//
// //header
// class Header extends StatefulWidget {
//   const Header({
//     Key? key,
//   }) : super(key: key);
//
//   @override
//   _HeaderState createState() => _HeaderState();
// }
//
// List<DropdownMenuItem<String>> items = <String>['Peoples', 'Jobs', 'News']
//     .map<DropdownMenuItem<String>>((String value) {
//   return DropdownMenuItem<String>(value: value, child: Text(value));
// }).toList();
// String dropdownValue = 'Peoples';
//
// Widget buildMenuBtn(String menuBtn, BuildContext context, route) {
//   return TextButton(
//     onPressed: () {
//       Navigator.push(context, MaterialPageRoute(builder: (context) {
//         return route;
//       }));
//     },
//     child: AutoSizeText(
//       menuBtn,
//       maxLines: 1,
//       minFontSize: 10,
//       style: const TextStyle(
//         color: Colors.white,
//         fontSize: 16,
//       ),
//     ),
//   );
// }
//
// class _HeaderState extends State<Header> {
// // InboxHover
//   bool _inboxHover = false;
//
//   void onInboxHover(PointerHoverEvent) {
//     return setState(() {
//       _inboxHover = !_inboxHover;
//     });
//   }
//
//   void exitInboxHover(PointerHoverEvent) {
//     return setState(() {
//       _inboxHover != _inboxHover;
//     });
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     var _height = MediaQuery.of(context).size.height;
//     var _width = MediaQuery.of(context).size.width;
//     return Container(
//       height: 50,
//       width: _width,
//       color: const Color(0xFF384677),
//       child: Padding(
//         padding: EdgeInsets.symmetric(horizontal: _width * .075),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.start,
//           children: [
//             SizedBox(
//               height: 36,
//               child: Image(
//                 image: NetworkImage(
//                     'https://media.istockphoto.com/photos/yellow-black-outlined-font-letter-h-3d-picture-id1340359277?s=612x612'),
//                 fit: BoxFit.cover,
//               ),
//             ),
//             const SizedBox(
//               width: 5,
//             ),
//             SizedBox(
//               width: 250,
//               child: Card(
//                 color: const Color(0xFF1d2645),
//                 child: Row(
//                   children: [
//                     const Expanded(
//                         flex: 1,
//                         child: Icon(
//                           Icons.search_outlined,
//                           color: Colors.grey,
//                         )),
//                     const Expanded(
//                       flex: 2,
//                       child: TextField(
//                         decoration: InputDecoration(
//                             border: InputBorder.none,
//                             hintText: 'Search',
//                             hintStyle: TextStyle(color: Colors.grey)),
//                       ),
//                     ),
//                     DropdownButton(
//                       items: items,
//                       onChanged: (String? newValue) {
//                         setState(() {
//                           dropdownValue = newValue!;
//                         });
//                       },
//                       value: dropdownValue,
//                       style: const TextStyle(color: Colors.grey),
//                       borderRadius: BorderRadius.circular(5),
//                     )
//                   ],
//                 ),
//               ),
//             ),
//             buildMenuBtn('Home', context, Home()),
//             buildMenuBtn('Profile', context, Home()),
//             buildMenuBtn('News', context, NewsSingleScreen()),
//             buildMenuBtn('Jobs', context, Home()),
//             buildMenuBtn('Recruitment', context, Home()),
//             buildMenuBtn('Help', context, Home()),
//             PopUpIcon(
//               icon: Icons.mail_outline_outlined,
//             ),
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// //popup Icon
//
// class PopUpIcon extends StatefulWidget {
//   final IconData icon;
//
//   const PopUpIcon({
//     Key? key,
//     required this.icon,
//   }) : super(key: key);
//
//   @override
//   State<PopUpIcon> createState() => _PopUpIconState();
// }
//
// class _PopUpIconState extends State<PopUpIcon> {
//   bool popUp = false;
//
//   @override
//   Widget build(BuildContext context) {
//     return SizedBox(
//       height: 140.0,
//       width: 100,
//       child: Center(
//         child: Stack(
//           children: [
//             AnimatedOpacity(
//               opacity: popUp ? 1.0 : 0.0,
//               duration: Duration(milliseconds: 200),
//               child: AnimatedAlign(
//                 curve: popUp ? Curves.easeOutBack : Curves.easeIn,
//                 alignment: popUp ? Alignment(0.0, -1.0) : Alignment(0.0, 0.0),
//                 duration: Duration(milliseconds: 200),
//                 child: Stack(
//                   clipBehavior: Clip.none,
//                   children: [
//                     Positioned(
//                       right: 0,
//                       top: 55.0,
//                       child: Transform(
//                         transform: Matrix4.rotationZ(pi / 4),
//                         alignment: FractionalOffset.center,
//                         child: Container(
//                           height: 10.0,
//                           width: 10.0,
//                           color: Color(0xFF384677),
//                         ),
//                       ),
//                     ),
//                     Positioned(
//                       top: 50,
//                       child: Column(
//                         children: [
//                           InboxPopUpProfile(
//                               Icons.circle, 'title', 'subtitle', 'date')
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Align(
//               child: MouseRegion(
//                 onEnter: (value) {
//                   setState(() {
//                     popUp = true;
//                   });
//                 },
//                 onExit: (value) {
//                   setState(() {
//                     popUp = false;
//                   });
//                 },
//                 child: AnimatedContainer(
//                   height: 50,
//                   width: 70.0,
//                   duration: Duration(milliseconds: 375),
//                   decoration: BoxDecoration(
//                     color: popUp ? Color(0xFF7a85a6) : Colors.transparent,
//                   ),
//                   child: Icon(
//                     widget.icon,
//                     color: popUp ? Colors.white : Color(0xFF6C779E),
//                   ),
//                 ),
//               ),
//             )
//           ],
//         ),
//       ),
//     );
//   }
// }
//
// InboxPopUpProfile(IconData icon, String title, String subtitle, String date) {
//   return Padding(
//     padding: const EdgeInsets.all(8.0),
//     child: Container(
//       color: Colors.white,
//       child: Column(
//         crossAxisAlignment: CrossAxisAlignment.start,
//         children: [
//           Container(
//             color: Color(0xFF384677),
//             height: 30,
//             width: 300,
//             child: Row(
//               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//               children: [
//                 const Padding(
//                   padding: EdgeInsets.all(8.0),
//                   child: Text(
//                     'INBOX',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 ),
//                 Container(
//                   child: Text(
//                     'Compose',
//                     style: TextStyle(color: Colors.white),
//                   ),
//                 )
//               ],
//             ),
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               Container(
//                 margin: const EdgeInsets.only(
//                     top: 23, bottom: 23, right: 14, left: 20),
//                 height: 50,
//                 width: 50,
//                 color: Color(0xFF7a85a6),
//                 child: Icon(
//                   icon,
//                   color: Colors.white,
//                 ),
//               ),
//               Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Text(
//                     title,
//                     style: const TextStyle(
//                         fontSize: 16,
//                         fontWeight: FontWeight.w700,
//                         color: Color(0xff272E41)),
//                   ),
//                   Text(
//                     subtitle,
//                     style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xFF7a85a6)),
//                   ),
//                   Text(
//                     date,
//                     style: const TextStyle(
//                         fontSize: 14,
//                         fontWeight: FontWeight.w400,
//                         color: Color(0xff7C8990)),
//                   ),
//                 ],
//               )
//             ],
//           ),
//           Row(
//             mainAxisAlignment: MainAxisAlignment.start,
//             children: [
//               TextButton(onPressed: () {}, child: Text('View all messages')),
//             ],
//           )
//         ],
//       ),
//     ),
//   );
// }
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../common/common_widget.dart';
import '../../../constant/colorPicker/color_picker.dart';
import '../../../constant/fontStyle/font_style.dart';
import '../../../constant/sizedbox.dart';
import '../../news/update/update_news.dart';
import 'home.dart';

class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  State<Header> createState() => _HeaderState();
}

class _HeaderState extends State<Header> {
  buildHeaderGesture(
      String menuName, _fontStyle, BuildContext context, routeName) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, routeName);
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
            Padding(
              padding: const EdgeInsets.all(4.0),
              child: Image(
                image: AssetImage('assets/icons/logo1.png'),
              ),
            ),
            SB.SW10(),
            Container(
              width: Get.width * 0.2,
              decoration: BoxDecoration(
                  color: ColorPicker.kWhite,
                  borderRadius: BorderRadius.circular(5)),
              margin: EdgeInsets.all(3),
              child: TextFormField(
                cursorColor: ColorPicker.kWhite,
                style: FontTextStyle.kWhite16W400SSP,
                decoration: InputDecoration(
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
                      borderRadius: BorderRadius.circular(5)),
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
            SizedBox(
              width: Get.width * 0.02,
            ),
            Container(
              width: 380,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  buildHeaderGesture(
                      'Home', FontTextStyle.kWhite16W400PR, context, '/'),
                  buildHeaderGesture(
                      'Profile',
                      FontTextStyle.kPrimaryLightBlue16W400PR,
                      context,
                      '/home'),
                  buildHeaderGesture(
                      'News',
                      FontTextStyle.kPrimaryLightBlue16W400PR,
                      context,
                      '/home'),
                  buildHeaderGesture(
                      'Jobs',
                      FontTextStyle.kPrimaryLightBlue16W400PR,
                      context,
                      '/home'),
                  buildHeaderGesture(
                      'Recruitment',
                      FontTextStyle.kPrimaryLightBlue16W400PR,
                      context,
                      '/home'),
                  buildHeaderGesture(
                      'Help',
                      FontTextStyle.kPrimaryLightBlue16W400PR,
                      context,
                      '/home'),
                ],
              ),
            ),
            SizedBox(
              width: Get.width * 0.02,
            ),
            Container(
              width: Get.width * 0.05,
              decoration: BoxDecoration(
                  border: Border(
                      left: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3),
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: Center(
                  child: Stack(
                overflow: Overflow.visible,
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
            Container(
              width: Get.width * 0.05,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: Center(
                  child: Stack(
                overflow: Overflow.visible,
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
            Container(
              width: 90,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: Center(
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
                      color: ColorPicker.kPrimaryLight3,
                      borderRadius: BorderRadius.circular(3),
                    ),
                    child: Center(
                      child: CommonWidget.text('352',
                          style: FontTextStyle.kPrimaryLight10W700SSP),
                    ),
                  ),
                ],
              )),
            ),
            Container(
              width: Get.width * 0.05,
              decoration: BoxDecoration(
                  border: Border(
                      right: BorderSide(
                          color: ColorPicker.kPrimaryLight, width: 3))),
              child: Center(
                child: Container(
                  height: 26,
                  width: 26,
                  child: Image(
                    image: AssetImage('assets/images/avatar.png'),
                  ),
                ),
              ),
            ),
          ],
        ));
  }
}
