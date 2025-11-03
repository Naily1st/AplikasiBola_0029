import 'package:flutter/material.dart';
import 'home_screen.dart'; // pastikan path sesuai dengan lokasi file kamu

class DetailPlayerScreen extends StatelessWidget {
  final String nama;
  final String posisi;
  final String nomor;
  final String kewarganegaraan;
  final String usia;
  final String tinggi;
  final String gender;

  const DetailPlayerScreen({
    super.key,
    required this.nama,
    required this.posisi,
    required this.nomor,
    required this.kewarganegaraan,
    required this.usia,
    required this.tinggi,
    required this.gender,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Detail Pemain'),
        centerTitle: true,
        backgroundColor: Colors.blueAccent,
        foregroundColor: Colors.white,
      ),
      body: Padding(
        padding: const EdgeInsets.all(24),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _buildInfo('Nama', nama),
            _buildInfo('Posisi', posisi),
            _buildInfo('Nomor', nomor),
            _buildInfo('Kebangsaan', kewarganegaraan),
            _buildInfo('Usia', '$usia tahun'),
            _buildInfo('Tinggi', '$tinggi m'),
            _buildInfo('Jenis Kelamin', gender),
            const SizedBox(height: 40),

            // Tombol Cancel
            ElevatedButton(
              onPressed: () => Navigator.pop(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.grey[300],
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Cancel',
                style: TextStyle(color: Colors.black87),
              ),
            ),
            const SizedBox(height: 12),

            // Tombol Save → menuju ke HomeScreen
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(
                  const SnackBar(
                    content: Text('Data pemain disimpan!'),
                    backgroundColor: Colors.blueAccent,
                  ),
                );

                // Pindah ke HomeScreen
                Navigator.pushAndRemoveUntil(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const HomeScreen(nama: '',),
                  ),
                  (route) => false, // hapus semua route sebelumnya
                );
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                minimumSize: const Size(double.infinity, 45),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12)),
              ),
              child: const Text(
                'Save',
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildInfo(String label, String value) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        '$label: $value',
        style: const TextStyle(
          fontSize: 16,
          color: Colors.black87,
        ),
      ),
    );
  }
}