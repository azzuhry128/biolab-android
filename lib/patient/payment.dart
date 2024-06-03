import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class payment extends StatelessWidget {
  const payment({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('payment methods'),
      ),
      body: Column(
        children: [
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
                  padding: const EdgeInsets.all(4.0),
                  child: SvgPicture.asset(
                    'assets/icons/icons8-mastercard.svg',
                    height: 64,
                    width: 64,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'mastercard',
                          style: TextStyle(
                              color: Color(0xffD8DEE9),
                              fontWeight: FontWeight.w500),
                        ),
                        Text('5299 6400 0000 0000',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child:
                      TextButton(onPressed: () {}, child: const Text('Pilih')),
                )
              ],
            ),
          ),

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
                  padding: const EdgeInsets.all(4.0),
                  child: Image.asset(
                    'assets/images/wallet-removebg-preview.png',
                    height: 64,
                    width: 64,
                  ),
                ),
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(4.0),
                    child: const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'gopay e-wallet',
                          style: TextStyle(
                              color: Color(0xffD8DEE9),
                              fontWeight: FontWeight.w500),
                        ),
                        Text('082249034331',
                            style: TextStyle(fontWeight: FontWeight.w600)),
                      ],
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(right: 16.0),
                  child:
                      TextButton(onPressed: () {}, child: const Text('Pilih')),
                )
              ],
            ),
          ),

          // Container(
          //   margin: const EdgeInsets.all(8.0),
          //   decoration: BoxDecoration(
          //     color: Colors.white,
          //     borderRadius: BorderRadius.circular(8.0),
          //     boxShadow: [
          //       BoxShadow(
          //           color: Colors.grey.withOpacity(0.2),
          //           spreadRadius: 2,
          //           blurRadius: 3,
          //           offset: const Offset(2, 2))
          //     ],
          //   ),
          //   child: Row(
          //     children: [
          //       Container(
          //         padding: const EdgeInsets.all(4.0),
          //         child: SvgPicture.asset(
          //           'assets/icons/icons8-mastercard.svg',
          //           height: 64,
          //           width: 64,
          //         ),
          //       ),
          //       Expanded(
          //         child: Container(
          //           padding: const EdgeInsets.all(4.0),
          //           child: const Column(
          //             crossAxisAlignment: CrossAxisAlignment.start,
          //             children: [
          //               Text(
          //                 'mastercard',
          //                 style: TextStyle(
          //                     color: Color(0xffD8DEE9),
          //                     fontWeight: FontWeight.w500),
          //               ),
          //               Text('5299 6400 0000 0000',
          //                   style: TextStyle(fontWeight: FontWeight.w600)),
          //             ],
          //           ),
          //         ),
          //       ),
          //       Container(
          //         margin: const EdgeInsets.only(right: 16.0),
          //         child:
          //             TextButton(onPressed: () {}, child: const Text('Pilih')),
          //       )
          //     ],
          //   ),
          // ),
        ],
      ),
    );
  }
}
