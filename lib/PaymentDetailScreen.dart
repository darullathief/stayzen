import 'package:flutter/material.dart';

import 'PaymentInfo.dart';

class PaymentDetailScreen extends StatelessWidget {
  const PaymentDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stayzen',
      home: const PaymentDetailScreenPage(),
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
    );
  }
}

class PaymentDetailScreenPage extends StatefulWidget {
  const PaymentDetailScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<PaymentDetailScreenPage> createState() =>
      _PaymentDetailScreenScreenPageState();
}

class _PaymentDetailScreenScreenPageState
    extends State<PaymentDetailScreenPage> {
  int selectedMethod = 0;
  String? _selectedTitle;

  List<Map<String, dynamic>> paymentMethods = [
    {
      'id': 1,
      'logo': 'https://darullathief.000webhostapp.com/img/ovo.png',
      'text': 'OVO',
    },
    {
      'id': 2,
      'logo': 'https://darullathief.000webhostapp.com/img/dana.png',
      'text': 'Dana',
    },
    {
      'id': 3,
      'logo': 'https://darullathief.000webhostapp.com/img/bca.png',
      'text': 'BCA',
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Detail Pembayaran"),
      ),
      body: SingleChildScrollView(
        child: Container(
          color: Color(0xffeff9ff),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                color: Colors.white,
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Data Tamu",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.symmetric(horizontal: 0, vertical: 12),
                      padding: EdgeInsets.all(8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Title',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF838383)),
                          ),
                          SizedBox(height: 8),
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 0, horizontal: 12),
                            decoration: BoxDecoration(
                              border: Border.all(color: Colors.grey),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: DropdownButtonHideUnderline(
                              child: DropdownButton<String>(
                                value: _selectedTitle,
                                hint: Text('Pilih Gelar'),
                                isExpanded: true,
                                onChanged: (String? newValue) {
                                  setState(() {
                                    _selectedTitle = newValue;
                                  });
                                },
                                items: [
                                  DropdownMenuItem(
                                    value: 'Tuan',
                                    child: Text('Tuan'),
                                  ),
                                  DropdownMenuItem(
                                    value: 'Nona',
                                    child: Text('Nona'),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 16),
                          Text(
                            'Nama',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF838383)),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              hintText: 'Nama',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                          SizedBox(height: 20),
                          Text(
                            'NIK/No. Paspor',
                            style: TextStyle(
                                fontSize: 16, color: Color(0xFF838383)),
                          ),
                          SizedBox(height: 8),
                          TextField(
                            controller: TextEditingController(),
                            decoration: InputDecoration(
                              contentPadding: EdgeInsets.symmetric(
                                  vertical: 4, horizontal: 12),
                              hintText: 'NIK/No. Paspor',
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(5.0),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 8),
                height: 60,
                child: Row(
                  children: [
                    Row(
                      children: [
                        Icon(Icons.confirmation_num),
                        SizedBox(
                          width: 4,
                        ),
                        Text("Voucher")
                      ],
                    ),
                    SizedBox(
                      width: 120,
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.centerRight,
                        child: TextField(
                          decoration: InputDecoration(
                              contentPadding:
                                  EdgeInsets.only(bottom: 0, top: 0),
                              hintText: "Kode Voucher.."),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 12),
              Container(
                height: 250,
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Metode Pembayaran",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    Column(
                        children: List.generate(paymentMethods.length, (index) {
                      return GestureDetector(
                        onTap: () {
                          setState(() {
                            selectedMethod = index;
                          });
                        },
                        child: Container(
                          height: 65,
                          padding: EdgeInsets.all(16.0),
                          decoration: BoxDecoration(
                            border: Border(
                              bottom: BorderSide(
                                color: Colors.grey.shade300,
                                width: 1.0,
                              ),
                            ),
                          ),
                          child: Row(
                            children: [
                              Image.network(
                                paymentMethods[index]['logo'],
                                width: 40.0,
                                height: 40.0,
                              ),
                              SizedBox(width: 16.0),
                              Expanded(
                                child: Text(
                                  paymentMethods[index]['text'],
                                  style: TextStyle(
                                    fontSize: 14,
                                  ),
                                ),
                              ),
                              Radio(
                                value: index,
                                groupValue: selectedMethod,
                                onChanged: (value) {
                                  setState(() {
                                    selectedMethod = value as int;
                                  });
                                },
                              ),
                            ],
                          ),
                        ),
                      );
                    }))
                  ],
                ),
              ),
              SizedBox(
                height: 12,
              ),
              Container(
                color: Colors.white,
                padding: EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Ringakasan Pembayaran",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 16,
                      ),
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("TipeKamar x 1"), Text("Rp. 500.000")],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Biaya Layanan"), Text("Rp. 0")],
                    ),
                    SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [Text("Total"), Text("Rp. 500.000")],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              )
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomAppBar(
        child: Container(
          height: 70,
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 12),
          decoration: BoxDecoration(
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.grey.withOpacity(0.4),
                spreadRadius: 0.1,
                blurRadius: 20,
                offset:
                    Offset(0, 5), // Offset dengan nilai negatif pada sumbu Y
              ),
            ],
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Total Tagihan",
                      style: TextStyle(fontSize: 14, color: Color(0xFF838383)),
                    ),
                    SizedBox(
                      height: 4,
                    ),
                    Text(
                      "Rp.500.000",
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
              ),
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => PaymentPage(),
                      ),
                    );
                  },
                  child: Text("Lanjutkan"),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
