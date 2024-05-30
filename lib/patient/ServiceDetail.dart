import 'package:biolab_android/patient/Order.dart';
import 'package:flutter/material.dart';

class ServiceDetail extends StatelessWidget {
  final String title;
  final String price;
  final String description;

  const ServiceDetail(
      {super.key,
      required this.title,
      required this.price,
      required this.description});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Service detail'),
      ),
      body: SingleChildScrollView(
        scrollDirection: Axis.vertical,
        child: Column(
          children: [
            Padding(
                padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                child: Image.asset(
                  'assets/images/medical-checkup-banner.jpg',
                  fit: BoxFit.contain,
                )),
            Container(
              decoration: BoxDecoration(
                  color: Colors.amber,
                  borderRadius: BorderRadius.circular(8.0)),
              margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              width: double.infinity,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text('jenis layanan',
                      style: TextStyle(fontWeight: FontWeight.normal)),
                  Text(
                    title,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 12,
                    width: double.infinity,
                  ),
                  const Text(
                    'harga',
                    style: TextStyle(fontWeight: FontWeight.normal),
                  ),
                  Text(
                    price,
                    style: const TextStyle(fontWeight: FontWeight.bold),
                  )
                ],
              ),
            ),
            SizedBox(
              width: double.infinity,
              height: 300,
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                          color: Colors.grey.withOpacity(0.2),
                          spreadRadius: 2,
                          blurRadius: 3,
                          offset: const Offset(2, 2))
                    ],
                    borderRadius: BorderRadius.circular(8.0)),
                margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
                width: double.infinity,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('deskripsi layanan'),
                    Text(description)
                  ],
                ),
              ),
            ),
            TextButton(
                style: TextButton.styleFrom(
                  backgroundColor: Colors.amber,
                ),
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => Order(
                            username: 'azzuhry',
                            telephone: '082249034332',
                            title: title,
                            payment: 'go pay',
                            location: 'Trini, RT 03/07, Gamping, Sleman',
                          )));
                },
                child: const Text(
                  'order now',
                  style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat'),
                )),
          ],
        ),
      ),
    );
  }
}
