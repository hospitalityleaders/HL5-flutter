import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile-edit/profile-edit.dart';

class ProfileOverviewSec2 extends StatefulWidget {
  final sec2IsEditable;
  final profileOverviewSec2WorkExpKey;
  final profileOverviewSec2WorkExp_H;
  final profileOverviewSec2WorkExp_W;
  final profileOverviewSec2EducationKey;
  final profileOverviewSec2Education_H;
  final profileOverviewSec2Education_W;
  final profileOverviewSec2AchievementKey;
  final profileOverviewSec2Achievement_H;
  final profileOverviewSec2Achievement_W;
  final profileOverviewSec2LanguagesKey;
  final profileOverviewSec2Languages_H;
  final profileOverviewSec2Languages_W;

  const ProfileOverviewSec2({
    Key? key,
    required this.sec2IsEditable,
    this.profileOverviewSec2WorkExpKey,
    this.profileOverviewSec2WorkExp_H,
    this.profileOverviewSec2WorkExp_W,
    this.profileOverviewSec2EducationKey,
    this.profileOverviewSec2Education_H,
    this.profileOverviewSec2Education_W,
    this.profileOverviewSec2AchievementKey,
    this.profileOverviewSec2Achievement_H,
    this.profileOverviewSec2Achievement_W,
    this.profileOverviewSec2LanguagesKey,
    this.profileOverviewSec2Languages_H,
    this.profileOverviewSec2Languages_W,
  }) : super(key: key);

  @override
  State<ProfileOverviewSec2> createState() => _ProfileOverviewSec2State();
}

