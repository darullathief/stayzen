import 'package:flutter/material.dart';
import 'package:stayzen/Home.dart';
import 'OrderDetailScreen.dart';
import 'package:progress_dialog_null_safe/progress_dialog_null_safe.dart';

import 'hotel_controller/HotelDetailController.dart';
import 'model/HotelDetail.dart';

class HotelDetailScreen extends StatelessWidget {
  const HotelDetailScreen({Key? key, required this.argument}) : super(key: key);

  final String argument;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stayzen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HotelDetailScreenPage(
        title: 'Flutter Demo Home Page',
        argument: argument,
      ),
    );
  }
}

class HotelDetailScreenPage extends StatefulWidget {
  const HotelDetailScreenPage({
    Key? key,
    required this.title,
    required this.argument,
  }) : super(key: key);

  final String title;
  final String argument;

  @override
  State<HotelDetailScreenPage> createState() => _HotelDetailScreenPageState();
}

class _HotelDetailScreenPageState extends State<HotelDetailScreenPage> {
  List<HotelModel> hotel = [];
  List<RoomTypeModel> roomTypes = [];
  ProgressDialog? progressDialog;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    progressDialog = ProgressDialog(context);
    fetchData();
    HotelDetailController(id: widget.argument).fetchHotels().then((hotelList) {
      setState(() {
        hotel = hotelList;
        roomTypes = hotelList[0].tipeKamar as List<RoomTypeModel>;
      });
    });
  }

  void fetchData() async {
    progressDialog?.show();

    // Simulasi pengambilan data dari API
    await Future.delayed(Duration(seconds: 3));

    progressDialog?.hide();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(" "),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => HomeScreen()),
            );
          },
        ),
      ),
      body: isLoading
          ? Center(child: CircularProgressIndicator())
          : SingleChildScrollView(
              child: Container(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 20,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: Image.network(
                            hotel[0].fotoHotel,
                            height: 230,
                            width: 350,
                            fit: BoxFit.cover,
                          ),
                        ),
                      ],
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 24, vertical: 10),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            hotel[0].nmHotel,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          Text(hotel[0].alamatHotel),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Kamar Tersedia",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 100,
                            child: ListView.builder(
                              itemCount: hotel[0].tipeKamar.length,
                              itemBuilder: (context, index) {
                                final value = hotel[0].tipeKamar.values.toList()[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                          0,
                                          3,
                                        ), // mengatur bayangan di bawah kontainer
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          ClipRRect(
                                            borderRadius: BorderRadius.circular(15),
                                            child: Image.network(
                                              value.fotoKamar,
                                              height: 70,
                                              width: 70,
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                          SizedBox(
                                            width: 8,
                                          ),
                                          Column(
                                            crossAxisAlignment: CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                value.nmTipe,
                                                style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(value.deskripsiFasilitas),
                                            ],
                                          ),
                                        ],
                                      ),
                                      ElevatedButton(
                                        onPressed: () {
                                          Navigator.push(
                                            context,
                                            MaterialPageRoute(builder: (context) => OrderDetailScreen()),
                                          );
                                        },
                                        child: Text("Pesan"),
                                      ),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding:
                          EdgeInsets.symmetric(horizontal: 20, vertical: 16),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "Ulasan",
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 20,
                            ),
                          ),
                          SizedBox(
                            height: 12,
                          ),
                          Container(
                            height: 150,
                            child: ListView.builder(
                              itemCount: hotel[0].ulasan.length,
                              itemBuilder: (context, index) {
                                final value = hotel[0].ulasan.values.toList()[index];
                                return Container(
                                  padding: EdgeInsets.symmetric(horizontal: 12, vertical: 12),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
                                    boxShadow: [
                                      BoxShadow(
                                        color: Colors.grey.withOpacity(0.5),
                                        spreadRadius: 2,
                                        blurRadius: 5,
                                        offset: Offset(
                                          0,
                                          3,
                                        ), // mengatur bayangan di bawah kontainer
                                      ),
                                    ],
                                    color: Colors.white,
                                  ),
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        value.idPengguna,
                                        style: TextStyle(
                                          fontWeight: FontWeight.w700,
                                        ),
                                      ),
                                      Text(value.tglUlasan),
                                      Text(value.isiUlasan),
                                    ],
                                  ),
                                );
                              },
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
    );
  }
}
