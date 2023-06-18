import 'package:flutter/material.dart';

import 'HotelDetailScreen.dart';
import 'hotel_controller/HotelController.dart';
import 'model/Hotels.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Stayzen',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  List<Hotel> hotels = [];

  @override
  void initState() {
    super.initState();
    HotelController().fetchHotels().then((hotelList) {
      setState(() {
        hotels = hotelList;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SingleChildScrollView(
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
              Padding(padding: EdgeInsets.only(top: 48)),
              Container(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                      icon: Icon(Icons.drag_handle),
                      onPressed: () {
                        // Tambahkan logika aksi untuk ikon hamburger di sini
                      },
                    ),
                    CircleAvatar(
                      backgroundImage: NetworkImage(
                          'https://pixlok.com/wp-content/uploads/2022/02/Profile-Icon-SVG-09856789.png'),
                      radius: 24,
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 40),
                padding: EdgeInsets.only(left: 24, right: 100),
                child: Text(
                  "Where would you like to go?",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
                ),
              ),
              Container(
                margin: EdgeInsets.symmetric(vertical: 36),
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: TextField(
                  onChanged: (value) {
                    // Lakukan aksi pencarian berdasarkan nilai yang dimasukkan
                    // Misalnya, panggil fungsi untuk memfilter data berdasarkan nilai pencarian
                  },
                  decoration: InputDecoration(
                    hintText: 'Cari...',
                    prefixIcon: Icon(Icons.search),
                    border: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.blue),
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                    ),
                  ),
                ),
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Text(
                  "Recomendation",
                  textAlign: TextAlign.left,
                  style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                ),
              ),
              Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelDetailScreen(argument: hotels[0].kdHotel),
                            settings: RouteSettings(arguments: {
                              "id": hotels[0].nmHotel,
                            }) // Halaman tujuan
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 12),
                      width: 165,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              hotels[0].fotoHotel,
                              fit: BoxFit.cover,
                              height: 120,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4, left: 8),
                            child: Text(
                              hotels[0].nmHotel,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8, left: 8),
                            child: Text(
                              hotels[0].alamatHotel,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => HotelDetailScreen(argument: hotels[1].kdHotel,),
                            settings: RouteSettings(arguments: {
                              'id': hotels[1].kdHotel
                            }) // Halaman tujuan
                            ),
                      );
                    },
                    child: Container(
                      margin: EdgeInsets.only(left: 20, top: 12),
                      width: 165,
                      height: 200,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.3),
                            spreadRadius: 2,
                            blurRadius: 5,
                            offset: Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.only(
                              topLeft: Radius.circular(10),
                              topRight: Radius.circular(10),
                            ),
                            child: Image.network(
                              hotels[1].fotoHotel,
                              fit: BoxFit.cover,
                              height: 120,
                              width: double.infinity,
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 4, left: 8),
                            child: Text(
                              hotels[1].nmHotel,
                              style: TextStyle(
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                          Container(
                            margin: EdgeInsets.only(top: 8, left: 8),
                            child: Text(
                              hotels[1].alamatHotel,
                              style: TextStyle(
                                fontWeight: FontWeight.w300,
                                fontSize: 12,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              GestureDetector(
                onTap: () {
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) =>
                          HotelDetailScreen(argument: '',), // Halaman tujuan
                    ),
                  );
                },
                child: Container(
                  padding: EdgeInsets.only(left: 20, top: 44),
                  child: Text(
                    "Popular Hotels",
                    textAlign: TextAlign.left,
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
                  ),
                ),
              ),
              SingleChildScrollView(
                padding: EdgeInsets.only(bottom: 30),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: [
                    // Konten lainnya di sini
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HotelDetailScreen(argument: '',), // Halaman tujuan
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 12),
                        width: 165,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                hotels[2].fotoHotel,
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                hotels[2].nmHotel,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, left: 8),
                              child: Text(
                                hotels[2].alamatHotel,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HotelDetailScreen(argument: '',), // Halaman tujuan
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 12),
                        width: 165,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                hotels[3].fotoHotel,
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                hotels[3].nmHotel,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, left: 8),
                              child: Text(
                                hotels[3].alamatHotel,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) =>
                                HotelDetailScreen(argument: '',), // Halaman tujuan
                          ),
                        );
                      },
                      child: Container(
                        margin: EdgeInsets.only(left: 20, top: 12, right: 20),
                        width: 165,
                        height: 200,
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(10),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.3),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: Offset(0, 3),
                            ),
                          ],
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            ClipRRect(
                              borderRadius: BorderRadius.only(
                                topLeft: Radius.circular(10),
                                topRight: Radius.circular(10),
                              ),
                              child: Image.network(
                                hotels[4].fotoHotel,
                                fit: BoxFit.cover,
                                height: 120,
                                width: double.infinity,
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 4, left: 8),
                              child: Text(
                                hotels[4].nmHotel,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                            Container(
                              margin: EdgeInsets.only(top: 8, left: 8),
                              child: Text(
                                hotels[4].alamatHotel,
                                style: TextStyle(
                                  fontWeight: FontWeight.w300,
                                  fontSize: 12,
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              )
            ])),
        bottomNavigationBar: BottomAppBar(
          padding: EdgeInsets.symmetric(vertical: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              IconButton(
                onPressed: () {
                  // Aksi ketika bagian pertama ditekan
                },
                icon: Icon(Icons.home),
              ),
              IconButton(
                onPressed: () {
                  // Aksi ketika bagian kedua ditekan
                },
                icon: Icon(Icons.search),
              ),
              IconButton(
                onPressed: () {
                  // Aksi ketika bagian ketiga ditekan
                },
                icon: Icon(Icons.person),
              ),
            ],
          ),
        ) // This trailing comma makes auto-formatting nicer for build methods.
        );
  }
}