class _ProfileOverviewSec2State extends State<ProfileOverviewSec2> {
  Widget buildProfileCards(
      sec2Key,
      sec2_H,
      sec2_W,
      _width,
      _height,
      String cardName,
      String cardTitle,
      String cardSubTitle,
      String cardDate,
      String cardBtn,
      String cardDetail,
      IconData cardIcon) {
    return Stack(
      children: [
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            key: sec2Key,
            color: Colors.white,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      right: 20, left: 20, bottom: 5, top: 13),
                  child: Text(
                    cardName,
                    style: const TextStyle(
                        color: Color(0xFF272E41),
                        fontSize: 20,
                        fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(height: 8),
                Divider(
                  height: .5,
                  color: Color(0xFFE5E5E5),
                ),
                const SizedBox(height: 10),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Container(
                            height: 50,
                            width: 50,
                            color: const Color(0xFF0d9bdc),
                            child: Center(
                              child: Icon(
                                cardIcon,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      flex: 3,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            cardTitle,
                            style: const TextStyle(
                                color: Color(0xFF272E41),
                                fontSize: 16,
                                fontWeight: FontWeight.w700),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                          GestureDetector(
                              child: Text(
                                cardSubTitle,
                                style: const TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xFF32A3FD),
                                ),
                              ),
                              onTap: () {}),
                          const SizedBox(
                            height: 5,
                          ),
                          Text(
                            cardDate,
                            style: const TextStyle(
                                fontSize: 14,
                                color: Color(0xFF7C8990),
                                fontWeight: FontWeight.w400),
                          ),
                          const SizedBox(
                            height: 5,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(width: 6),
                  ],
                ),
                const SizedBox(height: 5),
                Container(
                  padding: const EdgeInsets.all(5),
                  color: const Color(0xFFEDEFF1),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton.icon(
                        onPressed: () {},
                        icon: const Icon(Icons.add),
                        label: Text(
                          cardBtn,
                          style: const TextStyle(
                              fontWeight: FontWeight.w400,
                              fontSize: 14,
                              color: Color(0xff32A3FD)),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
        widget.sec2IsEditable
            ? ProfileEdit.buildProfileEdit(
                width: sec2_W,
                height: sec2_H,
                popUp: () {
                  buildProfileCard();
                })
            : Container()
      ],
    );
  }

  Future<String?> buildProfileCard() {
    return showDialog<String>(
      context: context,
      builder: (BuildContext context) => SingleChildScrollView(
          child: Center(
        child: Container(
          color: Color(0xffb5bdc2),
          width: 600,
          child: Column(
            children: [
              Container(
                color: Colors.white,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Padding(
                      padding: EdgeInsets.all(8.0),
                      child: Text("Profile card"),
                    ),
                    Material(
                      child: IconButton(
                          icon: Icon(Icons.cancel), onPressed: () {}),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  color: Color(0xffb5bdc2),
                  child: Column(
                    children: [
                      buildProfilePictureCard(),
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      )),
    );
  }

  buildProfilePictureCard() {
    return Form(
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 50,
                    width: 50,
                    color: const Color(0xFF0d9bdc),
                    child: const Center(
                      child: Icon(
                        Icons.camera_alt,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: const [
                    Text(
                      'Profile picture',
                      style:
                          TextStyle(fontWeight: FontWeight.w400, fontSize: 16),
                    ),
                    Text(
                        'Your profile picture will be used on your profile and throughout the site.',
                        style: TextStyle(
                            fontWeight: FontWeight.w400,
                            fontSize: 12,
                            color: Color(0xffbdb5c2)))
                  ],
                )
              ],
            ),
            const Padding(
              padding: EdgeInsets.all(8.0),
              child: Divider(
                height: 1,
                color: Colors.grey,
              ),
            ),
            Row(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Container(
                          height: 150,
                          width: 150,
                          decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: NetworkImage(
                                    'https://cdn.pixabay.com/photo/2019/10/20/20/02/nature-4564618_960_720.jpg'),
                                fit: BoxFit.cover),
                          ),
                        ),
                        TextButton.icon(
                          onPressed: () {
                            Navigator.of(context).pop();
                          },
                          icon: Icon(Icons.delete),
                          label: Text('Delete photo'),
                        )
                      ]),
                ),
                Column(children: []),
              ],
            )
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return Expanded(
      child: Column(
        children: [
          buildProfileCards(
              widget.profileOverviewSec2WorkExpKey,
              widget.profileOverviewSec2WorkExp_H,
              widget.profileOverviewSec2WorkExp_W,
              _width,
              _height,
              'Work experience',
              'Food and Beverage Manager',
              'Marriott Hotels',
              'February 2013 – 2014 (1 year 6 months)',
              'Show more',
              'Card-Details',
              Icons.apartment_rounded),
          buildProfileCards(
              widget.profileOverviewSec2EducationKey,
              widget.profileOverviewSec2Education_H,
              widget.profileOverviewSec2Education_W,
              _width,
              _height,
              'Education',
              'University of Cape Town',
              'Postgraduate Degree in Business Science',
              '2010 - 2013',
              'Course outline',
              'Card-Details',
              Icons.school_outlined),
          buildProfileCards(
              widget.profileOverviewSec2AchievementKey,
              widget.profileOverviewSec2Achievement_H,
              widget.profileOverviewSec2Achievement_W,
              _width,
              _height,
              'Achievement',
              'Marriott Hotel and Resorts employee of the year awards',
              'www.mariiott.com/awards',
              '',
              ' More info',
              'Card-Details',
              Icons.shield),
          Stack(
            children: [
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  key: widget.profileOverviewSec2LanguagesKey,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: AutoSizeText(
                          'Languages',
                          style: TextStyle(
                              color: Color(0xFF272E41),
                              fontSize: 20,
                              fontWeight: FontWeight.w400),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Divider(height: 1, color: Colors.grey.shade400),
                      const SizedBox(height: 10),
                      Column(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: const Color(0xFF0d9bdc),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.globe,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      AutoSizeText(
                                        'English',
                                        style: TextStyle(
                                            color: Color(0xFF272E41),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      AutoSizeText(
                                        'Native and bilingual profiency',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF7C8990)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 6),
                              ],
                            ),
                          ),
                          Divider(
                            height: 1,
                            color: Colors.grey.shade400,
                          ),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Expanded(
                                  child: Column(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        color: const Color(0xFF0d9bdc),
                                        child: const Center(
                                          child: Icon(
                                            CupertinoIcons.globe,
                                            color: Colors.white,
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                                Expanded(
                                  flex: 3,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: const [
                                      Text(
                                        'Spanish',
                                        style: TextStyle(
                                            color: Color(0xFF272E41),
                                            fontSize: 16,
                                            fontWeight: FontWeight.w700),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Elementary profiency',
                                        style: TextStyle(
                                            fontSize: 14,
                                            fontWeight: FontWeight.w400,
                                            color: Color(0xFF7C8990)),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                    ],
                                  ),
                                ),
                                const SizedBox(width: 6),
                              ],
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                    ],
                  ),
                ),
              ),
              widget.sec2IsEditable
                  ? ProfileEdit.buildProfileEdit(
                      width: widget.profileOverviewSec2Languages_W,
                      height: widget.profileOverviewSec2Languages_H,
                      popUp: () {
                        buildProfileCard();
                      })
                  : Container(),
            ],
          ),
        ],
      ),
    );
  }
}
