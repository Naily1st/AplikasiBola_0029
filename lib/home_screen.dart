import 'package:flutter/material.dart';
import 'player_screen.dart';
import 'login_screen.dart'; // pastikan path-nya sesuai

class HomeScreen extends StatelessWidget {
  final String nama;

  const HomeScreen({super.key, required this.nama});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,

      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: const Text(
          'Real Madrid App',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        centerTitle: true,
        leading: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Image.asset('assets/images/realmadrid.png'),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.settings, color: Colors.white),
            onPressed: () {
              ScaffoldMessenger.of(context).showSnackBar(
                const SnackBar(content: Text('Menu pengaturan belum tersedia')),
              );
            },
          ),
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              'Jadwal Pertandingan Real Madrid',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 10),

            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.blue[50],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.blueAccent.shade200),
              ),
              child: const Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(
                    child: Text(
                      'Real Madrid  VS  Barcelona',
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  SizedBox(height: 8),
                  Text('Tanggal: 25 Desember 2024'),
                  Text('Waktu: 19:00 WIB'),
                  Text('Lokasi: Stadion Gelora Bung Tomo'),
                ],
              ),
            ),

            const SizedBox(height: 24),
            const Text(
              'Menu',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                MenuItem(
                  icon: Icons.person,
                  label: 'Player',
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const AddPlayerScreen()),
                    );
                  },
                ),
                const MenuItem(icon: Icons.schedule, label: 'Jadwal'),
                const MenuItem(icon: Icons.bar_chart, label: 'Klasemen'),
                const MenuItem(icon: Icons.shopping_bag, label: 'Merchandise'),
              ],
            ),

            const SizedBox(height: 24),
            const Text(
              'Berita Terbaru Real Madrid',
              style: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
            const SizedBox(height: 12),

            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: const [
                  BeritaCard(
                    title: 'Bellingham Cetak 3 Gol Beruntun',
                    content:
                        'Jude Bellingham tampil luar biasa dengan mencetak tiga gol dalam tiga pertandingan terakhir Real Madrid melawan Juventus, Barcelona, dan Valencia.',
                  ),
                  SizedBox(width: 12),
                  BeritaCard(
                    title: 'Xabi Alonso Terapkan Metode Latihan Baru',
                    content:
                        'Pelatih Real Madrid, Xabi Alonso, memperkenalkan metode latihan baru dengan tidak berlatih di stadion lawan sebelum laga besar Liga Champions.',
                  ),
                  SizedBox(width: 12),
                  BeritaCard(
                    title: 'Arda Güler Siap Hadapi Liverpool',
                    content:
                        'Setelah pulih dari cedera pergelangan kaki, Arda Güler kini dipastikan fit dan siap tampil dalam pertandingan melawan Liverpool di Anfield.',
                  ),
                ],
              ),
            ),

            const SizedBox(height: 40),

            SizedBox(
              width: double.infinity,
              height: 48,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blueAccent,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                onPressed: () {
                  Navigator.pushAndRemoveUntil(
                    context,
                    MaterialPageRoute(builder: (context) => const LoginScreen()),
                    (route) => false,
                  );
                },
                child: const Text(
                  'Logout',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class MenuItem extends StatelessWidget {
  final IconData icon;
  final String label;
  final VoidCallback? onTap;

  const MenuItem({
    super.key,
    required this.icon,
    required this.label,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Column(
        children: [
          Icon(icon, size: 32, color: Colors.blueAccent),
          const SizedBox(height: 5),
          Text(
            label,
            style: const TextStyle(fontWeight: FontWeight.w500),
          ),
        ],
      ),
    );
  }
}

class BeritaCard extends StatelessWidget {
  final String title;
  final String content;

  const BeritaCard({super.key, required this.title, required this.content});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 230,
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.blue[50],
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: Colors.blueAccent.shade200),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blueAccent,
            ),
          ),
          const SizedBox(height: 5),
          Text(
            content,
            style: const TextStyle(fontSize: 13),
          ),
        ],
      ),
    );
  }
}
