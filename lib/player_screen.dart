import 'package:flutter/material.dart';
import 'detail_player_screen.dart'; // pastikan file ini ada

class AddPlayerScreen extends StatefulWidget {
  const AddPlayerScreen({super.key});

  @override
  State<AddPlayerScreen> createState() => _AddPlayerScreenState();
}

class _AddPlayerScreenState extends State<AddPlayerScreen> {
  final _formKey = GlobalKey<FormState>();
  String? _gender;

  final _namaController = TextEditingController();
  final _posisiController = TextEditingController();
  final _nomorController = TextEditingController();
  final _kewarganegaraanController = TextEditingController();
  final _usiaController = TextEditingController();
  final _tinggiController = TextEditingController();

  @override
  void dispose() {
    _namaController.dispose();
    _posisiController.dispose();
    _nomorController.dispose();
    _kewarganegaraanController.dispose();
    _usiaController.dispose();
    _tinggiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Tambah Pemain Baru',
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
          ),
        ),
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        iconTheme: const IconThemeData(color: Colors.white),
      ),
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(24),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                'Isi form di bawah untuk menambahkan pemain baru.',
                style: TextStyle(color: Colors.black54),
              ),
              const SizedBox(height: 24),

              // Nama Pemain
              _buildTextField(
                controller: _namaController,
                label: 'Nama Pemain',
                hint: 'Masukkan nama pemain',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nama pemain wajib diisi';
                  }
                  if (value.length < 3) {
                    return 'Nama minimal 3 karakter';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Posisi Pemain
              _buildTextField(
                controller: _posisiController,
                label: 'Posisi Pemain',
                hint: 'Masukkan posisi pemain',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Posisi pemain wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Nomor Punggung
              _buildTextField(
                controller: _nomorController,
                label: 'Nomor Punggung',
                hint: 'Masukkan nomor punggung pemain',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Nomor punggung wajib diisi';
                  }
                  final nomor = int.tryParse(value);
                  if (nomor == null || nomor <= 0) {
                    return 'Nomor harus berupa angka positif';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Kewarganegaraan
              _buildTextField(
                controller: _kewarganegaraanController,
                label: 'Kewarganegaraan',
                hint: 'Masukkan kewarganegaraan pemain',
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Kewarganegaraan wajib diisi';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Usia Pemain
              _buildTextField(
                controller: _usiaController,
                label: 'Usia Pemain',
                hint: 'Masukkan usia pemain',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Usia wajib diisi';
                  }
                  final usia = int.tryParse(value);
                  if (usia == null) {
                    return 'Usia harus berupa angka';
                  } else if (usia < 10 || usia > 50) {
                    return 'Usia tidak valid (10–50 tahun)';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 16),

              // Tinggi Pemain
              _buildTextField(
                controller: _tinggiController,
                label: 'Tinggi Pemain (cm)',
                hint: 'Masukkan tinggi pemain',
                keyboardType: TextInputType.number,
                validator: (value) {
                  if (value == null || value.isEmpty) {
                    return 'Tinggi wajib diisi';
                  }
                  final tinggi = double.tryParse(value);
                  if (tinggi == null || tinggi <= 0) {
                    return 'Tinggi harus berupa angka positif';
                  }
                  return null;
                },
              ),
              const SizedBox(height: 24),

              // Jenis Kelamin
              const Text(
                'Jenis Kelamin',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  color: Colors.black87,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blueAccent,
                        value: 'Laki-laki',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const Text('Laki-laki'),
                    ],
                  ),
                  Row(
                    children: [
                      Radio<String>(
                        activeColor: Colors.blueAccent,
                        value: 'Perempuan',
                        groupValue: _gender,
                        onChanged: (value) {
                          setState(() {
                            _gender = value;
                          });
                        },
                      ),
                      const Text('Perempuan'),
                    ],
                  ),
                ],
              ),
              if (_gender == null)
                const Padding(
                  padding: EdgeInsets.only(top: 8.0),
                  child: Text(
                    'Silakan pilih jenis kelamin',
                    style: TextStyle(color: Colors.redAccent, fontSize: 12),
                  ),
                ),
              const SizedBox(height: 32),

              // Tombol Tambah Pemain
              SizedBox(
                width: double.infinity,
                height: 50,
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blueAccent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onPressed: () {
                    FocusScope.of(context).unfocus();
                    if (_formKey.currentState!.validate() && _gender != null) {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailPlayerScreen(
                            nama: _namaController.text,
                            posisi: _posisiController.text,
                            nomor: _nomorController.text,
                            kewarganegaraan:
                                _kewarganegaraanController.text,
                            usia: _usiaController.text,
                            tinggi: _tinggiController.text,
                            gender: _gender!,
                          ),
                        ),
                      );
                    } else if (_gender == null) {
                      setState(() {});
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Silakan pilih jenis kelamin pemain'),
                          backgroundColor: Colors.redAccent,
                        ),
                      );
                    }
                  },
                  child: const Text(
                    'Tambah Pemain',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    required String hint,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      validator: validator,
      autovalidateMode: AutovalidateMode.onUserInteraction,
      decoration: InputDecoration(
        labelText: label,
        hintText: hint,
        labelStyle: const TextStyle(color: Color.fromARGB(255, 16, 16, 16)),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent, width: 2),
          borderRadius: BorderRadius.circular(10),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.blueAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        errorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.redAccent),
          borderRadius: BorderRadius.circular(10),
        ),
      ),
    );
  }
}