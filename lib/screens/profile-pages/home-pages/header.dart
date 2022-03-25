import 'dart:math';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

//header
class Header extends StatefulWidget {
  const Header({Key? key}) : super(key: key);

  @override
  _HeaderState createState() => _HeaderState();
}

List<DropdownMenuItem<String>> items = <String>['Peoples', 'Jobs', 'News']
    .map<DropdownMenuItem<String>>((String value) {
  return DropdownMenuItem<String>(value: value, child: Text(value));
}).toList();
String dropdownValue = 'Peoples';

Widget buildMenuBtn(String menuBtn) {
  return TextButton(
    onPressed: () {},
    child: AutoSizeText(
      menuBtn,
      maxLines: 1,
      minFontSize: 10,
      style: const TextStyle(
        color: Colors.white,
        fontSize: 16,
      ),
    ),
  );
}

class _HeaderState extends State<Header> {
// InboxHover
  bool _inboxHover = false;

  void onInboxHover(PointerHoverEvent) {
    return setState(() {
      _inboxHover = !_inboxHover;
    });
  }

  void exitInboxHover(PointerHoverEvent) {
    return setState(() {
      _inboxHover != _inboxHover;
    });
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Container(
      height: 50,
      width: _width,
      color: const Color(0xFF384677),
      child: Padding(
        padding:  EdgeInsets.symmetric(horizontal: _width*.050),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            SizedBox(
              height: 36,
              child: Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/photos/yellow-black-outlined-font-letter-h-3d-picture-id1340359277?s=612x612'),
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(
              width: 5,
            ),
            SizedBox(
              width: 250,
              child: Card(
                color: const Color(0xFF1d2645),
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.search_outlined,
                          color: Colors.grey,
                        )),
                    const Expanded(
                      flex: 2,
                      child: TextField(
                        decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: 'Search',
                            hintStyle: TextStyle(color: Colors.grey)),
                      ),
                    ),
                    DropdownButton(
                      items: items,
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      value: dropdownValue,
                      style: const TextStyle(color: Colors.grey),
                      borderRadius: BorderRadius.circular(5),
                    )
                  ],
                ),
              ),
            ),
            buildMenuBtn('Home'),
            buildMenuBtn('Profile'),
            buildMenuBtn('News'),
            buildMenuBtn('Jobs'),
            buildMenuBtn('Recruitment'),
            buildMenuBtn('Help'),
            PopUpIcon(
              icon: Icons.mail_outline_outlined,
            ),
          ],
        ),
      ),
    );
  }
}

class PopUpIcon extends StatefulWidget {
  final IconData icon;

  const PopUpIcon({
    Key? key,
    required this.icon,
  }) : super(key: key);

  @override
  State<PopUpIcon> createState() => _PopUpIconState();
}

class _PopUpIconState extends State<PopUpIcon> {
  bool popUp = false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 140.0,
      width: 100.0,
      child: Center(
        child: Stack(
          children: [
            AnimatedOpacity(
              opacity: popUp ? 1.0 : 0.0,
              duration: Duration(milliseconds: 200),
              child: AnimatedAlign(
                curve: popUp ? Curves.easeOutBack : Curves.easeIn,
                alignment: popUp ? Alignment(0.0, -1.0) : Alignment(0.0, 0.0),
                duration: Duration(milliseconds: 200),
                child: Stack(
                  clipBehavior: Clip.none,
                  children: [
                    Positioned(
                      right: 0,
                      top: 55.0,
                      child: Transform(
                        transform: Matrix4.rotationZ(pi / 4),
                        alignment: FractionalOffset.center,
                        child: Container(
                          height: 10.0,
                          width: 10.0,
                          color: Color(0xFF384677),
                        ),
                      ),
                    ),
                    Positioned(
                      top: 50,
                      child: Column(
                        children: [
                          InboxPopUpProfile(
                              Icons.circle, 'title', 'subtitle', 'date')
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              child: MouseRegion(
                onEnter: (value) {
                  setState(() {
                    popUp = true;
                  });
                },
                onExit: (value) {
                  setState(() {
                    popUp = false;
                  });
                },
                child: AnimatedContainer(
                  height: 50,
                  width: 70.0,
                  duration: Duration(milliseconds: 375),
                  decoration: BoxDecoration(
                    color: popUp ? Color(0xFF7a85a6) : Colors.transparent,
                  ),
                  child: Icon(
                    widget.icon,
                    color: popUp ? Colors.white : Color(0xFF6C779E),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

InboxPopUpProfile(IconData icon, String title, String subtitle, String date) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: Container(
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            color: Color(0xFF384677),
            height: 30,
            width: 300,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'INBOX',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
                Container(
                  child: Text(
                    'Compose',
                    style: TextStyle(color: Colors.white),
                  ),
                )
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    top: 23, bottom: 23, right: 14, left: 20),
                height: 50,
                width: 50,
                color: Color(0xFF7a85a6),
                child: Icon(
                  icon,
                  color: Colors.white,
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                        color: Color(0xff272E41)),
                  ),
                  Text(
                    subtitle,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xFF7a85a6)),
                  ),
                  Text(
                    date,
                    style: const TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                        color: Color(0xff7C8990)),
                  ),
                ],
              )
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton(onPressed: () {}, child: Text('View all messages')),
            ],
          )
        ],
      ),
    ),
  );
}
