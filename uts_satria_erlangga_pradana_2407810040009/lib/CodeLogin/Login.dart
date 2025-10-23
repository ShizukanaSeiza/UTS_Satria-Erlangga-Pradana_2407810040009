import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'LKS Mart - Login',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        useMaterial3: true,
      ),
      home: const LoginPage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailCtrl = TextEditingController();
  final _passCtrl = TextEditingController();
  bool _obscure = true;
  bool _keepLogged = false;

  @override
  void dispose() {
    _emailCtrl.dispose();
    _passCtrl.dispose();
    super.dispose();
  }

  void _tryLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      // Placeholder: proses login
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Logging in as ${_emailCtrl.text}')),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    final radius = 20.0;
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 28, vertical: 24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(height: 8),
              // Logo + Title
              Column(
                children: [
                  // Ganti dengan Image.asset('assets/logo.png') jika pakai asset lokal
                  SizedBox(
                    height: 110,
                    child: Image.asset(
                      'gambar/Logo.png',
                      fit: BoxFit.contain,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'LKS\nMART',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 32,
                      fontWeight: FontWeight.w700,
                      color: Color(0xFF2E5670),
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 24),

              // Card / form area
              Container(
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(radius),
                  boxShadow: const [
                    BoxShadow(
                      color: Color.fromARGB(30, 0, 0, 0),
                      blurRadius: 18,
                      offset: Offset(0, 6),
                    ),
                  ],
                ),
                padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 18),
                child: Form(
                  key: _formKey,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'Sign In',
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      const SizedBox(height: 6),
                      const Text(
                        'Enter your ID and password to sign in!',
                        style: TextStyle(color: Colors.black54),
                      ),
                      const SizedBox(height: 18),

                      // Email
                      const Text('Email', style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          hintText: 'email',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                        ),
                        validator: (v) {
                          if (v == null || v.trim().isEmpty) return 'Email harus diisi';
                          final email = v.trim();
                          final emailRegex = RegExp(r'^[^@]+@[^@]+\.[^@]+');
                          if (!emailRegex.hasMatch(email)) return 'Masukkan email valid';
                          return null;
                        },
                      ),
                      const SizedBox(height: 12),

                      // Password
                      const Text('Password*', style: TextStyle(fontWeight: FontWeight.w600)),
                      const SizedBox(height: 6),
                      TextFormField(
                        controller: _passCtrl,
                        obscureText: _obscure,
                        decoration: InputDecoration(
                          hintText: 'Min. 8 characters',
                          contentPadding: const EdgeInsets.symmetric(horizontal: 14, vertical: 14),
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(12)),
                          suffixIcon: IconButton(
                            icon: Icon(_obscure ? Icons.visibility_off : Icons.visibility),
                            onPressed: () => setState(() => _obscure = !_obscure),
                          ),
                        ),
                        validator: (v) {
                          if (v == null || v.isEmpty) return 'Password harus diisi';
                          if (v.length < 8) return 'Minimal 8 karakter';
                          return null;
                        },
                      ),

                      const SizedBox(height: 12),

                      // Keep me logged in
                      Row(
                        children: [
                          Checkbox(
                            value: _keepLogged,
                            onChanged: (v) => setState(() => _keepLogged = v ?? false),
                          ),
                          const SizedBox(width: 6),
                          const Text('Keep me logged in')
                        ],
                      ),

                      const SizedBox(height: 10),

                      // Login button with glow / shadow like design
                      Center(
                        child: Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(28),
                            boxShadow: const [
                              BoxShadow(
                                color: Color.fromARGB(90, 128, 117, 255), // soft glow
                                blurRadius: 24,
                                spreadRadius: 0,
                                offset: Offset(0, 8),
                              ),
                            ],
                          ),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: const Color(0xFF2E5670),
                              padding: const EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(28)),
                            ),
                            onPressed: _tryLogin,
                            child: const Text('Login', style: TextStyle(fontSize: 16)),
                          ),
                        ),
                      ),

                      const SizedBox(height: 12),

                      // Register link
                      Center(
                        child: Wrap(
                          alignment: WrapAlignment.center,
                          children: [
                            const Text('Belum punya akun? '),
                            GestureDetector(
                              onTap: () {
                                // contoh navigasi ke halaman register
                                ScaffoldMessenger.of(context).showSnackBar(
                                  const SnackBar(content: Text('Navigasi ke halaman Daftar')),
                                );
                              },
                              child: Text(
                                'Daftar di sini',
                                style: TextStyle(color: Theme.of(context).primaryColor, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              const SizedBox(height: 18),

              // bottom bar color strip (mirip gambar)
              Container(
                height: 22,
                width: double.infinity,
                decoration: const BoxDecoration(
                  color: Color(0xFF2E5670),
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(12),
                    topRight: Radius.circular(12),
                  ),
                ),
              ),

              const SizedBox(height: 24),
            ],
          ),
        ),
      ),
    );
  }
}