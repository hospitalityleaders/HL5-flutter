import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/company.dart';
import 'package:holedo/models/holedoapi/job.dart';

import 'package:routemaster/routemaster.dart';
import 'package:intl/intl.dart';
import 'package:holedo/models/holedoapi/user.dart';
export 'package:holedo/layouts/cards/news_cards.dart';

class CustomCard extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const CustomCard({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(0.0),
      child: SizedBox(
        width: 350,
        child: Material(
          color: Color.fromARGB(255, 255, 255, 255),
          borderRadius: BorderRadius.circular(2),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class SmallCard extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const SmallCard({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 250,
        child: Material(
          color: Color.fromARGB(255, 219, 212, 228),
          borderRadius: BorderRadius.circular(2),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(16),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class LinkCard extends StatelessWidget {
  final Widget child;
  final void Function() onTap;

  const LinkCard({
    Key? key,
    required this.onTap,
    required this.child,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: SizedBox(
        width: 250,
        child: Material(
          color: Colors.transparent, // Color.fromARGB(255, 13, 20, 117),
          clipBehavior: Clip.antiAlias,
          child: InkWell(
            onTap: onTap,
            child: Padding(
              padding: const EdgeInsets.all(4),
              child: child,
            ),
          ),
        ),
      ),
    );
  }
}

class JobsCard extends StatelessWidget {
  final Job data;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const JobsCard({
    Key? key,
    required this.data,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(data.slug as String)
            : '/job/${data.slug}');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(8),
            ),
            height: 100,
            width: 75,
            child: data.logo != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(data.logo.toString()),
                  )
                : Icon(
                    CupertinoIcons.news,
                    size: 55,
                    color: Colors.grey,
                  ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.title as String,
                  style: TextStyle(fontSize: 16),
                ),
                if (showReleaseDate)
                  Text(_formatter.format(data.created as DateTime)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class UserCard extends StatelessWidget {
  final User data;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const UserCard({
    Key? key,
    required this.data,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(data.slug as String)
            : '/profile/${data.slug}');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 100,
            width: 75,
            child: data.avatarCdn != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(data.avatarCdn.toString()),
                  )
                : Icon(
                    CupertinoIcons.news,
                    size: 55,
                    color: Colors.grey,
                  ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  data.fullName as String,
                  style: TextStyle(fontSize: 16),
                ),
                Text('${data.email}'),
                Text(data.dateOfBirth != null
                    ? _formatter.format(data.dateOfBirth as DateTime)
                    : '')
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class FooterLinkCard extends StatelessWidget {
  final String title;
  final String path;
  final String Function(String id)? pathBuilder;

  const FooterLinkCard({
    Key? key,
    required this.title,
    required this.path,
    this.pathBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return LinkCard(
      onTap: () {
        Routemaster.of(context)
            .push(pathBuilder != null ? pathBuilder!('$path') : '$path');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: TextStyle(
                      fontSize: 16, color: Color.fromARGB(255, 255, 255, 255)),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class CompanyCard extends StatelessWidget {
  final Company data;
  final String Function(String id)? pathBuilder;

  const CompanyCard({
    Key? key,
    required this.data,
    this.pathBuilder,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SmallCard(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(data.slug as String)
            : '/jobs/all/${data.slug}/');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(3),
            ),
            height: 100,
            width: 100,
            child: data.computedLogo != null
                ? CircleAvatar(
                    radius: 30,
                    backgroundImage: NetworkImage(data.computedLogo as String),
                  )
                : Icon(
                    CupertinoIcons.building_2_fill,
                    size: 100,
                    color: Colors.grey,
                  ),
          ),
        ],
      ),
    );
  }
}
