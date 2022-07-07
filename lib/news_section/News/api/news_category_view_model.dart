import 'package:get/get.dart';

import 'package:holedo/common/pref_manager.dart';
import 'package:holedo/news_section/News/api/api_response.dart';
import 'package:holedo/news_section/News/repo/news_category_repo.dart';
import 'package:holedo/news_section/News/response_model/news_category_response_model.dart';

class NewsCategoryViewModel extends GetxController {
  ApiResponse _apiResponse = ApiResponse.initial(message: 'Initialization');

  ApiResponse get apiResponse => _apiResponse;

  int currentPage = 1;
  bool circularBool = false;
  // int currentPage = 1;
  late int totalPages;
  List<Article> newsCategoryList = [];
  List<Article> newsCategoryListMOB = [];
  List<Article> newsCategoryListFirstData = [];

  void onInit() {
    print('--------onInit--------------------newsCategoryViewModel');
    newsCategoryViewModel('1');

    super.onInit();
  }

  Future<void> newsCategoryViewModel(String page) async {
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      NewsCategoryResponseModel response =
          await NewsCategoryRepo().newsCategoryRepo(page);

      _apiResponse = ApiResponse.complete(response);

      for (int i = 0; i < response.data!.articles!.length; i++) {
        if (i < 2 && newsCategoryListFirstData.length < 2) {
          newsCategoryListFirstData.add(response.data!.articles![i]);
        }
      }

      if (int.parse(page) < 2) {
        newsCategoryList.addAll(response.data!.articles!.skip(2));
        // print('if-if-if-if-if');
      } else {
        newsCategoryList.addAll(response.data!.articles!);
        // print('circularBool: $circularBool');
        // print('else-else-else-else-else');
      }

      newsCategoryListMOB.addAll(response.data!.articles!);
      PreferenceManager.setNewsDataId('${newsCategoryListFirstData[0].id}');
      // print('newsCategoryList---------${newsCategoryListFirstData[0].id}');
      circularBool = false;
      // print('circularBool: $circularBool');
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
  }

  setCircularBool() {
    circularBool = true;
    print('circularBool: $circularBool');
    update();
  }

