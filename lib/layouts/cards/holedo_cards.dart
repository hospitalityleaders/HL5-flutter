import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/models/holedoapi/article.dart';
import 'package:holedo/models/holedoapi/article_category.dart';
import 'package:routemaster/routemaster.dart';
import 'package:intl/intl.dart';
import 'package:holedo/models/holedoapi/user.dart';
import 'package:holedo/models/models.dart';

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
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 350,
        child: Material(
          color: Color.fromARGB(255, 216, 72, 16),
          borderRadius: BorderRadius.circular(8),
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
      padding: const EdgeInsets.all(8.0),
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

class BookCard extends StatelessWidget {
  final Book book;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const BookCard({
    Key? key,
    required this.book,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Routemaster.of(context).push(
            pathBuilder != null ? pathBuilder!(book.id) : '/book/${book.id}');
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
            child: Icon(
              CupertinoIcons.book,
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
                  book.title,
                  style: TextStyle(fontSize: 16),
                ),
                if (showReleaseDate) Text(_formatter.format(book.releaseDate)),
              ],
            ),
          ),
        ],
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

class NewsCard extends StatelessWidget {
  final Article article;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const NewsCard({
    Key? key,
    required this.article,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return CustomCard(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(article.slug as String)
            : '/article/${article.articleCategories?.first.slug}/${article.slug}');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(article.bannerImage.toString()),
                fit: BoxFit.cover,
                repeat: ImageRepeat.noRepeat,
              ),
              color: Colors.white,
              borderRadius: BorderRadius.circular(0),
            ),
            height: 100,
            width: 75,
            child: article.bannerImage != null
                ? null
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
                  article.title as String,
                  style: TextStyle(
                    fontSize: 16,
                  ),
                ),
                Text('------------------'),
                for (final cat in article.articleCategories!)
                  Text(
                    cat.title as String,
                    style: TextStyle(fontSize: 12),
                  ),
                if (showReleaseDate)
                  Text(_formatter.format(article.created as DateTime)),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class NewsCategoryCard extends StatelessWidget {
  final ArticleCategory category;
  final bool showReleaseDate;
  final String Function(String id)? pathBuilder;

  const NewsCategoryCard({
    Key? key,
    required this.category,
    this.showReleaseDate = false,
    this.pathBuilder,
  }) : super(key: key);

  static final _formatter = DateFormat('yyyy-MM-dd');

  @override
  Widget build(BuildContext context) {
    return SmallCard(
      onTap: () {
        Routemaster.of(context).push(pathBuilder != null
            ? pathBuilder!(category.slug as String)
            : '/news/all/${category.slug}/');
      },
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            decoration: BoxDecoration(
              color: Color.fromARGB(255, 0, 0, 0),
              borderRadius: BorderRadius.circular(3),
            ),
            height: 30,
            width: 25,
            child: Icon(
              CupertinoIcons.news,
              size: 15,
              color: Colors.grey,
            ),
          ),
          SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  category.title as String,
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
