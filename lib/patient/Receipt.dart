import 'package:biolab_android/patient/Home.dart';
import 'package:flutter/material.dart';

class Receipt extends StatelessWidget {
  final String receiptId = '529440177127483';
  final String username = 'azzuhry';
  final String doctorUsername = 'RS bina husada depok';
  final String treatmentDetails = 'perawatan pasca kecelakaan';
  final String paymentMethod = 'mastercard';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('E-Receipt'),
        centerTitle: true,
        automaticallyImplyLeading: false,
      ),
      body: Column(
        children: [
          Container(
            width: double.infinity,
            margin: const EdgeInsets.all(12),
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
                SizedBox(height: 8),
                _buildLabel('ID-Receipt:', receiptId),
                _buildLabel('Username:', username),
                _buildLabel('Dokter:', doctorUsername),
                _buildLabel('Details:', treatmentDetails),
                _buildLabel('Metode Pembayaran:', paymentMethod),
              ],
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          TextButton(
              onPressed: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => const Home()));
              },
              child: const Text('back to home'))
        ],
      ),
    );
  }

  Widget _buildLabel(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            label,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          Text(value),
        ],
      ),
    );
  }
}
