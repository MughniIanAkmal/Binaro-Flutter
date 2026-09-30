import 'package:flutter/material.dart';

import '../../core/app_routes.dart';

void main() {
  runApp(const BinaroLoginMobile());
}

enum UserRole { siswa, guru, admin }

class BinaroLoginMobile extends StatelessWidget {
  const BinaroLoginMobile({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Binaro - Login',
      theme: ThemeData(
        fontFamily: 'Arial',
        colorScheme: ColorScheme.fromSeed(seedColor: const Color(0xFF246B9A)),
        useMaterial3: true,
      ),
      home: const LoginMobilePage(),
    );
  }
}

// ============================================================
// LOGIN MOBILE PAGE
// ============================================================

class LoginMobilePage extends StatefulWidget {
  final UserRole initialRole;

  const LoginMobilePage({
    super.key,
    this.initialRole = UserRole.siswa,
  });

  @override
  State<LoginMobilePage> createState() => _LoginMobilePageState();
}

class _LoginMobilePageState extends State<LoginMobilePage> {
  late UserRole selectedRole;

  @override
  void initState() {
    super.initState();
    selectedRole = widget.initialRole;
  }

  static const primary = Color(0xFF246B9A);

  String get roleName {
    switch (selectedRole) {
      case UserRole.siswa:
        return 'Siswa';
      case UserRole.guru:
        return 'Guru';
      case UserRole.admin:
        return 'Admin';
    }
  }

  String get secondHint {
    switch (selectedRole) {
      case UserRole.siswa:
        return 'NISN / NIS';
      case UserRole.guru:
        return 'Email / NIP Guru';
      case UserRole.admin:
        return 'Email / Username Admin';
    }
  }

  IconData get secondIcon {
    switch (selectedRole) {
      case UserRole.siswa:
        return Icons.badge;
      case UserRole.guru:
        return Icons.email;
      case UserRole.admin:
        return Icons.admin_panel_settings;
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF7F7F7),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // ==================================================
              // HEADER
              // ==================================================

              Container(
                width: double.infinity,
                height: 260,
                decoration: const BoxDecoration(
                  color: primary,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(35),
                    bottomRight: Radius.circular(35),
                  ),
                ),
                child: Stack(
                  fit: StackFit.expand,
                  children: [
                    // GAMBAR SEKOLAH
                    ClipRRect(
                      borderRadius: const BorderRadius.only(
                        bottomLeft: Radius.circular(35),
                        bottomRight: Radius.circular(35),
                      ),
                      child: Image.asset(
                        'assets/images/sekolah.jpg',
                        fit: BoxFit.cover,
                        errorBuilder: (context, error, stackTrace) {
                          return Container(
                            color: primary,
                            child: const Center(
                              child: Icon(
                                Icons.school,
                                size: 75,
                                color: Colors.white,
                              ),
                            ),
                          );
                        },
                      ),
                    ),

                    // OVERLAY BIRU
                    Container(
                      decoration: const BoxDecoration(
                        color: Color(0xCC204F6B),
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(35),
                          bottomRight: Radius.circular(35),
                        ),
                      ),
                    ),

                    // ISI HEADER
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 25,
                        vertical: 25,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          // LOGO + BINARO
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 52,
                                height: 52,
                                decoration: BoxDecoration(
                                  color: const Color(0xFF1E6FA8),
                                  borderRadius: BorderRadius.circular(9),
                                ),
                                child: const Icon(
                                  Icons.school_outlined,
                                  color: Colors.white,
                                  size: 31,
                                ),
                              ),

                              const SizedBox(width: 12),

                              const Text(
                                'Binaro',
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 30,
                                  fontWeight: FontWeight.w700,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(height: 18),

                          const Padding(
                            padding: EdgeInsets.symmetric(horizontal: 10),
                            child: Text(
                              'Selamat datang di Binaro pembelajaran '
                              'SD Negeri Kalipaten 1!',
                              textAlign: TextAlign.center,
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 13,
                                height: 1.4,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),

              // ==================================================
              // FORM LOGIN
              // ==================================================
              Container(
                width: double.infinity,
                margin: const EdgeInsets.all(18),
                padding: const EdgeInsets.all(22),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(18),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withValues(alpha: 0.06),
                      blurRadius: 12,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // ==================================================
                    // JUDUL LOGIN
                    // ==================================================

                    const Text(
                      'Login',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.w700,
                      ),
                    ),

                    const SizedBox(height: 7),

                    const Text(
                      'Silakan masuk dengan akun siswa kamu',
                      style: TextStyle(color: Colors.grey, fontSize: 12),
                    ),

                    const SizedBox(height: 20),

                    // ==================================================
                    // USERNAME / NISN
                    // ==================================================
                    const LoginField(
                      icon: Icons.person,
                      hint: 'Username / NISN',
                    ),

                    const SizedBox(height: 12),

                    // ==================================================
                    // PASSWORD
                    // ==================================================
                    const LoginField(
                      icon: Icons.lock,
                      hint: 'Password',
                      obscureText: true,
                    ),

                    const SizedBox(height: 24),

                    // ==================================================
                    // LOGIN BUTTON
                    // ==================================================
                    SizedBox(
                      width: double.infinity,
                      height: 48,
                      child: ElevatedButton(
                        onPressed: () {
                          Navigator.of(context).pushNamedAndRemoveUntil(
                            AppRoutes.home,
                            (route) => false,
                          );
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: primary,
                          foregroundColor: Colors.white,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(7),
                          ),
                        ),
                        child: const Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),

                    const SizedBox(height: 14),

                    Center(
                      child: TextButton(
                        onPressed: () {
                          Navigator.of(context).pushReplacementNamed(
                            AppRoutes.register,
                          );
                        },
                        child: const Text(
                          'Belum punya akun? Daftar',
                          style: TextStyle(
                            color: primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}

// ============================================================
// ROLE BUTTON
// ============================================================

class RoleButton extends StatelessWidget {
  final String text;
  final UserRole role;
  final UserRole selectedRole;
  final ValueChanged<UserRole> onTap;

  const RoleButton({
    super.key,
    required this.text,
    required this.role,
    required this.selectedRole,
    required this.onTap,
  });

  static const primary = Color(0xFF246B9A);

  @override
  Widget build(BuildContext context) {
    final bool selected = role == selectedRole;

    return SizedBox(
      height: 38,
      child: ElevatedButton(
        onPressed: () {
          onTap(role);
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: selected ? primary : Colors.white,
          foregroundColor: selected ? Colors.white : Colors.black,
          elevation: 0,
          padding: EdgeInsets.zero,
          side: const BorderSide(color: primary, width: 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
        ),
        child: Text(
          text,
          style: const TextStyle(fontSize: 10, fontWeight: FontWeight.bold),
        ),
      ),
    );
  }
}

// ============================================================
// LOGIN FIELD
// ============================================================

class LoginField extends StatelessWidget {
  final IconData icon;
  final String hint;
  final bool obscureText;

  const LoginField({
    super.key,
    required this.icon,
    required this.hint,
    this.obscureText = false,
  });

  @override
  Widget build(BuildContext context) {
    const primary = Color(0xFF246B9A);

    return SizedBox(
      height: 48,
      child: TextField(
        obscureText: obscureText,
        style: const TextStyle(fontSize: 13),
        decoration: InputDecoration(
          filled: true,
          fillColor: Colors.white,

          hintText: hint,

          hintStyle: const TextStyle(
            fontSize: 12,
            color: Colors.black87,
            fontWeight: FontWeight.bold,
          ),

          prefixIcon: Icon(icon, size: 19, color: Colors.black),

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