  Future<bool> getNewsCategory({bool isRefresh = false, String? page}) async {
    totalPages = (newsCategoryList.length / 10) as int;

    print('page------page--------getNewsCategory--------${page}');

    if (isRefresh) {
    } else {
      if (currentPage >= totalPages) {
        // refreshController.loadNoData();
        return false;
      }
    }
    print('currentPage------------${currentPage}');
    print('currentPage >= totalPages----${currentPage >= totalPages}');

    newsCategoryViewModel(page!);

    if (apiResponse.status == Status.COMPLETE) {
      return true;
    } else {
      return false;
    }

    // GetBuilder<NewsCategoryViewModel>(
    //   builder: (controller) {
    //     print('_res----: ${controller.apiResponse.status}');
    //     if (controller.apiResponse.status == Status.COMPLETE &&
    //         controller.circularBool == false) {
    //       NewsCategoryResponseModel _res = controller.apiResponse.data;
    //       print('count----: ${_res.data!.count}');
    //       // print('imageFilename----: ${_res.results![0].imageFilename}');
    //
    //       if (isRefresh) {
    //         newsCategoryList = _res.data!.jobs!;
    //       } else {
    //         newsCategoryList.addAll(_res.data!.jobs!);
    //       }
    //       currentPage++;
    //       totalPages = _res.data!.count!;
    //
    //       return Container(
    //         margin: EdgeInsets.symmetric(horizontal: 10),
    //         child: Row(
    //           crossAxisAlignment: CrossAxisAlignment.start,
    //           mainAxisAlignment: MainAxisAlignment.center,
    //           children: [
    //             Container(
    //               width: Get.width * 0.55,
    //               child: Column(
    //                 crossAxisAlignment: CrossAxisAlignment.start,
    //                 children: [
    //                   SizedBox(
    //                     height: Get.height * 0.03,
    //                   ),
    //                   Container(
    //                     width: Get.width,
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       border: Border.symmetric(
    //                           vertical: BorderSide(color: Colors.white)),
    //                     ),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         SizedBox(
    //                           height: Get.height * 0.01,
    //                         ),
    //                         Container(
    //                           height: Get.height * 0.40,
    //                           width: Get.width,
    //                           child: Image(
    //                             fit: BoxFit.cover,
    //                             image: NetworkImage(
    //                                 '${_res.data!.jobs![0].bannerImage}'),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 10,
    //                         ),
    //                         Text(
    //                           'RESOURCES',
    //                           style: FontTextStyle.kGreyLight712W700SSP,
    //                         ),
    //                         Text(
    //                           '${_res.data!.jobs![0].title}',
    //                           style: FontTextStyle.kBlueDark136W400SSP,
    //                         ),
    //                         SizedBox(
    //                           height: 10,
    //                         ),
    //                         IntrinsicHeight(
    //                           child: Row(
    //                             children: [
    //                               RichText(
    //                                 text: TextSpan(
    //                                   text: "By : ",
    //                                   style:
    //                                   FontTextStyle.kGreyLight5146W400SSP,
    //                                   children: [
    //                                     TextSpan(
    //                                         text:
    //                                         "${_res.data!.jobs![0].user!.fullName}  •  ",
    //                                         style: FontTextStyle
    //                                             .kGreyLight5146W400SSP),
    //                                     TextSpan(
    //                                         text:
    //                                         "${Jiffy(_res.data!.jobs![0].created!).format('do MMMM yyyy • h:mm')}",
    //                                         style: FontTextStyle
    //                                             .kGreyLight5146W400SSP),
    //                                     // TextSpan(
    //                                     //     text: "  10:40",
    //                                     //     style: FontTextStyle
    //                                     //         .kGreyLight5146W400SSP),
    //                                   ],
    //                                 ),
    //                               ),
    //                               SizedBox(
    //                                 width: Get.width * 0.01,
    //                               ),
    //                               VerticalDivider(
    //                                 thickness: 1,
    //                               ),
    //                               SizedBox(
    //                                 width: Get.width * 0.01,
    //                               ),
    //                               Container(
    //                                 child: Row(
    //                                   children: [
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/facebook.svg'),
    //                                     Text(
    //                                       '  • 112',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/twitter.svg'),
    //                                     Text('  • 56',
    //                                         style: FontTextStyle
    //                                             .kGreyLight5146W400SSP),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/googleplus.svg'),
    //                                     Text(
    //                                       '  • 321',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     Image.asset(
    //                                         'assets/icons/svg/linkdin.png',
    //                                         height: 20),
    //                                     Text(
    //                                       '  • 22',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/any.svg'),
    //                                     Text(
    //                                       '  • 13',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: Get.height * 0.02,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: Get.height * 0.01,
    //                   ),
    //                   Container(
    //                     width: Get.width,
    //                     decoration: BoxDecoration(
    //                       color: Colors.white,
    //                       border: Border.symmetric(
    //                           vertical: BorderSide(color: Colors.white)),
    //                     ),
    //                     child: Column(
    //                       crossAxisAlignment: CrossAxisAlignment.start,
    //                       children: [
    //                         SizedBox(
    //                           height: Get.height * 0.01,
    //                         ),
    //                         Container(
    //                           height: Get.height * 0.40,
    //                           width: Get.width,
    //                           child: Image(
    //                             fit: BoxFit.cover,
    //                             image: NetworkImage(
    //                                 '${_res.data!.jobs![1].bannerImage}'),
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: 10,
    //                         ),
    //                         Text(
    //                           'RESOURCES',
    //                           style: FontTextStyle.kGreyLight513W700SSP,
    //                         ),
    //                         Text(
    //                           '${_res.data!.jobs![1].title}',
    //                           style: FontTextStyle.kBlueDark136W400SSP,
    //                         ),
    //                         SizedBox(
    //                           height: 10,
    //                         ),
    //                         IntrinsicHeight(
    //                           child: Row(
    //                             children: [
    //                               RichText(
    //                                 text: TextSpan(
    //                                   text: "By : ",
    //                                   style:
    //                                   FontTextStyle.kGreyLight5146W400SSP,
    //                                   children: [
    //                                     TextSpan(
    //                                         text:
    //                                         "${_res.data!.jobs![1].user!.fullName}  •  ",
    //                                         style: FontTextStyle
    //                                             .kGreyLight5146W400SSP),
    //                                     TextSpan(
    //                                         text:
    //                                         "${Jiffy(_res.data!.jobs![1].created!).format('do MMMM yyyy • h:mm')}",
    //                                         style: FontTextStyle
    //                                             .kGreyLight5146W400SSP),
    //                                     // TextSpan(
    //                                     //     text: "  10:40",
    //                                     //     style: FontTextStyle
    //                                     //         .kGreyLight5146W400SSP),
    //                                   ],
    //                                 ),
    //                               ),
    //                               SizedBox(
    //                                 width: Get.width * 0.01,
    //                               ),
    //                               VerticalDivider(
    //                                 thickness: 1,
    //                               ),
    //                               SizedBox(
    //                                 width: Get.width * 0.01,
    //                               ),
    //                               Container(
    //                                 child: Row(
    //                                   children: [
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/facebook.svg'),
    //                                     Text(
    //                                       '  • 112',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/twitter.svg'),
    //                                     Text(
    //                                       '  • 56',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/googleplus.svg'),
    //                                     Text(
    //                                       '  • 321',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     Image.asset(
    //                                         'assets/icons/svg/linkdin.png',
    //                                         height: 20),
    //                                     Text(
    //                                       '  • 22',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.01,
    //                                     ),
    //                                     SvgPicture.asset(
    //                                         'assets/icons/svg/any.svg'),
    //                                     Text(
    //                                       '  • 13',
    //                                       style: FontTextStyle
    //                                           .kGreyLight5146W400SSP,
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ),
    //                             ],
    //                           ),
    //                         ),
    //                         SizedBox(
    //                           height: Get.height * 0.02,
    //                         ),
    //                       ],
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: Get.height * 0.03,
    //                   ),
    //                   Container(
    //                     padding: EdgeInsets.all(10),
    //                     child: GridView.builder(
    //                       shrinkWrap: true,
    //                       physics: NeverScrollableScrollPhysics(),
    //                       gridDelegate:
    //                       SliverGridDelegateWithFixedCrossAxisCount(
    //                           childAspectRatio:
    //                           Get.width / (Get.height / 0.75),
    //                           crossAxisCount: 2,
    //                           mainAxisSpacing: 10,
    //                           crossAxisSpacing: 10),
    //                       itemCount: _res.data!.jobs!.length,
    //                       itemBuilder: (context, index) {
    //                         print(
    //                             '_res.data!.jobs!.length----------${_res.data!.jobs!.length}');
    //                         return index > 1
    //                             ? GestureDetector(
    //                           onTap: () {
    //                             Get.to(NewsSingleLoggedInScreen());
    //                           },
    //                           child: Container(
    //                             padding: EdgeInsets.all(8),
    //                             width: Get.width * 0.25,
    //                             decoration: BoxDecoration(
    //                                 color: Colors.white,
    //                                 border: Border(
    //                                   bottom: BorderSide(
    //                                       color: Colors.white, width: 4),
    //                                 )),
    //                             child: Column(
    //                               crossAxisAlignment:
    //                               CrossAxisAlignment.start,
    //                               children: [
    //                                 Container(
    //                                   height: Get.height * 0.20,
    //                                   width: Get.width,
    //                                   child: Image(
    //                                       fit: BoxFit.fill,
    //                                       image: NetworkImage(
    //                                           '${_res.data!.jobs![index].bannerImage}')),
    //                                 ),
    //                                 SizedBox(
    //                                   height: 7,
    //                                 ),
    //                                 Flexible(
    //                                   child: Text(
    //                                     '${_res.data!.jobs![index].title}',
    //                                     style: FontTextStyle
    //                                         .kBlueDark118W700SSP,
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   height: 7,
    //                                 ),
    //                                 RichText(
    //                                   text: TextSpan(
    //                                     text: "By : ",
    //                                     style: FontTextStyle
    //                                         .kGreyLight514W600PR,
    //                                     children: [
    //                                       TextSpan(
    //                                           text:
    //                                           "${_res.data!.jobs![index].user!.fullName}  •  ",
    //                                           style: FontTextStyle
    //                                               .kGreyLight514W600PR),
    //                                       TextSpan(
    //                                           text:
    //                                           "${Jiffy(_res.data!.jobs![index].created!).format('do MMMM yyyy • h:mm')}",
    //                                           style: FontTextStyle
    //                                               .kGreyLight514W600PR),
    //                                       // TextSpan(
    //                                       //     text: "  10:40",
    //                                       //     style: FontTextStyle
    //                                       //         .kGreyLight514W600PR),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(
    //                                   height: 12,
    //                                 ),
    //                                 data[index]['text2']
    //                                     .toString()
    //                                     .isEmpty
    //                                     ? SizedBox()
    //                                     : Container(
    //                                   height: 20,
    //                                   width: 92,
    //                                   color: Color(0xFFFECDCC),
    //                                   child: Center(
    //                                     child: Text(
    //                                       '${data[index]['text2']}',
    //                                       style: FontTextStyle
    //                                           .kRed210W700SSP,
    //                                     ),
    //                                   ),
    //                                 )
    //                               ],
    //                             ),
    //                           ),
    //                         )
    //                             : SizedBox();
    //                       },
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: Get.height * 0.01,
    //                   ),
    //                   GestureDetector(
    //                     onTap: () {
    //                       controller.setCircularBool();
    //                       print(
    //                           '----------length-------------------${_res.data!.jobs!.length + 10}');
    //                       controller
    //                           .newsCategoryViewModel(
    //                           '${_res.data!.jobs!.length + 10}')
    //                           .then((value) {
    //                         if (controller.apiResponse.status ==
    //                             Status.COMPLETE) {
    //                           NewsCategoryResponseModel _res =
    //                               controller.apiResponse.data;
    //                           controller.setCircularBool();
    //                         }
    //                       });
    //                       // setState(() {});
    //                     },
    //                     child: Align(
    //                       alignment: Alignment.center,
    //                       child: Container(
    //                         height: 52,
    //                         width: 119,
    //                         color: Color(0xFF32A3FD),
    //                         child: Center(
    //                           child: Text(
    //                             'LOAD MORE',
    //                             style: TextStyle(
    //                               color: Colors.white,
    //                               fontSize: 14,
    //                               fontWeight: FontWeight.w600,
    //                             ),
    //                           ),
    //                         ),
    //                       ),
    //                     ),
    //                   ),
    //                   SizedBox(
    //                     height: Get.height * 0.03,
    //                   ),
    //                 ],
    //               ),
    //             ),
    //             SizedBox(
    //               width: Get.width * 0.01,
    //             ),
    //             Column(
    //               crossAxisAlignment: CrossAxisAlignment.start,
    //               children: [
    //                 SizedBox(
    //                   height: Get.height * 0.035,
    //                 ),
    //                 Container(
    //                   height: 815, // height: Get.height,
    //                   width: 373,
    //
    //                   color: ColorPicker.kPrimaryLight,
    //                   child: Stack(
    //                     children: [
    //                       Positioned(
    //                         top: -1,
    //                         left: 0,
    //                         child: Container(
    //                           // height: Get.height * 0.3,
    //                           width: 100,
    //                           child: Image(
    //                               image: AssetImage('assets/images/round.png'),
    //                               fit: BoxFit.fitWidth),
    //                         ),
    //                       ),
    //                       Padding(
    //                         padding: EdgeInsets.symmetric(
    //                             horizontal: 20, vertical: Get.width * 0.025),
    //                         child: Column(
    //                           children: [
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 IntrinsicWidth(
    //                                   child: Column(
    //                                     // mainAxisAlignment:
    //                                     //     MainAxisAlignment.start,
    //                                     children: [
    //                                       Icon(
    //                                         Icons.apartment_rounded,
    //                                         color: Color(0xFF546088),
    //                                       ),
    //                                       Container(
    //                                         width: 2,
    //                                         height: 150,
    //                                         color: Color(0xFF546088),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 ),
    //                                 SizedBox(width: 20),
    //                                 Column(
    //                                   crossAxisAlignment:
    //                                   CrossAxisAlignment.start,
    //                                   children: [
    //                                     // SizedBox(height: 30),
    //                                     Text(
    //                                       'SIGN UP TO JOIN',
    //                                       style: TextStyle(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontSize: 12,
    //                                         color: Colors.white,
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.15,
    //                                       child: Text(
    //                                         'Get priority news access',
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontSize: 36,
    //                                           color: Colors.white,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Column(
    //                                   // mainAxisAlignment:
    //                                   //     MainAxisAlignment.start,
    //                                   children: [
    //                                     Icon(
    //                                       Icons.verified,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                     Container(
    //                                       width: 2,
    //                                       height: Get.height * 0.078,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(width: 20),
    //                                 Column(
    //                                   crossAxisAlignment:
    //                                   CrossAxisAlignment.start,
    //                                   children: [
    //                                     Text(
    //                                       'All the latest news',
    //                                       style: TextStyle(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontSize: 16,
    //                                         color: Colors.white,
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.15,
    //                                       child: Text(
    //                                         'Stay up to date with news from the tourism and hospitality industry.',
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontSize: 14,
    //                                           color: Colors.white,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                             SizedBox(height: 10),
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Column(
    //                                   // mainAxisAlignment:
    //                                   //     MainAxisAlignment.start,
    //                                   children: [
    //                                     Icon(
    //                                       Icons.verified,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                     Container(
    //                                       width: 2,
    //                                       height: Get.height * 0.078,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(width: 20),
    //                                 Column(
    //                                   crossAxisAlignment:
    //                                   CrossAxisAlignment.start,
    //                                   children: [
    //                                     Text(
    //                                       'Credible sources',
    //                                       style: TextStyle(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontSize: 16,
    //                                         color: Colors.white,
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.15,
    //                                       child: Text(
    //                                         'I’ts gathered from hundreds of trusted sources and updates in real time.',
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontSize: 14,
    //                                           color: Colors.white,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                             SizedBox(height: 10),
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Column(
    //                                   // mainAxisAlignment:
    //                                   //     MainAxisAlignment.start,
    //                                   children: [
    //                                     Icon(
    //                                       Icons.verified,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                     Container(
    //                                       width: 2,
    //                                       height: Get.height * 0.078,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(width: 20),
    //                                 Column(
    //                                   crossAxisAlignment:
    //                                   CrossAxisAlignment.start,
    //                                   children: [
    //                                     Text(
    //                                       'Wide scope of research',
    //                                       style: TextStyle(
    //                                         fontWeight: FontWeight.w700,
    //                                         fontSize: 16,
    //                                         color: Colors.white,
    //                                       ),
    //                                     ),
    //                                     SizedBox(
    //                                       width: Get.width * 0.15,
    //                                       child: Text(
    //                                         'We cover all aspects of the tourism and hospitality sectors including airlines, tour operators, hotels, education, research and more.',
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w400,
    //                                           fontSize: 14,
    //                                           color: Colors.white,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Column(
    //                                   // mainAxisAlignment:
    //                                   //     MainAxisAlignment.start,
    //                                   children: [
    //                                     SizedBox(width: 24),
    //                                     Container(
    //                                       width: 2,
    //                                       height: Get.height * 0.078,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(width: 20),
    //                                 Container(
    //                                     height: 36,
    //                                     width: 248,
    //                                     decoration: BoxDecoration(
    //                                       color: Colors.white,
    //                                       borderRadius:
    //                                       BorderRadius.circular(2),
    //                                     ),
    //                                     child: Center(
    //                                       child: Row(
    //                                         mainAxisAlignment:
    //                                         MainAxisAlignment.center,
    //                                         children: [
    //                                           Icon(Icons.person_add, size: 15),
    //                                           Text(
    //                                             'Sign up now. It’s free',
    //                                             style: TextStyle(
    //                                               color: Color(0xFF272E41),
    //                                               fontSize: 14,
    //                                               fontWeight: FontWeight.w600,
    //                                             ),
    //                                           ),
    //                                         ],
    //                                       ),
    //                                     )),
    //                               ],
    //                             ),
    //                             SizedBox(height: 10),
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Column(
    //                                   // mainAxisAlignment:
    //                                   //     MainAxisAlignment.start,
    //                                   children: [
    //                                     Icon(
    //                                       Icons.download_rounded,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                     // Container(
    //                                     //   width: 2,
    //                                     //   height: Get.height * 0.01,
    //                                     //   color: Color(0xFF546088),
    //                                     // ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(width: 20),
    //                                 Column(
    //                                   crossAxisAlignment:
    //                                   CrossAxisAlignment.start,
    //                                   children: [
    //                                     SizedBox(
    //                                       width: Get.width * 0.15,
    //                                       child: Text(
    //                                         'OR IMPORT YOUR DETAILS FROM',
    //                                         style: TextStyle(
    //                                           fontWeight: FontWeight.w700,
    //                                           fontSize: 16,
    //                                           color: Colors.white,
    //                                         ),
    //                                       ),
    //                                     ),
    //                                   ],
    //                                 ),
    //                               ],
    //                             ),
    //                             SizedBox(height: 10),
    //                             Row(
    //                               crossAxisAlignment: CrossAxisAlignment.start,
    //                               children: [
    //                                 Column(
    //                                   // mainAxisAlignment:
    //                                   //     MainAxisAlignment.start,
    //                                   children: [
    //                                     SizedBox(width: 24),
    //                                     Container(
    //                                       width: 2,
    //                                       height: Get.height * 0.078,
    //                                       color: Color(0xFF546088),
    //                                     ),
    //                                   ],
    //                                 ),
    //                                 SizedBox(width: 10),
    //                                 SizedBox(
    //                                   width: Get.width * 0.15,
    //                                   child: Row(
    //                                     children: [
    //                                       Flexible(
    //                                         child: Container(
    //                                           height: 36,
    //                                           width: 80,
    //                                           decoration: BoxDecoration(
    //                                             color: Color(0xFF344F8D),
    //                                             borderRadius:
    //                                             BorderRadius.circular(2),
    //                                           ),
    //                                           child: Center(
    //                                             child: Image(
    //                                               image: AssetImage(
    //                                                   'assets/icons/fb.png'),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       SizedBox(width: 5),
    //                                       Flexible(
    //                                         child: Container(
    //                                           height: 36,
    //                                           width: 80,
    //                                           decoration: BoxDecoration(
    //                                             color: Color(0xFFD63B30),
    //                                             borderRadius:
    //                                             BorderRadius.circular(2),
    //                                           ),
    //                                           child: Center(
    //                                             child: Image(
    //                                               image: AssetImage(
    //                                                   'assets/icons/gp.png'),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                       SizedBox(width: 5),
    //                                       Flexible(
    //                                         child: Container(
    //                                           height: 36,
    //                                           width: 80,
    //                                           decoration: BoxDecoration(
    //                                             color: Color(0xFF04595B),
    //                                             borderRadius:
    //                                             BorderRadius.circular(2),
    //                                           ),
    //                                           child: Center(
    //                                             child: Image(
    //                                               image: AssetImage(
    //                                                   'assets/icons/x.png'),
    //                                             ),
    //                                           ),
    //                                         ),
    //                                       ),
    //                                     ],
    //                                   ),
    //                                 )
    //                               ],
    //                             ),
    //                           ],
    //                         ),
    //                       ),
    //                     ],
    //                   ),
    //                 ),
    //                 SizedBox(
    //                   height: 25,
    //                 ),
    //                 Container(
    //                   height: 280,
    //                   width: 336,
    //                   child: Image(
    //                     fit: BoxFit.cover,
    //                     image: AssetImage('assets/images/Bannerimage.png'),
    //                   ),
    //                 ),
    //               ],
    //             ),
    //           ],
    //         ),
    //       );
    //     } else {
    //       return Center(child: CircularProgressIndicator());
    //     }
    //   },
    // );

    // if (response.statusCode == 200) {
    //   // PassengersData result = PassengersData.fromJson(
    //   //   jsonDecode(response.body),
    //   // );
    //
    //   log("----------response----------${response.body}");
    //
    //   if (isRefresh) {
    //     newsCategoryList = result.data!;
    //   } else {
    //     newsCategoryList.addAll(result.data!);
    //   }
    //
    //   currentPage++;
    //
    //   totalPages = result.totalPages!;
    //
    //   // ignore: avoid_print
    //   print(response.body);
    //   setState(() {});
    //   return true;
    // } else {
    //   return false;
    // }
  }

  Future<List<Article>> newsCategoryPageRefresh(String page) async {
    print('page------page--------newsCategoryViewModel--------${page}');
    _apiResponse = ApiResponse.loading(message: 'Loading');
    update();
    try {
      NewsCategoryResponseModel response =
          await NewsCategoryRepo().newsCategoryRepo(page);
      print('NewsCategoryRepo=>${response}');

      _apiResponse = ApiResponse.complete(response);
      newsCategoryList.addAll(response.data!.articles!);
      print('newsCategoryList-------$newsCategoryList');
    } catch (e) {
      print(".........>$e");
      _apiResponse = ApiResponse.error(message: 'error');
    }
    update();
    return newsCategoryList;
  }
}
