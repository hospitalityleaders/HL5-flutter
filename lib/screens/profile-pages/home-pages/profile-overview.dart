import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ProfileOverview extends StatefulWidget {
  const ProfileOverview({Key? key}) : super(key: key);

  @override
  _ProfileOverviewState createState() => _ProfileOverviewState();
}

class _ProfileOverviewState extends State<ProfileOverview> {
  // Profile Overview Rows(column 1 functionality)
  String profileSummary =
      '''Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.

Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum. Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium, totam rem aperiam, eaque ipsa quae ab illo inventore veritatis et quasi architecto beatae vitae dicta sunt explicabo.

Nemo enim ipsam voluptatem quia voluptas sit aspernatur aut odit aut fugit, sed quia consequuntur magni dolores eos qui ratione voluptatem sequi nesciunt.''';


  Widget buildAreaOfExpertiseButton(String btnName) {
    return ElevatedButton.icon(
      style: ElevatedButton.styleFrom(
        primary: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(1),
        ),
      ),
      onPressed: () {},
      icon: const Padding(
        padding: EdgeInsets.symmetric(vertical: 15.0),
        child: Icon(
          Icons.check_circle,
          color: Color(0xFF0D9BDC),
          size: 16,
        ),
      ),
      label: Text(
        btnName,
        style: const TextStyle(
            color: Color(0xFF22b375e),
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  // Profile Overview Rows(column 2 functionality)

  Widget buildProfileCards(
      _width,
      String cardName,
      String cardTitle,
      String cardSubTitle,
      String cardDate,
      String cardBtn,
      String cardDetail,
      IconData cardIcon) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _width * .25,
        color: Colors.white,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                cardName,
                style: TextStyle(color: Color(0xFF171f39), fontSize: 20),
              ),
            ),
            const SizedBox(height: 8),
            Divider(
              height: 1,
              color: Colors.grey.shade400,
            ),
            const SizedBox(
              height: 10,
            ),
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
                            color: Color(0xFF2b375e),
                            fontSize: 22,
                            fontWeight: FontWeight.w800),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      GestureDetector(
                          child: Text(
                            cardSubTitle,
                            style: const TextStyle(
                              fontSize: 14,
                              color: Color(0xFF0d9bdc),
                            ),
                          ),
                          onTap: () {}),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        cardDate,
                        style: TextStyle(
                            fontSize: 16, color: const Color(0xFF5d6569)),
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
              color: const Color(0xFFf2f3f5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  TextButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add),
                    label: Text(cardBtn),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  // Profile Overview Rows(column 3 functionality)
  double value = 0.25;

