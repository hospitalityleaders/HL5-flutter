import 'package:flutter/material.dart';

//Header card

class HeaderCard extends StatefulWidget {
  final bool data;

  const HeaderCard({Key? key, required this.data}) : super(key: key);

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
          style: const TextStyle(
              color: Color(0xFF32A3FD),
              fontSize: 18,
              fontWeight: FontWeight.w400),
          maxLines: 1,
        ),
        const SizedBox(height: 3),
        Text(
          name,
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
          Padding(
            padding: EdgeInsets.only(
              top: _height * .16,
              bottom: _height * .16,
            ),
            child: Center(
              child: Container(
                width: _width * .45,
                height: 435,
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
                      child: Text(
                        'Business development manager,recruiter and hotel specialist',
                        style:
                            TextStyle(color: Color(0xFF7C8990), fontSize: 16),
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
                                padding: const EdgeInsets.only(right: 4.0),
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
                                    fontSize: 14, color: Color(0xff7C8990)))
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
                        height: 50,
                        width: _width * .24,
                        child: ElevatedButton.icon(
                          onPressed: () {},
                          icon: const Icon(Icons.person_add),
                          label: const Text(
                            'SEND CONNECTION REQUEST',
                            style: TextStyle(
                                fontSize: 14,
                                color: Colors.white,
                                fontWeight: FontWeight.w400),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0d9bdc),
                            minimumSize: const Size(200, 50),
                            maximumSize: const Size(200, 50),
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 35,
                          width: _width * .12,
                          child: OutlinedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFe5f4fb),
                              ),
                            ),
                            onPressed: () {},
                            label: const Text(
                              'Recommend',
                              style: TextStyle(
                                fontWeight: FontWeight.w400,
                                fontSize: 14,
                                color: Color(0xFF32A3FD),
                              ),
                            ),
                            icon: const Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Color(0xFF32A3FD),
                            ),
                          ),
                        ),
                        const SizedBox(
                          width: 2,
                        ),
                        SizedBox(
                          height: 35,
                          width: _width * .12,
                          child: OutlinedButton.icon(
                            style: ButtonStyle(
                              backgroundColor: MaterialStateProperty.all(
                                const Color(0xFFe5f4fb),
                              ),
                            ),
                            onPressed: () {},
                            label: const Text(
                              'Write reference',
                              style: TextStyle(
                                  fontWeight: FontWeight.w400,
                                  fontSize: 14,
                                  color: Color(0xFF32A3FD)),
                            ),
                            icon: const Icon(
                              Icons.done_outlined,
                              color: Color(0xFF32A3FD),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Divider(
                      height: 1,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
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
                      ],
                    ),
                    const SizedBox(
                      height: 10,
                    )
                  ],
                ),
              ),
            ),
          ),
          Positioned(
            top: _height * 0.10,
            child: Center(
              child: Container(
                height: 80,
                width: 85,
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
          widget.data
              ? Padding(
                  padding: EdgeInsets.only(
                    top: _height * .16,
                    bottom: _height * .16,
                  ),
                  child: Container(
                    width: _width * .45,
                    height: 435,
                    color: const Color(0xFF79d5ff).withOpacity(0.5),
                    child: Center(
                      child: CircleAvatar(backgroundColor: Colors.blue,
                        radius: 30,
                        child: IconButton(onPressed: (){},icon: const Icon(Icons.edit,color: Colors.white,)),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
