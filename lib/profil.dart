import 'package:flutter/material.dart';
import 'login.dart';

class ProfilePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 60, bottom: 20),
                child: const Text(
                  'Akun Saya',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              Column(
                children: [
                  SizedBox(
                    height: 300,
                    width: 300,
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(26),
                      ),
                      child: Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(50),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(125),
                              child: Image.network(
                                'https://img.okezone.com/content/2023/03/14/33/2780644/biodata-dan-agama-natasha-wilona-pernah-hidup-susah-dan-tinggal-di-gubuk-Z8pJ2rziYQ.jpg',
                                fit: BoxFit.cover,
                                height: 250,
                                width: 250,
                              ),
                            ),
                          ),
                          const Positioned(
                            bottom: 12,
                            left: 0,
                            right: 0,
                            child: Center(
                              child: Text(
                                'Natasha Wilona',
                                style: TextStyle(fontSize: 16),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 40),
              SizedBox(
                width: 200,
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: const Color.fromRGBO(
                      0, 166, 218, 100), // Ubah warna Card sesuai kebutuhan
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.settings,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            'Pengaturan',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // Ubah warna teks sesuai kebutuhan
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Tambahkan kode untuk menavigasi ke halaman fitur 1 di sini
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 200,
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: const Color.fromRGBO(
                      0, 166, 218, 100), // Ubah warna Card sesuai kebutuhan
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.airplane_ticket_outlined,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            'Voucher',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // Ubah warna teks sesuai kebutuhan
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Tambahkan kode untuk menavigasi ke halaman fitur 1 di sini
                  ),
                ),
              ),
              const SizedBox(height: 5),
              SizedBox(
                width: 200,
                height: 80,
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(16),
                  ),
                  color: const Color.fromRGBO(
                      0, 166, 218, 100), // Ubah warna Card sesuai kebutuhan
                  child: ListTile(
                    contentPadding:
                        const EdgeInsets.symmetric(vertical: 8, horizontal: 24),
                    leading: Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Padding(
                          padding: EdgeInsets.only(right: 10),
                          child: Icon(
                            Icons.history_rounded,
                            size: 30,
                            color: Colors.white,
                          ),
                        ),
                        SizedBox(width: 10),
                        Padding(
                          padding: EdgeInsets.only(left: 2),
                          child: Text(
                            'Riwayat',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors
                                  .white, // Ubah warna teks sesuai kebutuhan
                            ),
                          ),
                        ),
                      ],
                    ),
                    // Tambahkan kode untuk menavigasi ke halaman fitur 1 di sini
                  ),
                ),
              ),
              const SizedBox(height: 40),
              ElevatedButton(
            onPressed: () {
                Navigator.push(
                 context,
                MaterialPageRoute(builder: (context) => LoginPage()),
  );
},

                child: Text(
                  'Ingin ganti akun? Log out',
                  style: TextStyle(fontSize: 16),
                ),
              ),
            ],
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: 2,
        items: const [
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.home, size: 28),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.shopping_cart, size: 28),
            ),
            label: '',
          ),
          BottomNavigationBarItem(
            icon: Padding(
              padding: EdgeInsets.only(top: 10),
              child: Icon(Icons.person, size: 28),
            ),
            label: '',
          ),
        ],
        onTap: (index) {
          // Tambahkan kode untuk menavigasi berdasarkan indeks yang dipilih
        },
      ),
    );
  }
}
