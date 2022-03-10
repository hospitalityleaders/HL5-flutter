import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import '../profile-edit/profile-edit.dart';

class ProfileOverviewSec2 extends StatefulWidget {


  const ProfileOverviewSec2({Key? key,}) : super(key: key);

  @override
  State<ProfileOverviewSec2> createState() => _ProfileOverviewSec2State();
}

class _ProfileOverviewSec2State extends State<ProfileOverviewSec2> {


  Widget buildProfileCards(
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
                  color: ProfileEdit.isEditable
                      ? const Color.fromRGBO(88, 203, 255, 0.8)
                      : Color(0xFFE5E5E5),
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
        ProfileEdit.isEditable? ProfileEdit.buildProfileEdit(_width, 180) : Container()
      ],
    );
  }



  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          children: [
            buildProfileCards(
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
                        Divider(
                            height: 1,
                            color: ProfileEdit.isEditable
                                ? const Color.fromRGBO(88, 203, 255, 0.8)
                                : Colors.grey.shade400),
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
                              color:ProfileEdit.isEditable
                                  ? const Color.fromRGBO(88, 203, 255, 0.8)
                                  : Colors.grey.shade400,
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
                ProfileEdit.isEditable
                    ? ProfileEdit.buildProfileEdit(_width, 212)
                    : Container(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
