import 'package:flutter/material.dart';

class UpdatedNewsScreen extends StatefulWidget {
  @override
  _UpdatedNewsScreenState createState() => _UpdatedNewsScreenState();
}

class _UpdatedNewsScreenState extends State<UpdatedNewsScreen> {
  List<String> reason = ["Maintain your online digital CV", "Explore thousands of hospitality jobs. ", "Apply with 1-click ", "Browse industry news", "Promote your career"];

  @override
  Widget build(BuildContext context) {
    final sHeight = MediaQuery.of(context).size.height;
    final sWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF2B375E),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.04),
        child: SingleChildScrollView(
          physics: BouncingScrollPhysics(),
          child: Column(
            children: [
              Container(
                height: MediaQuery.of(context).size.height * 0.5,
                width: MediaQuery.of(context).size.width,
                child: Image(
                  fit: BoxFit.fill,
                  image: AssetImage("assets/images/png/news_first.png"),
                ),
              ),
              Container(
                padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                height: MediaQuery.of(context).size.height * 0.61,
                width: MediaQuery.of(context).size.width,
                color: Color(0xFfF7F7F9),
                child: Column(
                  children: [
                    Padding(
                      padding: EdgeInsets.all(MediaQuery.of(context).size.width * 0.03),
                      child: Text(
                        "join the leading community for hospitality. Sign-up free today , we'll curate your career",
                        style: TextStyle(color: Color(0xFF101E4A), fontSize: MediaQuery.of(context).size.height * 0.030, fontWeight: FontWeight.w600),
                      ),
                    ),
                    ListView.builder(
                        shrinkWrap: true,
                        itemCount: reason.length,
                        itemBuilder: (context, index) {
                          return Container(
                            margin: EdgeInsets.only(top: MediaQuery.of(context).size.height * 0.01),
                            height: MediaQuery.of(context).size.height * 0.05,
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              children: [
                                Icon(
                                  Icons.done,
                                  size: MediaQuery.of(context).size.height * 0.035,
                                  color: Color(0xFF05B217),
                                ),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.015,
                                ),
                                Text(
                                  reason[index],
                                  style: TextStyle(fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height * 0.02),
                                ),
                              ],
                            ),
                          );
                        }),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.07,
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.4,
                            decoration: BoxDecoration(
                              color: Color(0xFF7EC81B),
                              borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01),
                            ),
                            child: Center(
                              child: Text(
                                "Sign up free",
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: MediaQuery.of(context).size.height * 0.02,
                                ),
                              ),
                            ),
                          ),
                          Container(
                            height: MediaQuery.of(context).size.height * 0.06,
                            width: MediaQuery.of(context).size.width * 0.4,
                            child: Row(
                              children: [
                                Image(image: AssetImage('assets/images/png/play.png')),
                                SizedBox(
                                  width: MediaQuery.of(context).size.width * 0.02,
                                ),
                                Text(
                                  "Why join?",
                                  style: TextStyle(color: Color(0xFF33A3FE), fontSize: MediaQuery.of(context).size.height * 0.028, fontWeight: FontWeight.w600),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                height: MediaQuery.of(context).size.height * 0.58,
                width: MediaQuery.of(context).size.width,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Headlines",
                      style: TextStyle(color: Color(0xFF101E4A), fontSize: MediaQuery.of(context).size.height * 0.030, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.3,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01)),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01),
                        child: Image(
                          fit: BoxFit.cover,
                          image: AssetImage("assets/images/png/public.png"),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    RichText(
                      text: TextSpan(text: "'We must stat at update':", style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.height * 0.03, fontWeight: FontWeight.w600), children: [
                        TextSpan(
                          text: 'Hong Kong expected to confirm 614 coronavirus cases',
                          style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height * 0.03, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.01,
                    ),
                    Text(
                      "The expected number of new cases is nearly twice the amount recorded on Sunday, with one expert warning the daily count could hit 1,000 soon.",
                      style: TextStyle(
                        fontSize: MediaQuery.of(context).size.height * 0.018,
                        color: Color(0xFFA1A1A1),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                width: MediaQuery.of(context).size.width,
                child: GridView.builder(
                    shrinkWrap: true,
                    physics: NeverScrollableScrollPhysics(),
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2, childAspectRatio: 2 / 4, crossAxisSpacing: MediaQuery.of(context).size.width * 0.03),
                    itemCount: 2,
                    itemBuilder: (contex, index) {
                      return Container(
                        margin: EdgeInsets.all(3),
                        height: MediaQuery.of(context).size.height * 0.40,
                        width: MediaQuery.of(context).size.width * 0.42,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Container(
                              height: MediaQuery.of(context).size.height * 0.18,
                              width: MediaQuery.of(context).size.width * 0.42,
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.01),
                                child: Image(
                                  fit: BoxFit.fill,
                                  image: AssetImage('assets/images/png/public.png'),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              "Winter olympics/':",
                              style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.height * 0.018, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'nowboarder Su Yiming claims silver in slopestyle final',
                              style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height * 0.016, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.01,
                            ),
                            Text(
                              "Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics",
                              style: TextStyle(
                                color: Color(0xFFA1A1A1),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
              ),
              Divider(),
              Container(
                // height: sHeight * 0.90,
                width: sWidth,
                child: Column(
                  children: [
                    RichText(
                      text: TextSpan(text: "Winter Olympics/", style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.height * 0.025, fontWeight: FontWeight.w600), children: [
                        TextSpan(
                          text: 'nowboarder Su Yiming claims silver in slopestyle final',
                          style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height * 0.025, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.005,
                    ),
                    Text(
                      'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                      style: TextStyle(color: Color(0xFFA1A1A1), fontSize: MediaQuery.of(context).size.height * 0.016),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "Hamburg, DE",
                      style: TextStyle(color: Color(0xFF2B375E), fontSize: MediaQuery.of(context).size.height * 0.03, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Text(
                      "3 February 2022 15:13",
                      style: TextStyle(color: Color(0xFF2B375E), fontSize: MediaQuery.of(context).size.height * 0.02, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.02,
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.30,
                      child: Row(
                        children: [
                          Image(
                            image: AssetImage('assets/images/png/cloud.png'),
                          ),
                          SizedBox(
                            width: MediaQuery.of(context).size.width * 0.02,
                          ),
                          Stack(
                            children: [
                              Text(
                                '7 C',
                                style: TextStyle(color: Color(0xFF2B375E), fontSize: MediaQuery.of(context).size.height * 0.04, fontWeight: FontWeight.w600),
                              ),
                              Positioned(
                                right: MediaQuery.of(context).size.width * 0.05,
                                child: Image(image: AssetImage('assets/images/png/circle.png')),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Text(
                      "Bedecket",
                      style: TextStyle(color: Color(0xFF2B375E), fontSize: MediaQuery.of(context).size.height * 0.03, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                      height: MediaQuery.of(context).size.height * 0.067,
                      width: MediaQuery.of(context).size.width * 0.75,
                      decoration: BoxDecoration(
                        color: Color(0xFF33A3FE),
                        borderRadius: BorderRadius.circular(
                          MediaQuery.of(context).size.height * 0.01,
                        ),
                      ),
                      child: Center(
                        child: Text(
                          'Wheather from OpenWeatherMap',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: MediaQuery.of(context).size.height * 0.02,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      height: MediaQuery.of(context).size.height * 0.015,
                    ),
                    Container(
                      //height: MediaQuery.of(context).size.height * 0.70,
                      width: MediaQuery.of(context).size.width,
                      color: Color(0xFF2B375E),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Column(
                          children: [
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            Text(
                              "25%",
                              style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: MediaQuery.of(context).size.height * 0.08),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(horizontal: MediaQuery.of(context).size.width * 0.10),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(MediaQuery.of(context).size.height * 0.03),
                                child: LinearProgressIndicator(
                                  minHeight: MediaQuery.of(context).size.height * 0.025,
                                  value: 0.25,
                                  backgroundColor: Colors.black,
                                  color: Color(0xFFEF3534),
                                  // valueColor: AlwaysStoppedAnimation(Colors.red),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            Text(
                              'Your Profile is only 25% complete.',
                              style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.025, fontWeight: FontWeight.w600),
                            ),
                            Text(
                              'Improve it now. Here’s how',
                              style: TextStyle(color: Colors.white, fontSize: MediaQuery.of(context).size.height * 0.025, fontWeight: FontWeight.w600),
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height * 0.015,
                            ),
                            ListTile(
                              leading: Container(
                                height: sHeight * 0.025,
                                width: sWidth * 0.05,
                                color: Color(0xff33A3FE),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: sHeight * 0.02,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                "Add your work experience",
                                style: TextStyle(color: Color(0xff33A3FE), fontSize: sHeight * 0.018),
                              ),
                              trailing: Container(
                                color: Colors.black.withOpacity(0.2),
                                height: sHeight * 0.05,
                                width: sWidth * 0.15,
                                child: Center(
                                    child: Text(
                                  '+20%',
                                  style: TextStyle(
                                    color: Color(0xff33A3FE),
                                  ),
                                )),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            ListTile(
                              leading: Container(
                                height: sHeight * 0.025,
                                width: sWidth * 0.05,
                                color: Color(0xff33A3FE),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: sHeight * 0.02,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                "Add your qualifications",
                                style: TextStyle(color: Color(0xff33A3FE), fontSize: sHeight * 0.018),
                              ),
                              trailing: Container(
                                color: Colors.black.withOpacity(0.2),
                                height: sHeight * 0.05,
                                width: sWidth * 0.15,
                                child: Center(
                                    child: Text(
                                  '+20%',
                                  style: TextStyle(
                                    color: Color(0xff33A3FE),
                                  ),
                                )),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            ListTile(
                              leading: Container(
                                height: sHeight * 0.025,
                                width: sWidth * 0.05,
                                color: Color(0xff33A3FE),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: sHeight * 0.02,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                "Add your speciallities",
                                style: TextStyle(color: Color(0xff33A3FE), fontSize: sHeight * 0.018),
                              ),
                              trailing: Container(
                                color: Colors.black.withOpacity(0.2),
                                height: sHeight * 0.05,
                                width: sWidth * 0.15,
                                child: Center(
                                    child: Text(
                                  '+20%',
                                  style: TextStyle(
                                    color: Color(0xff33A3FE),
                                  ),
                                )),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            ListTile(
                              leading: Container(
                                height: sHeight * 0.025,
                                width: sWidth * 0.05,
                                color: Color(0xff33A3FE),
                                child: Center(
                                  child: Icon(
                                    Icons.add,
                                    size: sHeight * 0.02,
                                    color: Colors.white,
                                  ),
                                ),
                              ),
                              title: Text(
                                "Add your languages",
                                style: TextStyle(color: Color(0xff33A3FE), fontSize: sHeight * 0.018),
                              ),
                              trailing: Container(
                                color: Colors.black.withOpacity(0.2),
                                height: sHeight * 0.05,
                                width: sWidth * 0.15,
                                child: Center(
                                    child: Text(
                                  '+20%',
                                  style: TextStyle(
                                    color: Color(0xff33A3FE),
                                  ),
                                )),
                              ),
                            ),
                            Divider(
                              thickness: 2,
                            ),
                            SizedBox(
                              height: sHeight * 0.02,
                            ),
                            Container(
                              height: sHeight * 0.06,
                              width: sWidth * 0.70,
                              decoration: BoxDecoration(color: Color(0xFF33A3FE), borderRadius: BorderRadius.circular(sHeight * 0.01)),
                              child: Center(
                                child: Text(
                                  "Edit my profile",
                                  style: TextStyle(color: Colors.white, fontSize: sHeight * 0.02),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: sHeight * 0.02,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Divider(),
              Container(
                width: sWidth,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Text('Video', style: TextStyle(color: Color(0xff101E4A), fontSize: sHeight * 0.03, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Container(
                      height: sHeight * 0.30,
                      width: sWidth,
                      child: Image(
                        fit: BoxFit.fill,
                        image: AssetImage('assets/images/png/video.png'),
                      ),
                    ),
                    Divider(),
                    RichText(
                      text: TextSpan(text: "Winter Olympics/ ", style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.height * 0.02, fontWeight: FontWeight.w600), children: [
                        TextSpan(
                          text: 'snowboarder Su Yiming claims silver in slopestyle final',
                          style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height * 0.02, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Text(
                      'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                      style: TextStyle(color: Color(0xffA1A1A1), fontSize: sHeight * 0.016),
                    ),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Divider(),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    RichText(
                      text: TextSpan(text: "Winter Olympics/ ", style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.height * 0.02, fontWeight: FontWeight.w600), children: [
                        TextSpan(
                          text: 'snowboarder Su Yiming claims silver in slopestyle final',
                          style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height * 0.02, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Text(
                      'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                      style: TextStyle(color: Color(0xffA1A1A1), fontSize: sHeight * 0.016),
                    ),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Divider(),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    RichText(
                      text: TextSpan(text: "Winter Olympics/ ", style: TextStyle(color: Colors.red, fontSize: MediaQuery.of(context).size.height * 0.02, fontWeight: FontWeight.w600), children: [
                        TextSpan(
                          text: 'snowboarder Su Yiming claims silver in slopestyle final',
                          style: TextStyle(color: Colors.black, fontSize: MediaQuery.of(context).size.height * 0.02, fontWeight: FontWeight.w600),
                        ),
                      ]),
                    ),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Text(
                      'Chinese and Russian leaders call on west to abandon cold war tactics in talks ahead of Beijing Olympics',
                      style: TextStyle(color: Color(0xffA1A1A1), fontSize: sHeight * 0.016),
                    ),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Text(
                      'Widget block type X',
                      style: TextStyle(color: Color(0xFF101E4A), fontSize: sHeight * 0.035, fontWeight: FontWeight.w600),
                    ),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Container(
                      height: sHeight * 0.20,
                      width: sWidth,
                      decoration: BoxDecoration(color: Color(0xff33A3FE), borderRadius: BorderRadius.circular(sHeight * 0.01)),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            'Widget',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: sHeight * 0.04),
                          ),
                          SizedBox(
                            height: sHeight * 0.01,
                          ),
                          Text(
                            'Area',
                            style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: sHeight * 0.04),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: sHeight * 0.03,
              ),
              Container(
                color: Color(0xFFF9F9F9),
                child: Column(
                  children: [
                    Text('Jobs you might be interested in', style: TextStyle(color: Color(0xff101E4A), fontSize: sHeight * 0.035, fontWeight: FontWeight.w600)),
                    SizedBox(
                      height: sHeight * 0.02,
                    ),
                    Container(
                      height: sHeight * 0.30,
                      width: sWidth,
                      child: Row(
                        children: [
                          Container(
                            height: sHeight * 0.30,
                            width: sWidth * 0.55,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(sHeight * 0.01),
                              border: Border.all(
                                color: Color(0xffCACACA),
                              ),
                            ),
                            child: Column(
                              children: [
                                Align(
                                  alignment: Alignment.topRight,
                                  child: Container(
                                    margin: EdgeInsets.only(top: sHeight * 0.02, right: sHeight * 0.02),
                                    height: sHeight * 0.05,
                                    width: sWidth * 0.30,
                                    decoration: BoxDecoration(
                                      color: Color(0xff83C65D),
                                      borderRadius: BorderRadius.circular(sHeight * 0.01),
                                    ),
                                    child: Center(
                                      child: Text(
                                        'Premium Listing',
                                        style: TextStyle(color: Colors.white, fontWeight: FontWeight.w600, fontSize: sHeight * 0.015),
                                      ),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  height: sHeight * 0.01,
                                ),
                                Container(
                                  height: sHeight * 0.09,
                                  width: sWidth * 0.35,
                                  child: Image(
                                    fit: BoxFit.fill,
                                    image: AssetImage('assets/images/png/hilton.png'),
                                  ),
                                ),
                                Divider(),
                                SizedBox(
                                  height: sHeight * 0.01,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Text('Cluster Sales Manager - Leisure & MICE', style: TextStyle(color: Color(0xff101E4A), fontSize: sHeight * 0.015, fontWeight: FontWeight.w600)),
                                ),
                                Text(
                                  "Hilton, Capetown",
                                  style: TextStyle(
                                    color: Color(0xFFA1A1A1),
                                  ),
                                ),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
