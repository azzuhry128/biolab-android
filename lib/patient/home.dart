import 'package:biolab_android/models/articles_model.dart';
import 'package:biolab_android/models/navbar_button_model.dart';
import 'package:biolab_android/patient/order.dart';
import 'package:biolab_android/patient/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter_svg/svg.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  List<ArticlesModel> articles = [];
  List<NavbarButtonModel> navbarButtons = [];

  void _getArticles() {
    articles = ArticlesModel.getArticles();
  }

  void _getNavbarButtons() {
    navbarButtons = NavbarButtonModel.getNavbarButtons();
  }

  @override
  Widget build(BuildContext context) {
    _getArticles();
    _getNavbarButtons();

    return Scaffold(
      appBar: appBar(),
      body: Stack(
        children: [
          Column(children: [
            promotion(),
            services(),
            articlesContainer(),
          ]),
          Positioned(bottom: 0, left: 0, right: 0, child: navigationBar())
        ],
      ),
    );
  }

  Container services() {
    return Container(
      margin: const EdgeInsets.all(12),
      width: double.infinity,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10)),
      child: Column(
        children: [
          const Align(
            alignment: Alignment.centerLeft,
            child: Text(
              'Services',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(children: [
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFFD8DEE9),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/bxs-capsule.svg',
                height: 48,
                width: 48,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFFD8DEE9),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/bxs-injection.svg',
                height: 48,
                width: 48,
              ),
            ),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration: BoxDecoration(
                  color: const Color(0xFFD8DEE9),
                  borderRadius: BorderRadius.circular(10)),
              child: SvgPicture.asset(
                'assets/icons/bx-health.svg',
                height: 48,
                width: 48,
              ),
            )
          ])
        ],
      ),
    );
  }

  Column articlesContainer() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.only(left: 20),
          child: Text(
            'articles',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        Container(
          height: 200,
          child: ListView.separated(
            itemCount: articles.length,
            scrollDirection: Axis.horizontal,
            separatorBuilder: (context, index) => const SizedBox(
              width: 12,
            ),
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: 120,
                decoration: BoxDecoration(
                    color: const Color(0xFFD8DEE9),
                    borderRadius: BorderRadius.circular(8)),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      width: 48,
                      height: 48,
                      decoration: const BoxDecoration(
                          color: Colors.amber, shape: BoxShape.circle),
                      child: SvgPicture.asset(articles[index].iconPath),
                    )
                  ],
                ),
              );
            },
          ),
        )
      ],
    );
  }

  Container promotion() {
    return Container(
      margin: const EdgeInsets.all(12),
      height: 200,
      width: double.infinity,
      decoration: BoxDecoration(
          color: const Color(0xFFD8DEE9),
          borderRadius: BorderRadius.circular(10)),
    );
  }

  Container navigationBar() {
    return Container(
      color: Colors.amber,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
              width: 48,
              height: 48,
              color: Colors.red,
              alignment: Alignment.center,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Home()));
                  },
                  child: SvgPicture.asset('assets/icons/bxs-home-alt-2.svg'),
                ),
              )),
          Container(
              width: 48,
              height: 48,
              color: Colors.red,
              alignment: Alignment.center,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => const Order()));
                  },
                  child: SvgPicture.asset('assets/icons/bxs-book-content.svg'),
                ),
              )),
          Container(
              width: 48,
              height: 48,
              color: Colors.red,
              alignment: Alignment.center,
              child: Center(
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const Setting()));
                  },
                  child: SvgPicture.asset('assets/icons/bxs-cog.svg'),
                ),
              ))
        ],
      ),
    );
  }

  AppBar appBar() {
    return AppBar(
      title: const Text(
        'welcome back @username',
        style: TextStyle(
            color: Color(0xFFD8DEE9),
            fontSize: 18,
            fontWeight: FontWeight.bold),
      ),
      backgroundColor: Colors.white,
      elevation: 0.0,
      centerTitle: true,
    );
  }
}
