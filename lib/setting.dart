import 'package:flutter/material.dart';
import 'profil.dart';

class ProfileSettingsPage extends StatefulWidget {
  @override
  _ProfileSettingsPageState createState() => _ProfileSettingsPageState();
}

class _ProfileSettingsPageState extends State<ProfileSettingsPage> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _addressController = TextEditingController();

  @override
  void initState() {
    // Inisialisasi nilai awal pada controller
    _nameController.text = 'John Doe'; // Ganti dengan nilai awal nama
    _phoneController.text =
        '1234567890'; // Ganti dengan nilai awal nomor telepon
    _emailController.text =
        'johndoe@example.com'; // Ganti dengan nilai awal email
    _addressController.text =
        '123 Street, City'; // Ganti dengan nilai awal alamat

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Color(0xFF00A6DA),
        title: const Text('Pengaturan Profil'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Container(
                margin: const EdgeInsets.only(
                    bottom: 16, top: 26), // Tambahkan margin dari atas
                child: const CircleAvatar(
                  radius: 86,
                  backgroundImage: NetworkImage(
                    'https://img.okezone.com/content/2023/03/14/33/2780644/biodata-dan-agama-natasha-wilona-pernah-hidup-susah-dan-tinggal-di-gubuk-Z8pJ2rziYQ.jpg', // Ganti dengan URL foto profil
                  ),
                ),
              ),
              const Text(
                'Natasha Wilona',
                style: TextStyle(fontSize: 16),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _nameController,
                decoration: const InputDecoration(
                  labelText: 'Name',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _phoneController,
                decoration: const InputDecoration(
                  labelText: 'Phone',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _emailController,
                decoration: const InputDecoration(
                  labelText: 'Email',
                ),
              ),
              const SizedBox(height: 16),
              TextField(
                controller: _addressController,
                decoration: const InputDecoration(
                  labelText: 'Address',
                ),
              ),
              const SizedBox(height: 16),
              ElevatedButton(
                onPressed: () {
                  // Simpan data profil ke server atau lakukan tindakan lain
                  String name = _nameController.text;
                  String phone = _phoneController.text;
                  String email = _emailController.text;
                  String address = _addressController.text;

                  // Tambahkan logika penyimpanan atau tindakan lain sesuai kebutuhan

                  // Kembali ke halaman profil.dart
                  Navigator.of(context).pop();
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(
                      0xFF00A6DA), // Ganti dengan warna latar belakang yang diinginkan
                ),
                child: const Text('Save'),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// void main() {
//   runApp(MaterialApp(
//     home: ProfileSettingsPage(),
//   ));
// }
