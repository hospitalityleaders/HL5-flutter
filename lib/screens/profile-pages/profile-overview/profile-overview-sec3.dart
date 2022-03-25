import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

import '../profile-edit/profile-edit.dart';

class ProfileOverviewSec3 extends StatefulWidget {
  const ProfileOverviewSec3({Key? key}) : super(key: key);

  @override
  State<ProfileOverviewSec3> createState() => _ProfileOverviewSec3State();
}

class _ProfileOverviewSec3State extends State<ProfileOverviewSec3> {
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

  @override
  Widget build(BuildContext context) {
    var _height = MediaQuery.of(context).size.height;
    var _width = MediaQuery.of(context).size.width;
    return Padding(
      padding: EdgeInsets.all(12.0),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 8),
              color: const Color(0xff2b375e),
              child: Column(
                children: [
                  Text(
                    '${(value * 100).toInt()}%',
                    style: const TextStyle(fontSize: 48, color: Colors.white),
                  ),
                  const SizedBox(height: 10),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: LinearProgressIndicator(
                        value: value,
                        valueColor: const AlwaysStoppedAnimation(Colors.red),
                        backgroundColor: const Color(0xFF212b4d),
                        minHeight: 10,
                      ),
                    ),
                  ),
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
                  profileListTile(Icons.add_box_outlined, 'Add your languages'),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () {
                      ProfileEdit.isEditable
                          ? setState(() {
                              ProfileEdit.isEditable = false;
                            })
                          : setState(() {
                              ProfileEdit.isEditable = true;
                            });
                    },
                    child: Padding(
                      padding: EdgeInsets.symmetric(
                          vertical: _height * .014, horizontal: _width * .085),
                      child: AutoSizeText(
                        'Edit my profile',
                        maxLines: 1,
                        minFontSize: 10,
                        style: TextStyle(
                            fontSize: 14,
                            color: Colors.white,
                            fontWeight: FontWeight.w400),
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      primary: const Color(0xFF32A3FD),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
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
                    padding: EdgeInsets.symmetric(horizontal: 12, vertical: 5),
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
                    child: OutlinedButton(
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(
                          const Color(0xFFCCE8FE),
                        ),
                      ),
                      onPressed: () {},
                      child: Padding(
                        padding: EdgeInsets.symmetric(
                          vertical: _height * 0.010,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(
                              Icons.thumb_up_alt_outlined,
                              color: Color(0xFF32A3FD),
                              size: 12,
                            ),
                            SizedBox(
                              width: _width * .01,
                            ),
                            AutoSizeText(
                              'Grow your network',
                              style: TextStyle(
                                  color: Color(0xFF32A3FD),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
