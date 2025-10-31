import 'package:flutter/material.dart';
import 'package:tee/main.dart';
import 'cart.dart';
import 'profile.dart';

class FavoritesPage extends StatefulWidget {
  const FavoritesPage({super.key});

  @override
  State<FavoritesPage> createState() => _FavoritesPageState();
}

class _FavoritesPageState extends State<FavoritesPage> {
  final List<Map<String, dynamic>> favoriteItems = [
    {
      'name': 'Breakfast Food',
      'description':
          'volutpat tincidunt consectetur convallis. Donec Cras massa leo. quam in Donec nisi sed Nam elit. urna. non, dignissim, elit',
      'image': 'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
      'price': 50,
      'rating': 2.0,
    },
    {
      'name': 'Breakfast Food',
      'description':
          'volutpat tincidunt consectetur convallis. Donec Cras massa leo. quam in Donec nisi sed Nam elit. urna. non, dignissim, elit',
      'image': 'https://images.unsplash.com/photo-1490645935967-10de6ba17061',
      'price': 50,
      'rating': 2.0,
    },
    {
      'name': 'Breakfast Food',
      'description':
          'volutpat tincidunt consectetur convallis. Donec Cras massa leo. quam in Donec nisi sed Nam elit. urna. non, dignissim, elit',
      'image': 'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      'price': 50,
      'rating': 2.0,
    },
    {
      'name': 'Breakfast Food',
      'description':
          'volutpat tincidunt consectetur convallis. Donec Cras massa leo. quam in Donec nisi sed Nam elit. urna. non, dignissim, elit',
      'image': 'https://images.unsplash.com/photo-1525351484163-7529414344d8',
      'price': 50,
      'rating': 2.0,
    },
    {
      'name': 'Breakfast Food',
      'description':
          'volutpat tincidunt consectetur convallis. Donec Cras massa leo. quam in Donec nisi sed Nam elit. urna. non, dignissim, elit',
      'image': 'https://images.unsplash.com/photo-1568605114967-8130f3a36994',
      'price': 50,
      'rating': 2.0,
    },
  ];

  void _removeItem(int index) {
    setState(() {
      favoriteItems.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF75070C);
    const bgColor = Color(0xFFFFF8E7);

    return Scaffold(
      backgroundColor: bgColor,
      appBar: AppBar(
        backgroundColor: bgColor,
        elevation: 0,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 28),
          onPressed: () => Navigator.pop(context),
        ),
        title: const Text(
          'YOUR FAVOURITE',
          style: TextStyle(
            color: Colors.black,
            fontWeight: FontWeight.bold,
            fontSize: 18,
            letterSpacing: 1,
          ),
        ),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: const EdgeInsets.all(16),
              itemCount: favoriteItems.length,
              itemBuilder: (context, index) {
                final item = favoriteItems[index];
                return Padding(
                  padding: const EdgeInsets.only(bottom: 16),
                  child: Container(
                    padding: const EdgeInsets.all(16),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFEDAD),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        /// IMAGE
                        ClipRRect(
                          borderRadius: BorderRadius.circular(12),
                          child: Image.network(
                            item['image'],
                            width: 90,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 16),

                        /// CONTENT
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                item['name'],
                                style: const TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.bold,
                                  color: primaryColor,
                                ),
                              ),
                              const SizedBox(height: 8),
                              Text(
                                item['description'],
                                style: TextStyle(
                                  fontSize: 11,
                                  color: primaryColor.withOpacity(0.7),
                                  height: 1.3,
                                ),
                                maxLines: 3,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  Text(
                                    '\$${item['price']}',
                                    style: const TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: primaryColor,
                                    ),
                                  ),
                                  const SizedBox(width: 12),
                                  const Icon(
                                    Icons.star,
                                    color: Colors.orange,
                                    size: 16,
                                  ),
                                  const SizedBox(width: 4),
                                  Text(
                                    '${item['rating']}',
                                    style: const TextStyle(
                                      fontSize: 14,
                                      color: primaryColor,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),

                        /// CLOSE BUTTON
                        GestureDetector(
                          onTap: () => _removeItem(index),
                          child: const Icon(
                            Icons.close,
                            color: primaryColor,
                            size: 24,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
          ),

          /// BOTTOM NAVIGATION BAR
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: const BoxDecoration(
              color: primaryColor,
              borderRadius: BorderRadius.only(
                topLeft: Radius.circular(24),
                topRight: Radius.circular(24),
              ),
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
                _buildNavIcon(Icons.favorite, true),
                GestureDetector(
                  onTap: () {
                    
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => const ProfilePage()),
                    );
                  },
                  child: _buildNavIcon(Icons.person, false),
                ),
              ],
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
