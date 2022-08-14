import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:holedo/responsive/common_responsive_value.dart';
import 'package:holedo/utils/strings.dart';
import 'package:responsive_framework/responsive_framework.dart';
import 'package:responsive_framework/responsive_framework.dart' as RF;

import '../../../../common/common_widget.dart';
import '../../../../components/news_components/add_experience.dart';
import '../../../../components/news_components/experience_completion_widget.dart';
import '../../../../components/news_components/post_update_widget.dart';
import '../../../../components/news_components/public_content_widget.dart';
import '../../../../components/news_components/weather_widget.dart';
import '../../../../constant/colorPicker/color_picker.dart';
import '../../../../constant/fontStyle/font_style.dart';
import '../../../../constant/sizedbox.dart';
import '../../../../controller/menu_controller.dart';
import '../../../../data/data.dart';
import '../update/widget/common_news_widget.dart';
import '../update/widget/picture_comment_widget.dart';
import '../update/widget/update_news_widget.dart';

class NewsPortalScreen extends StatefulWidget {
  const NewsPortalScreen({Key? key}) : super(key: key);

  @override
  State<NewsPortalScreen> createState() => _NewsPortalScreenState();
}

class _NewsPortalScreenState extends State<NewsPortalScreen> with SingleTickerProviderStateMixin {
  TabController? _tabController;
  GlobalKey<ScaffoldState> _scaffoldKey = new GlobalKey<ScaffoldState>();
  MenuController _menuController = Get.put(MenuController());
  @override
  void initState() {
    _tabController = TabController(length: Data.tabItem.length, vsync: this);

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            // Header(page: 'Home'),
            DarkBlueHeader(),
            Obx(
              () => Container(
                height: 60,
                width: double.infinity,
                color: Colors.white,
                alignment: Alignment.bottomCenter,
                child: TabBar(
                  controller: _tabController,
                  onTap: (int value) {
                    _menuController.setTabIndex(value);
                  },
                  padding: EdgeInsets.symmetric(
                    horizontal: CommonResponsiveValue.tabBarPaddingRValue(context),
                  ),
                  indicatorColor: ColorPicker.kBlueLight,
                  labelPadding: EdgeInsets.only(bottom: 15),
                  tabs: List.generate(
                    Data.tabItem.length,
                    (index) => CommonWidget.text(
                      Data.tabItem[index],
                      style: _menuController.tabIndex.value == index
                          ? CommonResponsiveValue.selectedTabBarTextValue(context)
                          : CommonResponsiveValue.unselectedTabBarTextValue(context),
                    ),
                  ),
                ),
              ),
            ),
            SB.SH50(),
            Obx(
              () => IndexedStack(
                index: _menuController.tabIndex.toInt(),
                children: [
                  webView(),
                  Container(child: Center(child: Text('Travel'))),
                  Container(child: Center(child: Text('Development'))),
                  Container(child: Center(child: Text('International'))),
                  Container(child: Center(child: Text('Investment'))),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  Column webView() {
    // print('Get----------------width--------${Get.width}');

    return Column(crossAxisAlignment: CrossAxisAlignment.center, children: [
      ///FIRST ROW TWO CONTAINER
      Container(
        alignment: Alignment.center,
        child: SingleChildScrollView(
          clipBehavior: Clip.antiAlias,
          scrollDirection: Axis.horizontal,
          padding: EdgeInsets.symmetric(horizontal: 13),
          child: ResponsiveRowColumn(
            columnPadding: EdgeInsets.zero,
            layout: ResponsiveRowColumnType.ROW,
            rowMainAxisAlignment: MainAxisAlignment.center,
            rowCrossAxisAlignment: CrossAxisAlignment.center,
            children: [
              ResponsiveRowColumnItem(child: PostUpdateWidget()),
              ResponsiveRowColumnItem(
                child: SB.SW15(),
              ),
              ResponsiveRowColumnItem(child: AddExperienceWidget())
            ],
          ),
        ),
      ),
      ResponsiveRowColumnItem(
        child: SB.SH20(),
      ),

      ResponsiveVisibility(
        child: Divider(
          endIndent: 13,
          indent: 13,
        ),
        hiddenWhen: [RF.Condition.largerThan(value: true, name: RF.MOBILE)],
        visibleWhen: [RF.Condition.smallerThan(value: true, name: RF.MOBILE)],
      ),
      SB.SH50(),

      // RF.ResponsiveRowColumn(layout: RF.ResponsiveRowColumnType,children: [],)
      ///Headline
      ///
      ///
      ///
      CommonNewsPortalWidget(
          Heading: 'Headline',
          centerWidget: ResponsiveRowColumnItem(child: PublicContentWidget()),
          tralingWidget: ExperienceCompletionWidget(),
          trailingOrLeadingWidgetAsLastWidget: Strings.leadingWidget,
          customLastWidgetWhenTabView: ExperienceCompletionWidget(),
          leadingWidget: WeatherWidget(
            isBlueColorEnable: false,
            height: CommonResponsiveValue.genericDouble(context, 480, 450, [RF.Condition.smallerThan(name: TABLET, value: 250)]),
            width: ResponsiveValue<double>(context, defaultValue: 230, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                .value!,
          )),
      SB.SH50(),

      ///WHITE BIG
      InkWell(
        onTap: () {
          print('HEADLINE');
          // Routemaster.of(context).push('/news1');
        },
        child: CommonNewsPortalWidget(
          Heading: 'Video',
          centerWidget: ResponsiveRowColumnItem(
            child: Container(
              height: 400,
              width: CommonResponsiveValue.genericDouble(context, 530, 430, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
              // color: Colors.red,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(10),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned.fill(
                      child: Image(
                        image: AssetImage('assets/images/couple_bg.png'),
                        // height: Get.height * 0.55,
                        // width: Get.width,
                        fit: BoxFit.cover,
                      ),
                    ),
                    Positioned(
                      bottom: 0,
                      child: Container(
                        height: 100,
                        width: Get.width,
                        color: Colors.black54,
                        child: Row(children: [
                          Container(
                            margin: EdgeInsets.only(left: 10),
                            padding: EdgeInsets.all(10),
                            height: 50,
                            width: 50,
                            decoration: BoxDecoration(color: ColorPicker.kBlueLight, borderRadius: BorderRadius.circular(4)),
                            child: SvgPicture.asset(
                              'assets/icons/play_arrow.svg',
                              color: Colors.white,
                              height: 25,
                              width: 25,
                            ),
                          ),
                          SizedBox(width: Get.width * 0.01),
                          CommonWidget.text(
                            'Couple fight boy’s brain cancer with\nnatural remedies',
                            style: FontTextStyle.kWhite20W600PR,
                          )
                        ]),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          tralingWidget: RF.ResponsiveRowColumn(
            layout: RF.ResponsiveRowColumnType.COLUMN,
            children: [
              ResponsiveRowColumnItem(
                child: Container(
                  height: CommonResponsiveValue.genericDouble(context, 300, 300),
                  width: CommonResponsiveValue.genericDouble(context, 230, 250),
                  color: Colors.blue,
                ),
              ),
              ResponsiveRowColumnItem(
                child: SB.SH30(),
              ),
              ResponsiveRowColumnItem(
                child: Container(
                  height: CommonResponsiveValue.genericDouble(context, 300, 300),
                  width: CommonResponsiveValue.genericDouble(context, 230, 250),
                  color: Colors.blue,
                ),
              )
            ],
          ),
          tralingDefaultColor: Colors.transparent,
          tralingPadding: EdgeInsets.zero,
          leadingWidget: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Visibility(
                visible: !RF.ResponsiveWrapper.of(context).isSmallerThan(TABLET),
                child: Container(
                  height: 320,
                  width: 230,
                  color: Colors.blue,
                ),
              ),
              SB.SH30(),
              CommonWidget.text(
                'Widget block type X',
                style: FontTextStyle.kBlueDark28W600PR.copyWith(fontSize: 24),
              ),
              SizedBox(width: 230, child: Divider()),
              Container(
                height: 200,
                width: 230,
                color: Colors.blue,
              ),
            ],
          ),
          customLastWidgetWhenTabView: Padding(
            padding: const EdgeInsets.only(top: 15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CommonWidget.text(
                  'Widget block type X',
                  style: FontTextStyle.kBlueDark28W600PR.copyWith(fontSize: 24),
                ),
                SizedBox(width: 230, child: Divider()),
                Container(
                  height: 200,
                  width:
                      ResponsiveValue<double>(context, defaultValue: 230, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                          .value,
                  color: Colors.blue,
                ),
              ],
            ),
          ),
          isWhiteTile: true,
        ),

        //  HomeWidget().videoBlock()
      ),
      SB.SH30(),

      // /Jobs you might be interested in
      HomeWidget().jobsBlock(context),
      SB.SH50(),
      HomeWidget().widgetIndicator(),
      SizedBox(
        height: 30,
      ),

      ///Category Type B
      InkWell(
        onTap: () {
          // Get.to(NewsCategory());
        },
        child: CommonNewsPortalWidget(
          Heading: 'Category Type B',
          centerWidget: ResponsiveRowColumnItem(child: PublicContentWidget()),
          tralingWidget: WeatherWidget(
            isBlueColorEnable: true,
            height: CommonResponsiveValue.genericDouble(context, 520, 530, [RF.Condition.smallerThan(name: TABLET, value: 200)]),
            width: ResponsiveValue<double>(context, defaultValue: 250, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                .value!,
          ),
          leadingWidget: Container(
            height: 520,
            width: 230,
            color: Colors.blue,
          ),
          isWhiteTile: true,
        ),
      ),
      SB.SH50(),

      ///Category Type A
      InkWell(
        onTap: () {
          // Get.to(NewsCategory());
        },
        child: CommonNewsPortalWidget(
          Heading: 'Category Type A',
          trailingOrLeadingWidgetAsLastWidget: Strings.trailingWidget,
          centerWidget: RF.ResponsiveRowColumnItem(
              child: RF.ResponsiveRowColumn(
            rowCrossAxisAlignment: CrossAxisAlignment.start,
            columnCrossAxisAlignment: CrossAxisAlignment.center,
            columnMainAxisAlignment: MainAxisAlignment.start,
            rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
            // rowPadding: EdgeInsets.only(right: 20),
            layout: RF.ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? RF.ResponsiveRowColumnType.COLUMN : RF.ResponsiveRowColumnType.ROW,
            children: [
              ResponsiveRowColumnItem(
                  child: RF.ResponsiveRowColumn(
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                columnCrossAxisAlignment: CrossAxisAlignment.start,
                layout: RF.ResponsiveRowColumnType.COLUMN,
                children: [
                  RF.ResponsiveRowColumnItem(
                    child: Container(
                      alignment: Alignment.centerLeft,
                      height: 200,
                      width: RF.ResponsiveValue<double>(
                        context,
                        valueWhen: [
                          RF.Condition.smallerThan(name: RF.TABLET, value: double.infinity),
                          RF.Condition.smallerThan(name: RF.DESKTOP, value: 280)
                        ],
                        defaultValue: 320,
                      ).value!,
                      decoration: BoxDecoration(
                        image: DecorationImage(fit: BoxFit.cover, image: AssetImage('assets/images/alone_girl.png')),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  RF.ResponsiveRowColumnItem(
                      child: SizedBox(
                    height: 20,
                  )),
                  RF.ResponsiveRowColumnItem(
                    child: SizedBox(
                      width: RF.ResponsiveValue<double>(
                        context,
                        valueWhen: [RF.Condition.smallerThan(name: RF.TABLET, value: double.infinity)],
                        defaultValue: 250,
                      ).value!,
                      child: RichText(
                        textAlign: TextAlign.left,
                        text: TextSpan(
                          text: "‘I’ve had letters from klansmen’:",
                          style: CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kRed18W600PR, FontTextStyle.kRed14W600PR),
                          children: <TextSpan>[
                            if (RF.ResponsiveWrapper.of(context).isSmallerThan(RF.TABLET)) ...{TextSpan(text: '\n')},
                            TextSpan(
                                text: 'Jennifer Beals on Flashdance',
                                style: CommonResponsiveValue.genericTextStyleResponsive(
                                    context, FontTextStyle.kPrimaryLight18W600PRSPACEHEI, FontTextStyle.kPrimaryLight14W600PRSPACEHEI)),
                          ],
                        ),
                      ),
                    ),
                  )
                ],
              )),
              // ResponsiveRowColumnItem(child: ,)
              ResponsiveRowColumnItem(
                  child: RF.ResponsiveRowColumn(
                rowCrossAxisAlignment: CrossAxisAlignment.start,
                rowMainAxisAlignment: MainAxisAlignment.spaceBetween,
                columnCrossAxisAlignment: CrossAxisAlignment.center,
                columnMainAxisAlignment: MainAxisAlignment.start,
                columnPadding: EdgeInsets.only(left: 10),
                layout: RF.ResponsiveRowColumnType.COLUMN,
                children: [
                  RF.ResponsiveRowColumnItem(
                    columnOrder:
                        RF.ResponsiveValue<int>(context, defaultValue: 1, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: 3)]).value!,
                    child: SizedBox(
                      width: CommonResponsiveValue.genericDouble(context, 200, 150),
                      child: RichText(
                        textAlign: RF.ResponsiveValue<TextAlign>(context,
                            defaultValue: TextAlign.left, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: TextAlign.center)]).value!,
                        text: TextSpan(
                          text: "How buddhism has changed the west for better",
                          style: CommonResponsiveValue.genericTextStyleResponsive(
                              context, FontTextStyle.kPrimaryLight18W600PRSPACEHEI, FontTextStyle.kPrimaryLight14W600PRSPACEHEI),
                          children: <TextSpan>[
                            TextSpan(
                                text: '\nRebecca Sonlit',
                                style: CommonResponsiveValue.genericTextStyleResponsive(
                                    context, FontTextStyle.kRed18W600PR, FontTextStyle.kRed14W600PR)),
                          ],
                        ),
                      ),
                    ),
                  ),
                  RF.ResponsiveRowColumnItem(
                      columnOrder: 2,
                      child: Visibility(
                        visible: !RF.ResponsiveWrapper.of(context).isSmallerThan(TABLET),
                        child: SizedBox(
                          height: 80,
                        ),
                      )),
                  RF.ResponsiveRowColumnItem(
                    columnOrder:
                        RF.ResponsiveValue<int>(context, defaultValue: 3, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: 1)]).value!,
                    child: CircleAvatar(
                      radius: 70,
                      backgroundColor: Colors.white,
                      backgroundImage: AssetImage('assets/images/profile2.png'),
                    ),
                  ),
                ],
              )),
            ],
          )),
          tralingWidget: WeatherWidget(
            isBlueColorEnable: true,
            height: CommonResponsiveValue.genericDouble(context, 460, 550, [RF.Condition.smallerThan(name: TABLET, value: 300)]),
            width: ResponsiveValue<double>(context, defaultValue: 250, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                .value!,
          ),
          leadingWidget: Container(
            height: 520,
            width: 230,
            color: Colors.blue,
          ),
          isWhiteTile: true,
        ),
      ),
      SB.SH50(),

      ///People in your area or industry
      // HomeWidget().blockTitle('People in your area or industry'),
      SB.SH30(),
      HomeWidget().peopleBlock(),
      SizedBox(
        height: 50,
      ),
      HomeWidget().widgetIndicator(),
      SizedBox(
        height: 50,
      ),

      ///Category Type C
      InkWell(
        onTap: () {
          // Get.to(NewsCategory());
        },
        child: CommonNewsPortalWidget(
          Heading: 'Category Type C ',
          centerWidget: ResponsiveRowColumnItem(
              child: PictureAndCommentWidget(
            firstWidgetRowOrder: 1,
            secondWidgetROwOrder: 2,
          )),
          tralingDefaultWidth: 230,
          tralingPadding: EdgeInsets.zero,
          tralingDefaultColor: Colors.blue,
          trailingDefaultHeight: CommonResponsiveValue.genericDouble(context, 550, 500, [RF.Condition.smallerThan(name: TABLET, value: 200)]),
          tralingWidget: Container(
            height: CommonResponsiveValue.genericDouble(context, 580, 530),
            width: CommonResponsiveValue.genericDouble(context, 230, 250),
            color: Colors.blue,
            child: Center(
              child: Text(
                'Widget Area ',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          leadingWidget: WeatherWidget(
            isBlueColorEnable: true,
            height: CommonResponsiveValue.genericDouble(context, 460, 550),
            width: ResponsiveValue<double>(context, defaultValue: 250, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                .value!,
          ),
          isWhiteTile: false,
        ),
      ),

      ///Latest News
      SB.SH50(),
      HomeWidget().latestNewsBlock(Strings.latestNews, context),
      SB.SH50(),
      HomeWidget().widgetIndicator(),
      SB.SH50(),

      // /Category Type D
      InkWell(
        onTap: () {
          // Get.to(NewsCategory());
        },
        child: CommonNewsPortalWidget(
          Heading: 'Category Type D',
          trailingOrLeadingWidgetAsLastWidget: Strings.trailingWidget,
          centerWidget: ResponsiveRowColumnItem(
              child: PictureAndCommentWidget(
            firstWidgetRowOrder: 1,
            secondWidgetROwOrder: 2,
          )),
          tralingWidget: WeatherWidget(
            isBlueColorEnable: true,
            height: CommonResponsiveValue.genericDouble(context, 600, 550, [RF.Condition.smallerThan(name: TABLET, value: 300)]),
            width: ResponsiveValue<double>(context, defaultValue: 250, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                .value!,
          ),
          leadingWidget: Container(
            height: 520,
            width: 230,
            color: Colors.blue,
          ),
          isWhiteTile: true,
        ),
      ),
      SB.SH50(),

      //Latest Topic
      HomeWidget().latestNewsBlock(Strings.latestTopic, context),
      SB.SH50(),
      HomeWidget().widgetIndicator(),
      SB.SH50(),

      ///Category Type E
      InkWell(
        onTap: () {
          // Get.to(NewsCategory());
        },
        child: CommonNewsPortalWidget(
          Heading: 'Category Type E',
          centerWidget: RF.ResponsiveRowColumnItem(
            child: RF.ResponsiveRowColumn(
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              columnMainAxisAlignment: MainAxisAlignment.start,
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: EdgeInsets.only(top: 10),
              rowSpacing: 15,
              layout: RF.ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: Visibility(
                      visible: RF.ResponsiveWrapper.of(context).isSmallerThan(RF.TABLET),
                      child: SizedBox(
                        height: 20,
                      )),
                ),
                RF.ResponsiveRowColumnItem(
                    child: Container(
                  alignment: Alignment.topCenter,
                  height: 350,
                  width: CommonResponsiveValue.genericDouble(context, 245, 200, [RF.Condition.smallerThan(name: TABLET, value: 194)]),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(3),
                    color: Colors.red,
                    image: DecorationImage(
                      fit: BoxFit.cover,
                      image: AssetImage('assets/images/E1.png'),
                    ),
                  ),
                )),
                RF.ResponsiveRowColumnItem(
                  child: Container(
                    height: 350,
                    width: CommonResponsiveValue.genericDouble(context, 245, 200, [RF.Condition.smallerThan(name: TABLET, value: 194)]),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(3),
                      image: DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/images/E2.png'),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
          tralingWidget: Container(
            height: CommonResponsiveValue.genericDouble(context, 580, 530),
            width: CommonResponsiveValue.genericDouble(context, 230, 250),
            color: Colors.blue,
            child: Center(
              child: Text(
                'Widget Area',
                style: TextStyle(fontSize: 20),
              ),
            ),
          ),
          tralingDefaultColor: Colors.blue,
          // tralingPadding: EdgeInsets.zero,

          leadingWidget: WeatherWidget(
            isBlueColorEnable: true,
            height: CommonResponsiveValue.genericDouble(context, 550, 480),
            width: ResponsiveValue<double>(context, defaultValue: 250, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                .value!,
          ),
        ),
      ),
      SB.SH50(),

      ///Category
      InkWell(
        onTap: () {
          // Get.to(NewsCategory());
        },
        child: CommonNewsPortalWidget(
          Heading: 'Category',
          centerWidget: RF.ResponsiveRowColumnItem(
            child: RF.ResponsiveRowColumn(
              rowCrossAxisAlignment: CrossAxisAlignment.start,
              columnCrossAxisAlignment: CrossAxisAlignment.center,
              columnMainAxisAlignment: MainAxisAlignment.start,
              rowMainAxisAlignment: MainAxisAlignment.center,
              rowPadding: EdgeInsets.only(top: 10, right: 10),
              rowSpacing: 10,
              layout: RF.ResponsiveWrapper.of(context).isSmallerThan(TABLET) ? RF.ResponsiveRowColumnType.COLUMN : RF.ResponsiveRowColumnType.ROW,
              children: [
                ResponsiveRowColumnItem(
                  child: Visibility(
                      visible: RF.ResponsiveWrapper.of(context).isSmallerThan(RF.TABLET),
                      child: SizedBox(
                        height: 20,
                      )),
                ),
                RF.ResponsiveRowColumnItem(
                    child: RF.ResponsiveRowColumn(
                  layout: RF.ResponsiveRowColumnType.COLUMN,
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Container(
                        alignment: Alignment.topCenter,
                        height: 150,
                        width:
                            CommonResponsiveValue.genericDouble(context, 190, 185, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          color: Colors.red,
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/E1.png'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                        width:
                            CommonResponsiveValue.genericDouble(context, 200, 190, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
                        child: RichText(
                          text: TextSpan(
                            text: "Winter Olympics/",
                            style:
                                CommonResponsiveValue.genericTextStyleResponsive(context, FontTextStyle.kRed18W600PRH, FontTextStyle.kRed12W600PRH),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'snowboarder Su Yiming claims silver in slopestyle final',
                                  style: CommonResponsiveValue.genericTextStyleResponsive(
                                      context, FontTextStyle.kPrimaryLight16W600PRH, FontTextStyle.kPrimaryLight12W600PRH)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                          width: CommonResponsiveValue.genericDouble(
                              context, 200, 190, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
                          child: Text(
                            'Chinese and Russian leaders call on west Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                            style: CommonResponsiveValue.genericTextStyleResponsive(
                                context, FontTextStyle.kGreyLight14W400SSPH, FontTextStyle.kGreyLight10W400SSPH),
                          )),
                    )
                  ],
                )),
                RF.ResponsiveRowColumnItem(
                    child: RF.ResponsiveRowColumn(
                  layout: RF.ResponsiveRowColumnType.COLUMN,
                  columnCrossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    ResponsiveRowColumnItem(
                      child: Container(
                        height: 200,
                        width:
                            CommonResponsiveValue.genericDouble(context, 300, 250, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(3),
                          image: DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/E2.png'),
                          ),
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                        width:
                            CommonResponsiveValue.genericDouble(context, 280, 250, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
                        child: RichText(
                          text: TextSpan(
                            text: "Winter Olympics/",
                            style: FontTextStyle.kRed14W600PR.copyWith(height: 1.5),
                            children: <TextSpan>[
                              TextSpan(
                                  text: 'snowboarder Su Yiming claims silver in slopestyle final',
                                  style: FontTextStyle.kPrimaryLight16W600PR.copyWith(height: 1.5)),
                            ],
                          ),
                        ),
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                        height: 30,
                      ),
                    ),
                    ResponsiveRowColumnItem(
                      child: SizedBox(
                          width: CommonResponsiveValue.genericDouble(
                              context, 280, 250, [RF.Condition.smallerThan(name: TABLET, value: double.infinity)]),
                          child: Text(
                            'Chinese and Russian leaders call on west Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                            style: FontTextStyle.kGreyLight12W400SSP.copyWith(height: 1.5),
                          )),
                    )
                  ],
                ))
              ],
            ),
          ),
          tralingWidget: WeatherWidget(
            isBlueColorEnable: true,
            height: CommonResponsiveValue.genericDouble(context, 600, 550),
            width: ResponsiveValue<double>(context, defaultValue: 250, valueWhen: [RF.Condition.smallerThan(name: TABLET, value: double.infinity)])
                .value!,
          ),
          leadingWidget: Container(
            height: 520,
            width: 230,
            color: Colors.blue,
          ),
          isWhiteTile: true,
        ),
      ),
      SB.SH50(),
    ]);
  }

  Container DarkBlueHeader() {
    return Container(
      height: 100,
      color: ColorPicker.kPrimary,
      child: ResponsiveRowColumn(
        layout: ResponsiveRowColumnType.ROW,
        children: [
          ResponsiveRowColumnItem(
              child: BlueHeaderSingleWidget(
            icon: 'assets/icons/rightShield.png',
            subTitle: 'MY GRADE',
            title: 'AHL',
          )),
          ResponsiveRowColumnItem(
            child: VerticalDivider(
              width: 2,
              color: Colors.black,
            ),
          ),
          ResponsiveRowColumnItem(
              child: BlueHeaderSingleWidget(
            icon: 'assets/icons/info.png',
            title: '33% ',
            subTitle: 'TO NEXT GRADE',
          )),
          ResponsiveRowColumnItem(
            child: VerticalDivider(
              width: 2,
              color: Colors.black,
            ),
          ),
          ResponsiveRowColumnItem(
            child: BlueHeaderSingleWidget(
              icon: 'assets/icons/shield.png',
              title: 'MHL',
              subTitle: 'NEXT GRADE',
            ),
          ),
        ],
      ),
    );
  }
}

class BlueHeaderSingleWidget extends StatelessWidget {
  final String title;
  final String subTitle;
  final String icon;
  const BlueHeaderSingleWidget({required this.title, required this.icon, required this.subTitle});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        color: ColorPicker.kPrimary,
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(
                  icon,
                  height: 33,
                ),
                const SizedBox(
                  width: 10,
                ),
                Text(
                  title,
                  style: CommonResponsiveValue.blueHeaderResponsiveValue(context),
                )
              ],
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              subTitle,
              style: CommonResponsiveValue.blueHeaderSubtitleRValue(context),
            )
          ],
        ),
      ),
    );
  }
}
