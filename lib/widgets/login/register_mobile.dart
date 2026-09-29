import 'package:flutter/material.dart';

import '../../core/app_routes.dart';

void main() {
  runApp(const BinaroRegisterMobile());
}

class BinaroRegisterMobile extends StatelessWidget {
  const BinaroRegisterMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Binaro - Register',
      theme: ThemeData(
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF246B9A)),
        useMaterial3: true,
      ),
      home: const RegisterMobilePage(),
    );
  }
}

class RegisterMobilePage extends StatelessWidget {
  const RegisterMobilePage({super.key});

  static const primary = Color(0xFF246B9A);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);

    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              SizedBox(
                height: size.height * .34,
                width: double.infinity,
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    bottomLeft: Radius.circular(30),
                    bottomRight: Radius.circular(30),
                  ),
                  child: Stack(
                    fit: StackFit.expand,
                    children: [
                      Image.asset(
                        'assets/images/sekolah.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) => Container(
                          color: primary,
                          child: const Center(
                            child: Icon(
                              Icons.school,
                              size: 75,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      Container(color: const Color(0xAA204F6B)),
                      Padding(
                        padding: const EdgeInsets.all(28),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Row(
                              children: [
                                Container(
                                  width: 48,
                                  height: 48,
                                  decoration: BoxDecoration(
                                    color: const Color(0xFF1E6FA8),
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: const Icon(
                                    Icons.school_outlined,
                                    color: Colors.white,
                                    size: 29,
                                  ),
                                ),
                                const SizedBox(width: 12),
                                const Text(
                                  'Binaro',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 29,
                                    fontWeight: FontWeight.w700,
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 17),
                            const Text(
                              'Selamat datang di Binaro pembelajaran '
                              'SD Negeri Kalipaten 1!',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 12,
                                height: 1.4,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.fromLTRB(28, 30, 28, 35),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Sign Up',
                      style: TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 25),
                    const RegisterField(
                      icon: Icons.person,
                      hint: 'Nama Lengkap',
                    ),
                    const SizedBox(height: 12),
                    const RegisterField(icon: Icons.badge, hint: 'NISN / NIS'),
                    const SizedBox(height: 12),
                    const RegisterField(
                      icon: Icons.phone,
                      hint: 'Nomor HP / WhatsApp Wali',
                    ),
                    const SizedBox(height: 12),
                    const RegisterField(
                      icon: Icons.email,
                      hint: 'Email Siswa / Wali',
                    ),
                    const SizedBox(height: 12),
                    const RegisterField(
                      icon: Icons.lock,
                      hint: 'Password',
                      obscureText: true,
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      width: double.infinity,
                      height: 46,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                            AppRoutes.login,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(6),
                          ),
                        ),
                        child: const Text(
                          'Sign Up',
                          style: TextStyle(
                            fontSize: 12,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Navigator.of(context).pushReplacementNamed(
                          AppRoutes.login,
                        );
                      },
                      child: const Text('Sudah punya akun? Login'),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class RegisterField extends StatelessWidget {
  static const primary = Color(0xFF246B9A);
  final IconData icon;
  final String hint;
  final bool obscureText;

  const RegisterField({
    super.key,
    required this.icon,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 46,
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(fontSize: 12),
        decoration: InputDecoration(
          hintText: hint,
          hintStyle: const TextStyle(fontSize: 11, color: Colors.black87),
          prefixIcon: Icon(icon, size: 17, color: Colors.black),
          contentPadding: const EdgeInsets.symmetric(
            horizontal: 12,
            vertical: 0,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: primary, width: 1),
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: primary, width: 1),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(7),
            borderSide: const BorderSide(color: primary, width: 1.5),
          ),
        ),
      ),
    );
  }
}
