import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'dart:async';

class PaymentPage extends StatefulWidget {
  const PaymentPage({Key? key}) : super(key: key);

  @override
  _PaymentPageState createState() => _PaymentPageState();
}

class _PaymentPageState extends State<PaymentPage> {
  bool showToast = false;

  void showSuccessToast() {
    setState(() {
      showToast = true;
    });

    Timer(Duration(seconds: 2), () {
      setState(() {
        showToast = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00A6DA),
        title: Text('Payment Page'),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: <Widget>[
          if (showToast)
            Container(
              padding: EdgeInsets.only(left: 16, top: 16, right: 16, bottom: 16),
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  Icon(
                    Icons.check,
                    color: Colors.blue,
                  ),
                  SizedBox(width: 8),
                  Text(
                    'Pembayaran Berhasil',
                    style: TextStyle(color: Colors.blue),
                  ),
                ],
              ),
            ),
          Expanded(
            child: SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Container(
                    padding: EdgeInsets.fromLTRB(16, 30, 16, 16),
                    margin: EdgeInsets.all(3),
                    color: Colors.grey[300],
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'Batas akhir pembayaran',
                              style: TextStyle(fontSize: 12),
                            ),
                            Expanded(
                              child: Text(
                                '12:18:05',
                                textAlign: TextAlign.right,
                                style: TextStyle(fontSize: 20, color: Colors.red),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Minggu, 12 Jun 2022 00:00 WIB',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.symmetric(horizontal: 16),
                    margin: EdgeInsets.all(3),
                    color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              'BNI',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Image.network(
                              'https://1.bp.blogspot.com/-r636Aob_z_A/XicFI0zvA-I/AAAAAAAABe8/dIi1moSFZpMO7TFwhXAIEeaIpQhMCK9yACLcBGAsYHQ/s400/Logo%2Bbank%2BBNI.png',
                              width: 50,
                              height: 50,
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Divider(
                          color: Colors.black,
                          height: 1,
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Nomor Pembayaran',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 8),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Text(
                              '1111333344445555',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: <Widget>[
                                Icon(Icons.content_copy),
                                Text('Salin'),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Total Pembayaran',
                          style: TextStyle(fontSize: 12),
                        ),
                        SizedBox(height: 8),
                        Text(
                          'Rp 410.000',
                          style: TextStyle(fontSize: 16),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 20),
                  Container(
                    padding: EdgeInsets.all(16),
                    color: Colors.grey.shade200,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          'Cara Pembayaran',
                          style: TextStyle(
                            fontSize: 16,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(height: 8),
                        Text(
                          '1. Akses BNI Mobile Banking dari smartphone.',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '2. Pilih menu "Transfer".',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '3. Pilih menu "Virtual Account Billing" kemudian pilih rekening debet.',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '4. Masukkan nomor Virtual Account Anda (contoh: 8241002201150001) pada menu "input baru".',
                          style: TextStyle(fontSize: 14),
                        ),
                        Text(
                          '5. Konfirmasi transaksi dan masukkan Password Transaksi.',
                          style: TextStyle(fontSize: 14),
                        ),
                        SizedBox(height: 16),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              showSuccessToast();
                            },
                            style: ElevatedButton.styleFrom(
                              padding: EdgeInsets.symmetric(vertical: 20),
                            ),
                            child: Text('Sudah Bayar'),
                          ),
                        ),
                      ],
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
