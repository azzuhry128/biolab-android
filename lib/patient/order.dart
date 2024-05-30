import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class Order extends StatefulWidget {
  final String username;
  final String telephone;
  final String title;
  final String payment;
  final String location;

  Order(
      {super.key,
      required this.username,
      required this.telephone,
      required this.title,
      required this.payment,
      required this.location});

  @override
  State<Order> createState() => _OrderState();
}

class _OrderState extends State<Order> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('order detail'),
      ),
      body: Stack(children: [
        Column(
          children: [
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 8, bottom: 4),
                child: const Text(
                  'informasi pasien',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      fontSize: 16),
                )),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
              padding: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
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
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'pasien',
                    style: TextStyle(
                        color: Color(0xffD8DEE9), fontWeight: FontWeight.bold),
                  ),
                  Text(widget.username),
                  const SizedBox(
                    height: 12,
                  ),
                  const Text('nomor telpon',
                      style: TextStyle(
                          color: Color(0xffD8DEE9),
                          fontWeight: FontWeight.bold)),
                  Text(widget.telephone)
                ],
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 8, bottom: 4),
                child: const Text(
                  'lokasi pasien',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      fontSize: 16),
                )),
            Container(
              width: double.infinity,
              margin: const EdgeInsets.only(right: 8, left: 8, bottom: 8),
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
              child: Container(
                constraints: const BoxConstraints(minHeight: 28),
                child: Text(widget.location),
              ),
            ),
            Container(
                alignment: Alignment.centerLeft,
                margin: const EdgeInsets.only(left: 8, bottom: 4),
                child: const Text(
                  'detail kunjungan',
                  style: TextStyle(
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Montserrat',
                      fontSize: 16),
                )),
            Container(
              margin: const EdgeInsets.all(8.0),
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
              child: Row(
                children: [
                  Container(
                      child: Container(
                    padding: const EdgeInsets.all(4.0),
                    child: Image.asset(
                      'assets/images/patient.png',
                      height: 64,
                      width: 64,
                    ),
                  )),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.all(4.0),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'jenis layanan',
                            style: TextStyle(
                                color: Color(0xffD8DEE9),
                                fontWeight: FontWeight.w500),
                          ),
                          Text('post accident care',
                              style: TextStyle(fontWeight: FontWeight.w600)),
                          Text(
                            'biaya',
                            style: TextStyle(
                                color: Color(0xffD8DEE9),
                                fontWeight: FontWeight.w500),
                          ),
                          Text(
                            '100000',
                            style: TextStyle(fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Positioned(
          bottom: 0,
          left: 0,
          right: 0,
          child: Container(
            margin: const EdgeInsets.all(8.0),
            child: TextButton(
              style: TextButton.styleFrom(
                backgroundColor: Colors.amber,
                minimumSize: const Size(double.infinity,
                    48), // Set the minimum size to fill the width
                shape: RoundedRectangleBorder(
                  borderRadius:
                      BorderRadius.circular(8.0), // Set the border radius
                ),
              ),
              onPressed: () {},
              child: const Text(
                'confirm',
                style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  fontFamily: 'Montserrat',
                ),
              ),
            ),
          ),
        )
      ]),
    );
  }
}
