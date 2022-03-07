import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:auto_size_text/auto_size_text.dart';

class ProfileOverview extends StatefulWidget {
  late bool data;

  ProfileOverview({Key? key, required this.data}) : super(key: key);

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
        padding: EdgeInsets.symmetric(vertical: 12.0),
        child: Icon(
          Icons.check_circle,
          color: Color(0xFF0D9BDC),
          size: 14,
        ),
      ),
      label: Text(
        btnName,
        style: const TextStyle(
            color: Color(0xff272E41),
            fontSize: 14,
            fontWeight: FontWeight.w400),
      ),
    );
  }

  Widget buildReferencesCard(
      String img, String title, String subTitle, String description) {
    return Container(
      padding: const EdgeInsets.all(6),
      color: Colors.white,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: Image(
              width: 45,
              height: 45,
              image: NetworkImage(img),
              fit: BoxFit.cover,
            ),
            title: Text(
              title,
              textAlign: TextAlign.start,
              style: const TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                  color: Color(0xff272E41)),
            ),
            subtitle: Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Text(
                subTitle,
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.w400,
                  color: Color(0xff7C8990),
                ),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RichText(
              text: TextSpan(
                style: const TextStyle(color: Colors.black, fontSize: 30),
                children: [
                  WidgetSpan(
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 2.0, vertical: 2),
                        child: Card(
                          color: Colors.blue,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(1.0)),
                          child: const Icon(
                            Icons.format_quote_rounded,
                            color: Colors.white,
                          ),
                        ),
                      ),
                    ),
                  ),
                  TextSpan(
                    text: description,
                    style: const TextStyle(
                        height: 1.2,
                        fontSize: 14,
                        color: Color(0xff7C8990),
                        fontWeight: FontWeight.w400),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              TextButton.icon(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.add,
                    color: Color(0xFF0d9bdc),
                  ),
                  label: const Text(
                    'Show more',
                    style: TextStyle(color: Color(0xFF0d9bdc), fontSize: 14),
                  )),
            ],
          ),
        ],
      ),
    );
  }

  // Profile Overview Rows(column 2 functionality)
