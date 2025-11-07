import 'package:flutter/material.dart';
import 'package:tee/main.dart';
import 'cart.dart';
import 'favorite.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({super.key});

  @override
  Widget build(BuildContext context) {
    const themeColor = Color(0xFF75070C);

    return Scaffold(
      backgroundColor: const Color(0xFFFFF5EE), // soft cream background
      appBar: AppBar(
        backgroundColor: const Color(0xFFFFF5EE),
        elevation: 0,
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'YOUR PROFILE',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w700,
            fontSize: 16,
            color: Colors.black,
          ),
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.share, color: Colors.black),
            onPressed: () {},
          ),
        ],
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          // Profile picture
          const CircleAvatar(
            radius: 60,
            backgroundImage: AssetImage('assets/images/passport(1).jpg'),
          ),
          const SizedBox(height: 12),

          // Name and email
          const Text(
            'TRACY OKOLI',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 18,
              fontWeight: FontWeight.w800,
              color: themeColor,
            ),
          ),
          const Text(
            'tracyokoli20@.com',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontSize: 14,
              color: themeColor,
            ),
          ),
          const SizedBox(height: 25),

          // Menu Buttons
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              children: [
                _buildProfileButton(Icons.history, 'History'),
                const SizedBox(height: 12),
                _buildProfileButton(Icons.account_balance_wallet, 'Wallet'),
                const SizedBox(height: 12),
                _buildProfileButton(Icons.settings, 'Settings'),
                const SizedBox(height: 12),
                _buildProfileButton(Icons.location_on, 'Location'),
              ],
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
        decoration: const BoxDecoration(
          color: Color(0xFF75070C),
          
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
           GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const HomePage()),
                );
              },
              child: _buildNavIcon(Icons.home, false),
            ),
            
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const CartPage()),
                );
              },
              child: _buildNavIcon(Icons.shopping_cart, false),
            ),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const FavoritesPage(),
                  ),
                );
              },
              child: _buildNavIcon(Icons.favorite, false),
            ),
            // _buildNavIcon(Icons.person, false),
            GestureDetector(
              onTap: () => Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const ProfilePage()),
              ),
              child: _buildNavIcon(Icons.person, true),
            ),
          ],
        ),
      ),
    );
  }

  // Reusable profile option card
  Widget _buildProfileButton(IconData icon, String label) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 14, horizontal: 20),
      decoration: BoxDecoration(
        color: const Color(0xFFFFE9A8),
        borderRadius: BorderRadius.circular(12),
      ),
      child: Row(
        children: [
          Icon(icon, color: Color(0xFF75070C)),
          const SizedBox(width: 15),
          Text(
            label,
            style: const TextStyle(
              fontFamily: 'Poppins',
              fontSize: 16,
              fontWeight: FontWeight.w500,
              color: Color(0xFF75070C),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildNavIcon(IconData icon, bool isActive) {
    return Container(
      width: 56,
      height: 56,
      decoration: BoxDecoration(
        color: isActive ? const Color(0xFFFFEDAD) : Colors.white,
        shape: BoxShape.circle,
      ),
      child: Icon(icon, color: const Color(0xFF75070C), size: 28),
    );
  }
}

