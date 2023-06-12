import 'package:flutter/material.dart';

import 'hotel_controller/hotel_controller.dart';

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
  HotelController controller = HotelController();

  @override
  void initState() {
    super.initState();
    loadHotels();
  }

  Future<void> loadHotels() async {
    await controller.fetchHotels();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
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
                    backgroundImage: NetworkImage('https://pixlok.com/wp-content/uploads/2022/02/Profile-Icon-SVG-09856789.png'),
                    radius: 24,
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 40),
              padding: EdgeInsets.only(left: 24, right: 100),
              child: Text("Where would you like to go?",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 30,
                    fontWeight: FontWeight.bold
                ),
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
              child: Text("Recomendation",
                textAlign: TextAlign.left,
                style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold
                ),
              ),
            ),


            ]
        )
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}