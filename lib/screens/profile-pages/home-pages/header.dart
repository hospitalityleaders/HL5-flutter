import 'package:flutter/material.dart';

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
    child: Text(
      menuBtn,
      style: const TextStyle(color: Colors.white),
    ),
  );
}

class _HeaderState extends State<Header> {
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: double.infinity,
      color: const Color(0xFF2b375e),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          const Image(
            image: NetworkImage(
                'https://media.istockphoto.com/photos/yellow-black-outlined-font-letter-h-3d-picture-id1340359277?s=612x612'),
            fit: BoxFit.cover,
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
        ],
      ),
    );
  }
}



class HeaderCard extends StatefulWidget {
  const HeaderCard({Key? key}) : super(key: key);

  @override
  _HeaderCardState createState() => _HeaderCardState();
}

class _HeaderCardState extends State<HeaderCard> {

  Widget cardDataLoad(String no, String name) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          no,
          style: const TextStyle(color: Color(0xFF0d9be3), fontSize: 18),
          maxLines: 1,
        ),
        const SizedBox(height: 3),
        Text(
          name,
          style: const TextStyle(color: Color(0xFFa5bbbd), fontSize: 12),
          textAlign: TextAlign.center,
        )
      ],
    );
  }


  String? valueChoose;
  List listItem = ['item1 ', 'item2'];

  Future openDialog(BuildContext context) => showDialog(
    context: context,
    builder: (context) => Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 415,
            width: double.infinity,
            color: Colors.white,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(
                  height: 60,
                  width: double.infinity,
                  child: Row(
                    // mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            height: 60,
                            width: 60,
                            decoration: const BoxDecoration(
                                image: DecorationImage(
                                    image: NetworkImage(
                                        'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                    fit: BoxFit.cover)),
                          ),
                        ],
                      ),
                      const Card(
                        elevation: 0.0,
                        child: Text(
                          'General Manager, Four Seasons',
                          style:
                          TextStyle(fontSize: 20, color: Colors.black),
                        ),
                      ),
                      Card(
                        elevation: 0.0,
                        child: IconButton(
                          icon: const Icon(Icons.cancel),
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
  );
  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return  Container(
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
          Padding(
            padding: EdgeInsets.only(
              top: _height*.16,
              bottom: _height*.14,
              right: _width * 0.25,
              left: _width * 0.25,
            ),
            child: Column(
              children: [
                Card(
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          OutlinedButton.icon(
                            style: const ButtonStyle(),
                            onPressed: () {
                              openDialog(context);
                            },
                            label: const Text(
                              'contact card',
                              style: TextStyle(color: Colors.grey),
                            ),
                            icon: const Icon(
                              Icons.contact_phone_outlined,
                              color: Colors.grey,
                            ),
                          ),
                          DropdownButton(
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
                        ],
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Noberto Holden',
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 40,
                              color: Color(0xFF171f39),
                              fontWeight: FontWeight.w100),
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.all(4.0),
                        child: Text(
                          'Business development manager,recruiter and hotel specialist',
                          style: TextStyle(
                              color: Color(0xFF8f9ea6), fontSize: 18),
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
                                  style: TextStyle(fontSize: 18))
                            ],
                            style: const TextStyle(
                              color: Color(0xFF8f9ea6),
                            ),
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: SizedBox(
                          height: 60,
                          child: ElevatedButton.icon(
                            onPressed: () {},
                            icon: const Icon(Icons.person_add),
                            label: const Text(
                              'SEND CONNECTION REQUEST',
                              style: TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w700),
                            ),
                            style: ElevatedButton.styleFrom(
                              primary: const Color(0xFF0d9bdc),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 35,
                            child: OutlinedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                  const Color(0xFFe5f4fb),
                                ),
                              ),
                              onPressed: () {},
                              label: const Text(
                                'Recommend',
                                style: TextStyle(
                                  color: Color(0xFF0d9bdc),
                                ),
                              ),
                              icon: const Icon(
                                Icons.thumb_up_alt_outlined,
                                color: Color(0xFF0d9bdc),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 2,
                          ),
                          SizedBox(
                            height: 35,
                            child: OutlinedButton.icon(
                              style: ButtonStyle(
                                backgroundColor:
                                MaterialStateProperty.all(
                                  const Color(0xFFe5f4fb),
                                ),
                              ),
                              onPressed: () {},
                              label: const Text(
                                'Write reference',
                                style: TextStyle(
                                    color: Color(0xFF0d9bdc)),
                              ),
                              icon: const Icon(
                                Icons.done_outlined,
                                color: Color(0xFF0d9bdc),
                              ),
                            ),
                          ),

                        ],
                      ),
                      const SizedBox(height: 50,),
                      Divider(height: 1,color: Colors.grey.shade300,),
                      const SizedBox(height: 20,),
                      Row(children: [
                        Expanded(child: cardDataLoad('250+', 'CONNECTIONS')),
                        Expanded(child: cardDataLoad('14k', 'LEADER POINTS')),
                        const Expanded(
                          child: CircleAvatar(
                            radius: 30,
                            backgroundImage: NetworkImage(
                                'https://cdn.pixabay.com/photo/2012/11/26/15/07/earth-67359__340.jpg'),
                          ),
                        ),
                        Expanded(child: cardDataLoad('3', 'REFERENCES')),
                        Expanded(child: cardDataLoad('312', 'RECOMMENDATIONS'))
                      ],),

                      const SizedBox(height: 50,)
                    ],
                  ),
                ),
              ],
            ),
          ),

          Positioned(
            top: 75,
            child: Container(
              height: 80,
              width:85,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5),
                image: const DecorationImage(
                    image: NetworkImage(
                        'https://images.pexels.com/photos/937481/pexels-photo-937481.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                    fit: BoxFit.cover),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

