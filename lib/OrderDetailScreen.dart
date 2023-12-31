import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'PaymentDetailScreen.dart';

class OrderDetailScreen extends StatelessWidget {
  const OrderDetailScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stayzen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const OrderDetailScreenPage(),
    );
  }
}

class OrderDetailScreenPage extends StatefulWidget {
  const OrderDetailScreenPage({
    Key? key,
  }) : super(key: key);

  @override
  State<OrderDetailScreenPage> createState() => _OrderDetailScreenPageState();
}

class _OrderDetailScreenPageState extends State<OrderDetailScreenPage> {
  TextEditingController hotelController = TextEditingController();
  TextEditingController checkInController = TextEditingController();
  TextEditingController checkOutController = TextEditingController();
  DateTime? selectedDate;
  int jumlahKamar = 0;

  Future<void> _selectDate(BuildContext context) async {
    final DateTime? picked = await showDatePicker(
      context: context,
      initialDate: DateTime.now(),
      firstDate: DateTime(2010),
      lastDate: DateTime(2030),
    );

    if (picked != null && picked != selectedDate) {
      setState(() {
        selectedDate = picked;
      });
    }
  }

  @override
  void dispose() {
    hotelController.dispose();
    checkInController.dispose();
    checkOutController.dispose();
    super.dispose();
  }

  void _decrementKamar() {
    if (jumlahKamar > 0) {
      setState(() {
        jumlahKamar--;
      });
    }
  }

  void _incrementKamar() {
    setState(() {
      jumlahKamar++;
    });
  }

  void _handleSubmitButton() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => PaymentDetailScreen()),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00A6DA),
        title: Text("Detail Pemesanan"),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Nama Hotel',
              style: TextStyle(fontSize: 16, color: Color(0xFF838383)),
            ),
            SizedBox(height: 8),
            TextField(
              controller: hotelController,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                hintText: 'Nama Hotel',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
              ),
            ),
            SizedBox(height: 20),
            Text(
              'Tangal Check-in',
              style: TextStyle(fontSize: 16, color: Color(0xFF838383)),
            ),
            SizedBox(height: 8),
            TextField(
              controller: checkInController,
              readOnly: true,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                hintText: 'Check-In',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onTap: () async {
                _selectDate(context);
              },
            ),
            SizedBox(height: 20),
            Text(
              'Tgl Checkout',
              style: TextStyle(fontSize: 16, color: Color(0xFF838383)),
            ),
            SizedBox(height: 8),
            TextField(
              readOnly: true,
              decoration: InputDecoration(
                contentPadding:
                    EdgeInsets.symmetric(vertical: 4, horizontal: 12),
                hintText: 'Checkout',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(5.0),
                  borderSide: BorderSide(color: Colors.black),
                ),
              ),
              onTap: () async {
                _selectDate(context);
              },
            ),
            SizedBox(height: 20),
            Text("Jumlah Kamar",
                style: TextStyle(fontSize: 16, color: Color(0xFF838383))),
            SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    child: Row(
                  children: [
                    Icon(Icons.bed),
                    Text("Kamar",
                        style:
                            TextStyle(fontSize: 16, color: Color(0xFF838383)))
                  ],
                )),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    ElevatedButton(
                      onPressed: () {
                        _decrementKamar();
                      },
                      child: Icon(
                        Icons.remove,
                        size: 14,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                    Text(
                      jumlahKamar.toString(),
                      style: TextStyle(fontSize: 16),
                    ),
                    ElevatedButton(
                      onPressed: () {
                        _incrementKamar();
                      },
                      child: Icon(
                        Icons.add,
                        size: 14,
                      ),
                      style: ElevatedButton.styleFrom(
                        shape: CircleBorder(),
                        padding: EdgeInsets.all(0),
                      ),
                    ),
                  ],
                )
              ],
            ),
            SizedBox(height: 20),
            SizedBox(height: 20),
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: _handleSubmitButton,
                    child: Text("Submit"),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
