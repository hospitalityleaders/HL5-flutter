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

  Widget buildInboxHover() {
    return Container(
      height: 150,
      width: 300,
      color: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Container(

      width: _width,
      color: const Color(0xFF384677),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          const Padding(
            padding: EdgeInsets.only(left: 30),
            child: SizedBox(
              height: 36,
              child: Image(
                image: NetworkImage(
                    'https://media.istockphoto.com/photos/yellow-black-outlined-font-letter-h-3d-picture-id1340359277?s=612x612'),
                fit: BoxFit.cover,
              ),
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
          Stack(
            children: [
              MouseRegion(
                  onHover: onInboxHover,
                  onExit: exitInboxHover,
                  child: IconButton(
                    icon: const Icon(
                      Icons.mail_outline_outlined,
                    ),
                    onPressed: () {},
                  )),
              Positioned(top: 30,child: _inboxHover ? buildInboxHover() : Container(),)
            ],
          )
        ],
      ),
    );
  }
}