//work exp/education/achivement
  Widget buildProfileCards(
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
                  color: widget.data
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
        widget.data ? buildProfileEdit(_width, 170) : Container()
      ],
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

  Widget buildConnectionsCard(String image) {
    return Container(
      height: 60,
      width: 60,
      decoration: BoxDecoration(
          image:
              DecorationImage(image: NetworkImage(image), fit: BoxFit.cover)),
    );
  }

  Widget buildProfileEdit(_width, _height) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Container(
        width: _width * .29,
        height: _height,
        color: const Color(0xFF79d5ff).withOpacity(0.5),
        child: Center(
          child: CircleAvatar(
            backgroundColor: Colors.blue,
            radius: 30,
            child: IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.edit,
                  color: Colors.white,
                )),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;

    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.only(right: 20, left: 20, top: 25),
        // Profile Overview Rows
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Profile Overview Rows(column 1)
            SizedBox(
              width: _width * .29,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(height: _height,
                          color: Colors.white,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Padding(
                                padding: EdgeInsets.only(
                                    right: 20, left: 20, bottom: 5, top: 13),
                                child: Text(
                                  'Profile summary',
                                  style: TextStyle(
                                      color: Color(0xFF171f39),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Divider(
                                height: 0.5,
                                color: Color(0xffE5E5E5),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(
                                    right: 20, left: 20, bottom: 13, top: 13),
                                child: AutoSizeText(
                                  profileSummary,
                                  minFontSize: 8,
                                  style: const TextStyle(
                                      fontSize: 16,
                                      color: Color(
                                        0xFF7C8990,
                                      ),
                                      fontWeight: FontWeight.w400,
                                      height: 1.5),
                                ),
                              )
                            ],
                          ),
                        ),
                      ),
                      widget.data ? buildProfileEdit(_width, _height) : Container(),
                    ],
                  ),

                  Stack(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            color: Colors.white,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: const [
                                Text(
                                  'Areas of expertise',
                                  style: TextStyle(
                                      color: Color(0xFF171f39),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                                SizedBox(height: 8),
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Wrap(
                              spacing: 5,
                              runSpacing: 3,
                              children: [
                                buildAreaOfExpertiseButton(
                                    'Business management'),
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
                                    padding:
                                        EdgeInsets.symmetric(vertical: 12.0),
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
                          ),
                        ],
                      ),
                      widget.data ? buildProfileEdit(_width, 260) : Container(),
                    ],
                  ),

                  const SizedBox(height: 10),

                  //References card
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
                                padding: EdgeInsets.only(
                                    right: 20, left: 20, bottom: 5, top: 13),
                                child: Text(
                                  'References',
                                  style: TextStyle(
                                      color: Color(0xFF171f39),
                                      fontSize: 20,
                                      fontWeight: FontWeight.w400),
                                ),
                              ),
                              const SizedBox(height: 8),
                              const Divider(color: Colors.grey, height: 1),
                              buildReferencesCard(
                                'https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                'Sarah Lee MHL',
                                'General Manager, One & Only Hotel',
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              ),

                              const Divider(
                                height: 1,
                                color: Colors.grey,
                              ),
                              buildReferencesCard(
                                'https://images.pexels.com/photos/712521/pexels-photo-712521.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500',
                                'Sarah Lee MHL',
                                'General Manager, One & Only Hotel',
                                'Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.',
                              ),
                              //work experience card
                              const SizedBox(height: 10),
                            ],
                          ),
                        ),
                      ),
                      widget.data ? buildProfileEdit(_width, 490) : Container()
                    ],
                  ),
                  const SizedBox(height: 50)
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
                Stack(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        width: _width * .29,
                        color: Colors.white,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const Padding(
                              padding: EdgeInsets.all(8.0),
                              child: Text(
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
                                color: widget.data
                                    ? const Color.fromRGBO(88, 203, 255, 0.8)
                                    : Colors.grey.shade400),
                            const SizedBox(height: 10),
                            Column(
                              children: [
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                                  color: Color(0xFF272E41),
                                                  fontSize: 16,
                                                  fontWeight: FontWeight.w700),
                                            ),
                                            SizedBox(
                                              height: 5,
                                            ),
                                            Text(
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
                                  color: widget.data
                                      ? const Color.fromRGBO(88, 203, 255, 0.8)
                                      : Colors.grey.shade400,
                                ),
                                Padding(
                                  padding: const EdgeInsets.all(12.0),
                                  child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                    widget.data ? buildProfileEdit(_width, 212) : Container(),
                  ],
                ),
              ],
            ),
            // Profile Overview Rows(column 3)
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Container(
                    padding:
                        const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
                    color: const Color(0xff2b375e),
                    width: _width * .29,
                    child: Column(
                      children: [
                        Text(
                          '${(value * 100).toInt()}%',
                          style: const TextStyle(
                              fontSize: 48, color: Colors.white),
                        ),
                        const SizedBox(height: 10),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(20),
                          child: LinearProgressIndicator(
                            value: value,
                            valueColor:
                                const AlwaysStoppedAnimation(Colors.red),
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
                            onPressed: () {
                              setState(() {
                                widget.data = !widget.data;
                              });
                            },
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
                              primary: const Color(0xFF32A3FD),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Container(
                      width: _width * .29,
                      color: Colors.white,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Text(
                              'Connections',
                              style: TextStyle(
                                  color: Color(0xFF272E41),
                                  fontSize: 20,
                                  fontWeight: FontWeight.w400),
                            ),
                          ),
                          const SizedBox(height: 8),
                          Divider(height: 1, color: Colors.grey.shade400),
                          const SizedBox(height: 10),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Wrap(
                              children: [
                                Container(
                                  height: 60,
                                  width: 120,
                                  color: const Color(0xff0D9BDC),
                                  child: const Center(
                                    child: Text(
                                      '250+',
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 24),
                                    ),
                                  ),
                                ),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/842567/pexels-photo-842567.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/716411/pexels-photo-716411.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/1036622/pexels-photo-1036622.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/3727462/pexels-photo-3727462.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/1321943/pexels-photo-1321943.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/1043474/pexels-photo-1043474.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/3778876/pexels-photo-3778876.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/789822/pexels-photo-789822.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/2897883/pexels-photo-2897883.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                                buildConnectionsCard(
                                    'https://images.pexels.com/photos/826349/pexels-photo-826349.jpeg?auto=compress&cs=tinysrgb&dpr=1&w=500'),
                              ],
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 12.0),
                            child: Text(
                              'You and Noberto have 25 shared connections.',
                              style: TextStyle(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                  color: Color(0xff7C8990)),
                            ),
                          ),
                          const Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 12, vertical: 5),
                            child: Text(
                              'View mutual connections',
                              style: TextStyle(
                                fontSize: 14,
                                fontWeight: FontWeight.w400,
                                color: Color(0xff32A3FD),
                              ),
                            ),
                          ),
                          Divider(height: 1, color: Colors.grey.shade400),
                          Padding(
                            padding: const EdgeInsets.all(12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 35,
                                  width: _width * .25,
                                  child: OutlinedButton.icon(
                                    style: ButtonStyle(
                                      backgroundColor:
                                          MaterialStateProperty.all(
                                        const Color(0xFFCCE8FE),
                                      ),
                                    ),
                                    onPressed: () {},
                                    label: const Text(
                                      'Grow your network',
                                      style: TextStyle(
                                        color: Color(0xFF32A3FD),
                                      ),
                                    ),
                                    icon: const Icon(
                                      Icons.thumb_up_alt_outlined,
                                      color: Color(0xFF32A3FD),
                                    ),
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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