  Widget profileListTile(IconData icon, String title) {
    return Column(
      children: [
        ListTile(
          onTap: () {
            showDialog(
              context: context,
              builder: (context) => Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: ListView(
                  children: [
                    Card(
                      color: const Color(0xFFdddfe3),
                      child: Column(
                        children: [
                          Card(
                            color: Colors.white,
                            elevation: 0.0,
                            child: ListTile(
                              minLeadingWidth: 1,
                              title: const Text('Work experience'),
                              trailing: IconButton(
                                  icon: const Icon(
                                    Icons.cancel_outlined,
                                    color: Color(0xff0d9bdc),
                                  ),
                                  onPressed: () => Navigator.pop(context)),
                            ),
                          ),
                          const SizedBox(
                            height: 80,
                          ),
                          Card(
                            color: Colors.white,
                            elevation: 0.0,
                            child: ListTile(
                              leading: Container(
                                height: 40,
                                width: 40,
                                decoration: const BoxDecoration(
                                  color: Color(0xFF0d9bdc),
                                ),
                                child: const Icon(
                                  Icons.apartment_outlined,
                                  color: Colors.white,
                                ),
                              ),
                              title: Column(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: const [
                                  Text('General Manager'),
                                  Text('Fairmont Zimbali Resort · Cape Town'),
                                ],
                              ),
                              subtitle: const Text(
                                  'February 2012 – January 2013 (11 months)'),
                            ),
                          ),
                          const SizedBox(
                            height: 500,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
          leading: Icon(
            icon,
            color: const Color(0xFF0d9bdc),
          ),
          title: Text(
            title,
            style: const TextStyle(
                color: Color(0xFF0d9bdc),
                fontSize: 16,
                fontWeight: FontWeight.bold),
          ),
          trailing: const Card(
            elevation: 1.0,
            margin: EdgeInsets.all(2),
            color: Color(0xff1d2645),
            child: Text(
              '+20%',
              style: TextStyle(
                color: Color(0xFF0d9bdc),
              ),
            ),
          ),
        ),
        const SizedBox(height: 10),
        const Divider(
          height: 1,
          color: Color(0xFF1d2645),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      // Profile Overview Rows
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Profile Overview Rows(column 1)
          SizedBox(width: _width * .25,
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    width: _width * .25,
                    color: Colors.white,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Text(
                            'Profile summary',
                            style: TextStyle(color: Color(0xFF171f39), fontSize: 20),
                          ),
                        ),
                        const SizedBox(height: 8),
                        Divider(
                          height: 1,
                          color: Colors.grey.shade400,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            profileSummary,
                            style: const TextStyle(
                                fontSize: 16, color: Color(0xFF5d6569), height: 1.5),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 10),
                Card(shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(1)),
                  child: Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Row(
                      children: const [
                        Text(
                          'Areas of expertise',
                          style: TextStyle(
                              fontWeight: FontWeight.w300,
                              fontSize: 20,
                              color: Color(0xff171f39)),
                        ),
                      ],
                    ),
                  ),
                ),
                Wrap(
                  spacing: 5,
                  runSpacing: 3,
                  children: [
                    buildAreaOfExpertiseButton('Business management'),
                    buildAreaOfExpertiseButton('Training'),
                    buildAreaOfExpertiseButton('Leadership'),
                    buildAreaOfExpertiseButton('Growth hacking'),
                    buildAreaOfExpertiseButton('Finance'),
                    buildAreaOfExpertiseButton('Acquisitions'),
                    buildAreaOfExpertiseButton('Recruitment'),
                    buildAreaOfExpertiseButton(' Hotel groups'),
                    buildAreaOfExpertiseButton('Consulting'),
                    buildAreaOfExpertiseButton('Public speaking'),
                    ElevatedButton.icon(
                      style: ElevatedButton.styleFrom(
                        primary: const Color(0xFFe5f4fb),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(1),
                        ),
                      ),
                      onPressed: () {},
                      icon: const Padding(
                        padding: EdgeInsets.symmetric(vertical: 15.0),
                        child: Icon(
                          Icons.add,
                          color: Color(0xFF0D9BDC),
                          size: 16,
                        ),
                      ),
                      label: const Padding(
                        padding: EdgeInsets.all(1.0),
                        child: Text(
                          'Show all',
                          style: TextStyle(
                              color: Color(0xFF0D9BDC),
                              fontWeight: FontWeight.w300,
                              fontSize: 14),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 10),

              ],
            ),
          ),
          // Profile Overview Rows(column 2)
          Column(
            children: [
              buildProfileCards(
                  _width,
                  'Work experience',
                  'Food and Beverage Manager',
                  'Marriott Hotels',
                  'February 2013 – 2014 (1 year 6 months)',
                  'Show more',
                  'Card-Details',
                  Icons.apartment_rounded),
              buildProfileCards(
                  _width,
                  'Education',
                  'University of Cape Town',
                  'Postgraduate Degree in Business Science',
                  '2010 - 2013',
                  'Course outline',
                  'Card-Details',
                  Icons.school_outlined),
              buildProfileCards(
                  _width,
                  'Achievement',
                  'Marriott Hotel and Resorts employee of the year awards',
                  'www.mariiott.com/awards',
                  '',
                  ' More info',
                  'Card-Details',
                  Icons.shield),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  width: _width * .25,
                  color: Colors.white,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          'Languages',
                          style:
                              TextStyle(color: Color(0xFF171f39), fontSize: 20),
                        ),
                      ),
                      const SizedBox(height: 8),
                      Divider(
                        height: 1,
                        color: Colors.grey.shade400,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                                      Text(
                                        'English',
                                        style: TextStyle(
                                            color: Color(0xFF2b375e),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Native and bilingual profiency',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF5d6569)),
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
                                        'English',
                                        style: TextStyle(
                                            color: Color(0xFF2b375e),
                                            fontSize: 22,
                                            fontWeight: FontWeight.w800),
                                      ),
                                      SizedBox(
                                        height: 5,
                                      ),
                                      Text(
                                        'Native and bilingual profiency',
                                        style: TextStyle(
                                            fontSize: 16,
                                            color: Color(0xFF5d6569)),
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
              )
            ],
          ),
          // Profile Overview Rows(column 3)
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                  color: const Color(0xff2b375e),
                  width: _width * .25,
                  child: Column(
                    children: [
                      Text(
                        '${(value * 100).toInt()}%',
                        style:
                            const TextStyle(fontSize: 48, color: Colors.white),
                      ),
                      const SizedBox(height: 10),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: LinearProgressIndicator(
                          value: value,
                          valueColor: const AlwaysStoppedAnimation(Colors.red),
                          backgroundColor: const Color(0xFF212b4d),
                          minHeight: 10,
                        ),
                      ),
                      const SizedBox(height: 10),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          'Your profile is only ${(value * 100).toInt()}% complete.Improve it now.Here\'s how',
                          textAlign: TextAlign.center,
                          style: const TextStyle(
                              color: Colors.white, fontSize: 20, height: 1.5),
                        ),
                      ),
                      profileListTile(
                          Icons.add_box_outlined, 'Add your work experience'),
                      profileListTile(
                          Icons.add_box_outlined, 'Add your qualifications'),
                      profileListTile(
                          Icons.add_box_outlined, 'Add your specialities'),
                      profileListTile(
                          Icons.add_box_outlined, 'Add your languages'),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.all(4.0),
                        child: ElevatedButton(
                          onPressed: () {},
                          child: Padding(
                            padding: const EdgeInsets.symmetric(
                              vertical: 12,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Text(
                                  'EDIT MY PROFILE',
                                  style: TextStyle(
                                      fontSize: 18,
                                      color: Colors.white,
                                      fontWeight: FontWeight.w700),
                                ),
                              ],
                            ),
                          ),
                          style: ElevatedButton.styleFrom(
                            primary: const Color(0xFF0d9bdc),
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
