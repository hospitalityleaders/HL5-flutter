import 'package:flutter/material.dart';

class ReferencesCard {
  Widget buildReferencesCard(
      _width,
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
            width: _width * .29,
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
      ],
    );
  }
}

class References extends StatefulWidget {
  const References({Key? key}) : super(key: key);

  @override
  _ReferencesState createState() => _ReferencesState();
}

class _ReferencesState extends State<References> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
                child: Wrap(
              spacing: 5,
              runSpacing: 3,
            )),
            Expanded(
                child: Column(
              children: [],
            ))
          ],
        ),
      ),
    );
  }
}
