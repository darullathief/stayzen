import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'home.dart'; // Import halaman HomeScreen


class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            SizedBox(height: 70),
            Center(
              child: Image.network(
                'https://darullathief.000webhostapp.com/img/logo_stayzen.png',
                width: 200,
                height: 200,
                fit: BoxFit.contain,
              ),
            ),
            SizedBox(height: 40),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: GoogleFonts.poppins(), // Ubah font input field
                decoration: InputDecoration(
                  labelText: 'Email',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: TextField(
                style: GoogleFonts.poppins(), // Ubah font input field
                obscureText: true,
                decoration: InputDecoration(
                  labelText: 'Password',
                  border: OutlineInputBorder(),
                  suffixIcon: IconButton(
                    onPressed: () {
                      // Tambahkan aksi ketika ikon mata ditekan
                    },
                    icon: Icon(Icons.visibility),
                  ),
                ),
              ),
            ),
            SizedBox(height: 20),
            Container(
              width: double.infinity,
              margin: EdgeInsets.symmetric(horizontal: 20),
              child: ElevatedButton(
                onPressed: () {
                  // Aksi ketika tombol login ditekan
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => HomeScreen()),
                  );
                },
                child: Text(
                  'Login',
                  style: GoogleFonts.poppins(), // Ubah font tombol
                ),
              ),
            ),
            SizedBox(height: 20),
            Text('atau'),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Aksi ketika tombol Google Log in ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: Image.network(
                    'https://www.freepnglogos.com/uploads/google-logo-png/google-logo-png-webinar-optimizing-for-success-google-business-webinar-13.png',
                    width: 30,
                    height: 30,
                  ),
                  label: Text(
                    'Log in dengan Google',
                    style: GoogleFonts.poppins(), // Ubah font teks
                  ),
                ),
              ],
            ),
            SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton.icon(
                  onPressed: () {
                    // Aksi ketika tombol Facebook Log in ditekan
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomeScreen()),
                    );
                  },
                  style: ElevatedButton.styleFrom(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8.0),
                    ),
                  ),
                  icon: Image.network(
                    'https://upload.wikimedia.org/wikipedia/commons/thumb/5/51/Facebook_f_logo_%282019%29.svg/1024px-Facebook_f_logo_%282019%29.svg.png',
                    width: 30,
                    height: 30,
                  ),
                  label: Text(
                    'Log in dengan Facebook',
                    style: GoogleFonts.poppins(), // Ubah font teks
                  ),
                ),
              ],
            ),
            SizedBox(height: 5),
            TextButton(
              onPressed: () {
                // Aksi ketika tombol "Lupa Kata Sandi?" ditekan
              },
              child: Text(
                'Lupa Kata Sandi?',
                style: GoogleFonts.poppins(), // Ubah font teks
              ),
            ),
            SizedBox(height: 5),
            SizedBox(height: 100),
            TextButton(
              onPressed: () {
                // Aksi ketika tombol "Sign up" ditekan
              },
              child: Text(
                'Belum punya akun? Sign up',
                style: GoogleFonts.poppins(fontWeight: FontWeight.bold), // Ubah font teks dan tambahkan ketebalan
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Login Page',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
        textTheme: GoogleFonts.poppinsTextTheme(), // Ubah tema teks global menjadi Poppins
      ),
      home: LoginPage(),
    );
  }
}
