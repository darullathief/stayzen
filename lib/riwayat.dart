import 'package:flutter/material.dart';
import 'package:stayzen/BottomAppBar.dart';

class OrderHistoryPage extends StatefulWidget {
  const OrderHistoryPage({Key? key}) : super(key: key);

  @override
  _OrderHistoryPageState createState() => _OrderHistoryPageState();
}

class _OrderHistoryPageState extends State<OrderHistoryPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this, initialIndex: 0);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.of(context).pop();
          },
        ),
        bottom: TabBar(
          controller: _tabController,
          tabs: const [
            Tab(text: 'Riwayat'),
            Tab(text: 'Sedang Berjalan'),
          ],
          indicatorColor: Colors.white,
          indicatorWeight: 3.0,
        ),
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          ListView(
            children: const [
              OrderHistoryItem(
                hotelName: 'Villa Sunset Paradise',
                date: 'Check-In: 20 Mei 2023',
                review: null,
              ),
              OrderHistoryItem(
                hotelName: 'Bekasi Indah',
                date: 'Check-In: 11 Januari 2023',
                review: 'Pelayanan kurang memuaskan.',
              ),
              OrderHistoryItem(
                hotelName: 'Selatan View',
                date: 'Check-In: 20 September 2023',
                review: 'Pemandangan luar biasa!',
              ),
            ],
          ),
          const Center(
            child: Text('Halaman Sedang Berjalan'),
          ),
        ],
      ),
      bottomNavigationBar: MyBottomAppBar(currentIndex: 1,),
    );
  }
}

class OrderHistoryItem extends StatelessWidget {
  final String hotelName;
  final String date;
  final String? review;

  const OrderHistoryItem({
    Key? key,
    required this.hotelName,
    required this.date,
    this.review,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      child: ListTile(
        title: Text(
          hotelName,
          style: const TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        ),
        subtitle: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              date,
              style: const TextStyle(fontSize: 10),
            ),
            if (review != null) ...[
              const SizedBox(height: 4),
              Text(
                review!,
                style: const TextStyle(fontSize: 10),
              ),
            ],
          ],
        ),
        trailing: review != null
            ? ElevatedButton(
                onPressed: () {
                  // Tambahkan kode untuk menangani tombol pesan lagi
                },
                child: const Text('Pesan Lagi'),
              )
            : ElevatedButton(
                onPressed: () {
                  // Tambahkan kode untuk menangani tombol beri tanggapan
                },
                child: const Text('Beri Tanggapan'),
              ),
        onTap: () {
          // Tambahkan kode untuk menavigasi ke halaman detail pesanan
        },
      ),
    );
  }
}

// void main() {
//   runApp(const MaterialApp(
//     home: OrderHistoryPage(),
//   ));
// }
