import 'package:flutter/material.dart';

class RegisterMenuPage extends StatefulWidget {
  const RegisterMenuPage({super.key});

  @override
  State<RegisterMenuPage> createState() => _RegisterMenuPageState();
}

class _RegisterMenuPageState extends State<RegisterMenuPage> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  bool _isRegistered = false; // buat ganti tampilan dari daftar ke menu

  // Data produk
  final List<Map<String, dynamic>> items = const [
    {
      "kode_produk": "PRD-001",
      "deskripsi": "Good Day Freeze",
      "harga": 15000,
      "stok": 5,
      "rating": 4.8,
      "gambar": "gambar/001.png"
    },
    {
      "kode_produk": "PRD-002",
      "deskripsi": "Kapal Api",
      "harga": 20000,
      "stok": 6,
      "rating": 4.7,
      "gambar": "gambar/002.png"
    },
    {
      "kode_produk": "PRD-003",
      "deskripsi": "Torabika Coffee",
      "harga": 21000,
      "stok": 5,
      "rating": 4.8,
      "gambar": "gambar/003.png"
    },
    {
      "kode_produk": "PRD-004",
      "deskripsi": "Pikopi",
      "harga": 13000,
      "stok": 5,
      "rating": 4.4,
      "gambar": "gambar/004.png"
    },
  ];

  void _submitForm() {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isRegistered = true; // tampilkan list produk
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: Text(_isRegistered ? 'Menu Produk' : 'Daftar Akun'),
      ),
      body: _isRegistered ? _buildMenu() : _buildRegisterForm(),
    );
  }

  // 🧾 Form Daftar
  Widget _buildRegisterForm() {
    return SingleChildScrollView(
      padding: const EdgeInsets.all(20),
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 30),
            Center(
              child: Column(
                children: [
                  Image.asset('gambar/Logo.png', width: 100),
                  const SizedBox(height: 10),
                  const Text(
                    'LKS MART',
                    style: TextStyle(fontSize: 26, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            const Text('Daftar', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
            const Text('Silahkan isi data pribadi anda'),
            const SizedBox(height: 20),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Nama Lengkap'),
              validator: (v) => v!.isEmpty ? 'Isi nama lengkap' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Alamat'),
              validator: (v) => v!.isEmpty ? 'Isi alamat' : null,
            ),
            TextFormField(
              decoration: const InputDecoration(labelText: 'Username'),
              validator: (v) => v!.isEmpty ? 'Isi username' : null,
            ),
            TextFormField(
              controller: _passwordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Password (min. 8 karakter)'),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Isi password';
                if (v.length < 8) return 'Minimal 8 karakter';
                return null;
              },
            ),
            TextFormField(
              controller: _confirmPasswordController,
              obscureText: true,
              decoration: const InputDecoration(labelText: 'Konfirmasi Password'),
              validator: (v) {
                if (v == null || v.isEmpty) return 'Konfirmasi password';
                if (v != _passwordController.text) return 'Password tidak sama!';
                return null;
              },
            ),
            const SizedBox(height: 30),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(horizontal: 100, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                ),
                child: const Text('Daftar', style: TextStyle(fontSize: 18)),
              ),
            ),
          ],
        ),
      ),
    );
  }

  // 🛍️ Tampilan List Produk
  Widget _buildMenu() {
    return ListView.builder(
      itemCount: items.length,
      itemBuilder: (context, index) {
        final item = items[index];
        return Card(
          margin: const EdgeInsets.all(10),
          child: ListTile(
            leading: Image.asset(item['gambar'], width: 50, fit: BoxFit.cover),
            title: Text(item['deskripsi']),
            subtitle: Text('Harga: Rp${item['harga']} | Stok: ${item['stok']}'),
            trailing: Text('⭐ ${item['rating']}'),
          ),
        );
      },
    );
  }
}