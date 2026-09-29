import 'package:flutter/material.dart';

class Header extends StatelessWidget {
  const Header({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
      color: const Color(0xFF1A56DB),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("SDN HARJAMUKTI 01",
                  style: TextStyle(color: Colors.white70, fontSize: 10)),
              Text("Beranda",
                  style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.bold)),
            ],
          ),
          Row(
            children: [
              Stack(
                children: [
                  const Icon(Icons.notifications_none, color: Colors.white),
                  const Positioned(
                    right: 0,
                    top: 0,
                    child: CircleAvatar(
                      radius: 4,
                      backgroundColor: Colors.orange,
                    ),
                  ),
                ],
              ),
              const SizedBox(width: 16),
              const CircleAvatar(
                radius: 16,
                backgroundColor: Colors.orange,
                child: Icon(Icons.person, color: Colors.white, size: 20),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
