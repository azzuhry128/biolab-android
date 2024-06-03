import 'package:biolab_android/models/articles_model.dart';
import 'package:biolab_android/models/navbar_button_model.dart';
import 'package:biolab_android/patient/OngoingOrder.dart';
import 'package:biolab_android/patient/Profile.dart';
import 'package:biolab_android/patient/ServiceDetail.dart';
import 'package:biolab_android/patient/Settings.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
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
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                  color: Colors.grey.withOpacity(0.2),
                  spreadRadius: 5,
                  blurRadius: 5,
                  offset: const Offset(0, 2))
            ],
          ),
          child: AppBar(
            elevation: 0.0,
            title: const Text('welcome azzuhry'),
            centerTitle: true,
          ),
        ),
      ),
      body: Column(children: [
        Expanded(
            child: Column(
          children: [
            promotion(),
            services(),
            articlesContainer(),
          ],
        )),
        navigationBar(context),
      ]),
    );
  }

  Container navigationBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 48,
      decoration: const BoxDecoration(color: Colors.white),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Profile()));
              },
              icon: const Icon(Icons.person)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => const OngoingOrder()));
              },
              icon: const Icon(Icons.shop)),
          IconButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Settings()));
              },
              icon: const Icon(Icons.settings))
        ],
      ),
    );
  }

  Container promotion() {
    return Container(
      width: double.infinity,
      height: 180,
      margin: const EdgeInsets.all(12),
      padding: const EdgeInsets.all(2),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(8.0),
        boxShadow: [
          BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              spreadRadius: 2,
              blurRadius: 3,
              offset: const Offset(0, 2))
        ],
      ),
      child: SvgPicture.asset('assets/images/undraw_welcome_cats_thqn.svg'),
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
              'paling populer',
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
            'Layanan kesehatan',
            style: TextStyle(
                color: Colors.black, fontSize: 18, fontWeight: FontWeight.w600),
          ),
        ),
        const SizedBox(
          height: 12,
        ),
        SizedBox(
          height: 200,
          child: ListView.builder(
            itemCount: articles.length,
            scrollDirection: Axis.horizontal,
            padding: const EdgeInsets.only(left: 20, right: 20),
            itemBuilder: (context, index) {
              return Container(
                height: 200,
                width: 120,
                margin: const EdgeInsets.all(8.0),
                padding: const EdgeInsets.all(8),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(8.0),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.2),
                        spreadRadius: 2,
                        blurRadius: 3,
                        offset: const Offset(2, 2))
                  ],
                ),
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
}
