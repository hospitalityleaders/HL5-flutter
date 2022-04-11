import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:holedo/responsive/responsive.dart';

import '../profile-edit/profile-edit.dart';

//Header card

class HeaderCard extends StatefulWidget {
  final isEditable;
  final headerCardKey;
  final headerCard_H;
  final headerCard_W;

  const HeaderCard({
    Key? key,
    required this.isEditable,
    required this.headerCardKey,
    this.headerCard_H,
    this.headerCard_W,
  }) : super(key: key);

  @override
  _HeaderCardState createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {
  Widget cardDataLoad(String no, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        AutoSizeText(
          no,
          minFontSize: 10,
          style: const TextStyle(
              color: Color(0xFF32A3FD),
              fontSize: 18,
              fontWeight: FontWeight.w400),
          maxLines: 1,
        ),
        const SizedBox(height: 3),
        AutoSizeText(
          name,
          minFontSize: 8,
          style: const TextStyle(
              color: Color(0xFFB5BDC2),
              fontSize: 12,
              fontWeight: FontWeight.w400),
          textAlign: TextAlign.center,
        )
      ],
    );
  }

  String? valueChoose;
  List listItem = ['item1 ', 'item2'];

  Future openDialog(BuildContext context) async {
    return showDialog(
        context: context,
        builder: (context) => Expanded(
              child: AlertDialog(
                title: Text('Welcome'),
                content: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: OutlinedButton.icon(
                          style: ButtonStyle(
                            backgroundColor: MaterialStateProperty.all(
                              const Color(0xFFe5f4fb),
                            ),
                          ),
                          onPressed: () {},
                          icon: Icon(Icons.mail),
                          label: const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 20.0),
                            child: Text('noberto@gmail.com'),
                          )),
                    ),
                    MaterialButton(
                      onPressed: () {},
                    )
                  ],
                ),
                actions: [],
              ),
            ));
  }

  buildProfileCard() {
    return showDialog(
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
    return Container(
      width: _width,
      decoration: const BoxDecoration(
        image: DecorationImage(
          image: NetworkImage(
            'https://cdn.pixabay.com/photo/2019/10/20/20/02/nature-4564618_960_720.jpg',
          ),
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        alignment: AlignmentDirectional.topCenter,
        children: [
          Responsive.isDesktop(context)
              ? Padding(
                  padding: EdgeInsets.only(
                    top: _height * .18,
                    bottom: _height * .18,
                  ),
                  child: Center(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        key: widget.headerCardKey,
                        width: 550,
                        // height: _height,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton.icon(
                                    style: const ButtonStyle(),
                                    onPressed: () {
                                      openDialog(context);
                                    },
                                    label: const Text(
                                      'contact card',
                                      style: TextStyle(
                                          color: Colors.grey, fontSize: 12),
                                    ),
                                    icon: const Icon(
                                      Icons.contact_phone_outlined,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    value: valueChoose,
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueChoose = newValue as String;
                                      });
                                    },
                                    items: listItem.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Noberto Holden',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Color(0xFF272E41),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: AutoSizeText(
                                'Business development manager,recruiter and hotel specialist',
                                maxLines: 2,
                                minFontSize: 12,
                                style: TextStyle(
                                    color: Color(0xFF7C8990), fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Color(
                                            0xFF8f9ea6,
                                          ),
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    const TextSpan(
                                        text: 'Cape Town, South Africa',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff7C8990)))
                                  ],
                                  style: const TextStyle(
                                    color: Color(0xFF8f9ea6),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.person_add),
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 18),
                                  child: AutoSizeText(
                                    'SEND CONNECTION REQUEST',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF0d9bdc),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Write reference',
                                      minFontSize: 10,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFF32A3FD)),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.done_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Recommend',
                                      maxLines: 1,
                                      minFontSize: 10,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF32A3FD),
                                      ),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            Divider(
                              height: 1,
                              color: Colors.grey.shade300,
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 4),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  cardDataLoad('250+', 'CONNECTIONS'),
                                  cardDataLoad('14k', 'LEADER POINTS'),
                                  const CircleAvatar(
                                    radius: 30,
                                    backgroundImage: NetworkImage(
                                        'https://cdn.pixabay.com/photo/2012/11/26/15/07/earth-67359__340.jpg'),
                                  ),
                                  cardDataLoad('3', 'REFERENCES'),
                                  cardDataLoad('312', 'RECOMMENDATIONS')
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                )
              : Padding(
                  padding: EdgeInsets.only(
                    top: _height * .22,

                  ),
                  child: Center(
                    child: Padding(
                      padding: EdgeInsets.all(8),
                      child: Container(
                        width: _width,
                        key: widget.headerCardKey,
                        color: Colors.white,
                        child: Column(
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(4.0),
                              child: Text(
                                'Noberto Holden',
                                textAlign: TextAlign.center,
                                style: TextStyle(
                                    fontSize: 40,
                                    color: Color(0xFF272E41),
                                    fontWeight: FontWeight.w400),
                              ),
                            ),
                            Card(
                              child: Text('AHL'),
                            ),
                            Padding(
                              padding: EdgeInsets.all(4.0),
                              child: AutoSizeText(
                                'Business development manager,recruiter and hotel specialist',
                                maxLines: 2,
                                minFontSize: 12,
                                style: TextStyle(
                                    color: Color(0xFF7C8990), fontSize: 16),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: RichText(
                                text: TextSpan(
                                  children: [
                                    WidgetSpan(
                                      child: Container(
                                        padding:
                                            const EdgeInsets.only(right: 4.0),
                                        child: const Icon(
                                          Icons.location_on,
                                          color: Color(
                                            0xFF8f9ea6,
                                          ),
                                          size: 18,
                                        ),
                                      ),
                                    ),
                                    const TextSpan(
                                        text: 'Cape Town, South Africa',
                                        style: TextStyle(
                                            fontSize: 14,
                                            color: Color(0xff7C8990)))
                                  ],
                                  style: const TextStyle(
                                    color: Color(0xFF8f9ea6),
                                  ),
                                ),
                              ),
                            ),
                            Row(mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: OutlinedButton.icon(
                                    style: const ButtonStyle(),
                                    onPressed: () {
                                      openDialog(context);
                                    },
                                    label: const Text(
                                      'contact card',
                                      style:
                                      TextStyle(color: Colors.grey, fontSize: 12),
                                    ),
                                    icon: const Icon(
                                      Icons.contact_phone_outlined,
                                      color: Colors.grey,
                                      size: 12,
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: DropdownButton(
                                    value: valueChoose,
                                    onChanged: (newValue) {
                                      setState(() {
                                        valueChoose = newValue as String;
                                      });
                                    },
                                    items: listItem.map((valueItem) {
                                      return DropdownMenuItem(
                                        value: valueItem,
                                        child: Text(valueItem),
                                      );
                                    }).toList(),
                                  ),
                                ),
                              ],
                            ),

                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: ElevatedButton.icon(
                                onPressed: () {},
                                icon: const Icon(Icons.person_add),
                                label: const Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 14, horizontal: 18),
                                  child: AutoSizeText(
                                    'SEND CONNECTION REQUEST',
                                    maxLines: 1,
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: Colors.white,
                                        fontWeight: FontWeight.w400),
                                  ),
                                ),
                                style: ElevatedButton.styleFrom(
                                  primary: const Color(0xFF0d9bdc),
                                ),
                              ),
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Write reference',
                                      minFontSize: 10,
                                      maxLines: 1,
                                      style: TextStyle(
                                          fontWeight: FontWeight.w400,
                                          fontSize: 14,
                                          color: Color(0xFF32A3FD)),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.done_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                                SizedBox(
                                  width: 2,
                                ),
                                OutlinedButton.icon(
                                  style: ButtonStyle(
                                    backgroundColor: MaterialStateProperty.all(
                                      const Color(0xFFe5f4fb),
                                    ),
                                  ),
                                  onPressed: () {},
                                  label: const Padding(
                                    padding: EdgeInsets.symmetric(vertical: 10),
                                    child: AutoSizeText(
                                      'Recommend',
                                      maxLines: 1,
                                      minFontSize: 10,
                                      style: TextStyle(
                                        fontWeight: FontWeight.w400,
                                        fontSize: 14,
                                        color: Color(0xFF32A3FD),
                                      ),
                                    ),
                                  ),
                                  icon: const Icon(
                                    Icons.thumb_up_alt_outlined,
                                    size: 16,
                                    color: Color(0xFF32A3FD),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(
                              height: 30,
                            ),
                            const CircleAvatar(
                              radius: 30,
                              backgroundImage: NetworkImage(
                                  'https://cdn.pixabay.com/photo/2012/11/26/15/07/earth-67359__340.jpg'),
                            ),
                            Divider(
                              height: 3,
                              color: Colors.grey,
                            ),

                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  vertical: 12, horizontal: 4),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceAround,
                                children: [
                                  cardDataLoad('250+', 'CONNECTIONS'),
                                  cardDataLoad('14k', 'LEADER POINTS'),

                                  cardDataLoad('3', 'REFERENCES'),
                                  cardDataLoad('312', 'RECOMMENDATIONS')
                                ],
                              ),
                            ),

                          ],
                        ),
                      ),
                    ),
                  ),
                ),
          Positioned(
            top: _height * 0.14,
            child: Center(
              child: Container(
                height: 76,
                width: 76,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  image: const DecorationImage(
                      image: NetworkImage(
                          'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                      fit: BoxFit.cover),
                ),
              ),
            ),
          ),
          widget.isEditable
              ? Padding(
                  padding: EdgeInsets.only(
                    top: _height * .18,
                    bottom: _height * .16,
                  ),
                  child: ProfileEdit.buildProfileEdit(
                      width: widget.headerCard_W,
                      height: widget.headerCard_H,
                      popUpEdit: () {
                        buildProfileCard();
                      },showAddButton: false),
                )
              : Container(),
          // Responsive.isDesktop(context)
          //     ? Positioned(
          //         top: 0,
          //         child: Header(),
          //       )
          //     : Container()
        ],
      ),
    );
  }
}
