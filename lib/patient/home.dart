import 'dart:convert';

import 'package:biolab_android/models/articles_model.dart';
import 'package:biolab_android/models/navbar_button_model.dart';
import 'package:biolab_android/patient/ServiceDetail.dart';
import 'package:biolab_android/patient/order.dart';
import 'package:biolab_android/patient/settings.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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

  Future<List<Map<String, dynamic>>> readjson() async {
    final String response =
        await rootBundle.loadString('assets/json/services.json');
    final data = json.decode(response);
    return data['services'];
  }

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
              'layanan kesehatan',
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          Row(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Center(
                  child: InkWell(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ServiceDetail(
                                title: 'medical checkup',
                                price: '100000',
                                description:
                                    'medical checkup lengkap dengan kualitas pelayanan dan SOP yang baik')));
                      },
                      child: Image.asset(
                        'assets/images/medical-checkup.png',
                        height: 48,
                        width: 48,
                      )),
                )),
            Container(
              margin: const EdgeInsets.all(10),
              padding: const EdgeInsets.all(4),
              alignment: Alignment.center,
              decoration:
                  BoxDecoration(borderRadius: BorderRadius.circular(10)),
              child: Center(
                  child: InkWell(
                onTap: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => ServiceDetail(
                          title: 'blood sampling',
                          price: '150000',
                          description: 'pengujian sampel darah ')));
                },
                child: Image.asset(
                  'assets/images/blood-test.png',
                  height: 48,
                  width: 48,
                ),
              )),
            ),
            Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(4),
                alignment: Alignment.center,
                decoration:
                    BoxDecoration(borderRadius: BorderRadius.circular(10)),
                child: Center(
                    child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => ServiceDetail(
                            title: 'post accident care',
                            price: '200000',
                            description: 'perawatan medis pasca kecelakaan')));
                  },
                  child: Image.asset(
                    'assets/images/patient.png',
                    height: 48,
                    width: 48,
                  ),
                ))),
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
            'toko obat',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
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
                      decoration: const BoxDecoration(shape: BoxShape.circle),
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
          // Container(
          //     width: 48,
          //     height: 48,
          //     alignment: Alignment.center,
          //     child: Center(
          //       child: InkWell(
          //         onTap: () {
          //           Navigator.of(context)
          //               .push(MaterialPageRoute(builder: (context) => Order()));
          //         },
          //         child: SvgPicture.asset('assets/icons/bxs-book-content.svg'),
          //       ),
          //     )),
          Container(
              width: 48,
              height: 48,
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
