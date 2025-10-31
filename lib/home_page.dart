import 'package:flutter/material.dart';
// import 'package:carousel_slider/carousel_slider.dart';

class RestaurantHomePage extends StatelessWidget {
  const RestaurantHomePage({super.key});

  @override
  Widget build(BuildContext context) {
    const primaryColor = Color(0xFF75070C);
    const lightTint = Color(0xFFF8E4E6); // soft pinkish tint

    final List<String> breakfastImages = [
      'https://images.unsplash.com/photo-1504674900247-0877df9cc836',
      'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
      'https://images.unsplash.com/photo-1512621776951-a57141f2eefd',
    ];

    final List<Map<String, String>> breakfastMenu = [
      {
        'image': 'https://images.unsplash.com/photo-1551218808-94e220e084d2',
        'name': 'Pancakes with Syrup',
        'price': '\$8.50',
      },
      {
        'image': 'https://images.unsplash.com/photo-1589302168068-964664d93dc0',
        'name': 'Scrambled Eggs & Toast',
        'price': '\$6.20',
      },
      {
        'image': 'https://images.unsplash.com/photo-1555939594-58d7cb561ad1',
        'name': 'Fruit Bowl',
        'price': '\$5.80',
      },
    ];

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              /// HEADER
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Row(
                    children: [
                      /// Profile Picture
                      const CircleAvatar(
                        radius: 25,
                        backgroundImage: NetworkImage(
                          'https://images.unsplash.com/photo-1534528741775-53994a69daeb',
                        ),
                      ),
                      const SizedBox(width: 12),

                      /// Welcome Text
                      const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Good Morning,',
                            style: TextStyle(fontSize: 16, color: Colors.grey),
                          ),
                          Text(
                            'Tracy 👋',
                            style: TextStyle(
                              fontSize: 22,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                  /// Notification Icon
                  Container(
                    padding: const EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      color: lightTint,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: const Icon(
                      Icons.notifications_none_rounded,
                      color: primaryColor,
                      size: 28,
                    ),
                  ),
                ],
              ),

              const SizedBox(height: 20),

              /// SEARCH BAR
              Container(
                decoration: BoxDecoration(
                  color: Colors.grey.shade100,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: TextField(
                  decoration: InputDecoration(
                    hintText: 'Search for meals...',
                    prefixIcon: const Icon(Icons.search, color: Colors.grey),
                    border: InputBorder.none,
                    contentPadding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 14,
                    ),
                  ),
                ),
              ),

              const SizedBox(height: 25),
              /// FADE SLIDE SHOW
              _FadeCarousel(images: breakfastImages),


              /// SLIDE SHOW (Carousel)
              // CarouselSlider(
              //   options: CarouselOptions(
              //     height: 160,
              //     autoPlay: true,
              //     enlargeCenterPage: true,
              //     viewportFraction: 0.9,
              //   ),
              //   items: breakfastImages.map((url) {
              //     return ClipRRect(
              //       borderRadius: BorderRadius.circular(16),
              //       child: Image.network(
              //         url,
              //         fit: BoxFit.cover,
              //         width: double.infinity,
              //       ),
              //     );
              //   }).toList(),
              // ),

              const SizedBox(height: 25),

              /// CATEGORY BUTTONS
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  _buildCategoryButton('Breakfast', true),
                  _buildCategoryButton('Lunch', false),
                  _buildCategoryButton('Dinner', false),
                ],
              ),

              const SizedBox(height: 30),

              /// BREAKFAST COLUMN
              const Text(
                'Popular Breakfasts',
                style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
              ),
              const SizedBox(height: 15),

              Column(
                children: breakfastMenu.map((meal) {
                  return Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    elevation: 2,
                    margin: const EdgeInsets.only(bottom: 16),
                    child: Row(
                      children: [
                        ClipRRect(
                          borderRadius: const BorderRadius.only(
                            topLeft: Radius.circular(16),
                            bottomLeft: Radius.circular(16),
                          ),
                          child: Image.network(
                            meal['image']!,
                            width: 100,
                            height: 90,
                            fit: BoxFit.cover,
                          ),
                        ),
                        const SizedBox(width: 15),
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                meal['name']!,
                                style: const TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 5),
                              Text(
                                meal['price']!,
                                style: const TextStyle(
                                  fontSize: 15,
                                  color: primaryColor,
                                ),
                              ),
                            ],
                          ),
                        ),
                        IconButton(
                          icon: const Icon(
                            Icons.add_circle_outline,
                            color: primaryColor,
                          ),
                          onPressed: () {},
                        ),
                      ],
                    ),
                  );
                }).toList(),
              ),
            ],
          ),
        ),
      ),
    );
  }

  /// CATEGORY BUTTON BUILDER
  Widget _buildCategoryButton(String title, bool isSelected) {
    const primaryColor = Color(0xFF75070C);
    const lightTint = Color(0xFFF8E4E6);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      decoration: BoxDecoration(
        color: isSelected ? primaryColor : Colors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: primaryColor),
        boxShadow: [
          if (isSelected)
            BoxShadow(
              color: lightTint,
              blurRadius: 6,
              offset: const Offset(0, 3),
            ),
        ],
      ),
      child: Text(
        title,
        style: TextStyle(
          color: isSelected ? Colors.white : primaryColor,
          fontWeight: FontWeight.w600,
        ),
      ),
    );
  }
}

class _FadeCarousel extends StatefulWidget {
  final List<String> images;
  const _FadeCarousel({required this.images});

  @override
  State<_FadeCarousel> createState() => _FadeCarouselState();
}

class _FadeCarouselState extends State<_FadeCarousel>
    with SingleTickerProviderStateMixin {
  int _currentIndex = 0;
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );
    
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _controller, curve: Curves.easeInOut),
    );

    _startAutoFade();
  }

  void _startAutoFade() async {
    while (mounted) {
      await Future.delayed(const Duration(seconds: 3));
      if (!mounted) return;
      
      setState(() {
        _currentIndex = (_currentIndex + 1) % widget.images.length;
      });
      
      _controller.forward(from: 0.0);
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 160,
      width: double.infinity,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: Stack(
          fit: StackFit.expand,
          children: [
            Image.network(
              widget.images[_currentIndex],
              fit: BoxFit.cover,
            ),
            FadeTransition(
              opacity: _fadeAnimation,
              child: Image.network(
                widget.images[(_currentIndex + 1) % widget.images.length],
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
