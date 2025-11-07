import 'package:flutter/material.dart';
import 'package:tee/main.dart';
import 'favorite.dart';
// import 'home_page.dart';
import 'profile.dart';

class CartPage extends StatefulWidget {
  const CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}

class _CartPageState extends State<CartPage> {
  int breakfastQuantity = 1;
  int lunchQuantity = 1;
  String selectedPayment = 'cash'; // 'cash' or 'transfer'

  final double breakfastPrice = 50.0;
  final double lunchPrice = 50.0;
  final double deliveryFee = 20.0;

  double get price =>
      (breakfastPrice * breakfastQuantity) + (lunchPrice * lunchQuantity);
  double get totalPrice => price + deliveryFee;

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
          'YOUR CART',
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
            child: SingleChildScrollView(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  /// BREAKFAST ITEM
                  _buildCartItem(
                    'Breakfast Food',
                    'volutpat tincidunt consectetur convallis. Donec Cras massa leo. quam in Donec nisi sed Nam elit. urna. non, dignissim, elit',
                    'https://images.unsplash.com/photo-1490645935967-10de6ba17061',
                    breakfastPrice,
                    breakfastQuantity,
                    (newQty) => setState(() => breakfastQuantity = newQty),
                    showClose: false,
                  ),

                  const SizedBox(height: 16),

                  /// LUNCH ITEM
                  _buildCartItem(
                    'Lunch Food',
                    'volutpat tincidunt consectetur convallis. Donec Cras massa leo. quam in Donec nisi sed Nam elit. urna. non, dignissim, elit',
                    'https://images.unsplash.com/photo-1546069901-ba9599a7e63c',
                    lunchPrice,
                    lunchQuantity,
                    (newQty) => setState(() => lunchQuantity = newQty),
                    showClose: true,
                  ),

                  const SizedBox(height: 30),

                  /// PRICE
                  _buildPriceRow('Price', '\$${price.toStringAsFixed(0)}'),
                  const SizedBox(height: 16),
                  _buildPriceRow(
                    'Delivery',
                    '\$${deliveryFee.toStringAsFixed(0)}',
                  ),

                  const SizedBox(height: 30),

                  /// PAYMENT SECTION
                  Container(
                    padding: const EdgeInsets.all(20),
                    decoration: BoxDecoration(
                      color: const Color(0xFFFFCA39),
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Payment',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                            color: primaryColor,
                          ),
                        ),
                        const SizedBox(height: 20),

                        /// Cash on Delivery
                        _buildPaymentOption('Cash On\nDelivery', 'cash'),

                        const SizedBox(height: 16),

                        /// Pay with Transfer
                        _buildPaymentOption('Pay with\nTransfer', 'transfer'),
                      ],
                    ),
                  ),

                  const SizedBox(height: 30),

                  /// TOTAL AND ORDER BUTTON
                  Row(
                    children: [
                      /// TOTAL PRICE
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Total Price',
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            '\$${totalPrice.toStringAsFixed(2)}',
                            style: const TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                              color: primaryColor,
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(width: 20),

                      /// ORDER NOW BUTTON
                      Expanded(
                        child: SizedBox(
                          height: 65,
                          child: ElevatedButton(
                            onPressed: () {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(
                                  content: Text('Order placed successfully!'),
                                ),
                              );
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: primaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              'Order Now',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 20),
                ],
              ),
            ),
          ),

          /// BOTTOM NAVIGATION BAR
          Container(
            padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 20),
            decoration: const BoxDecoration(
              color: primaryColor,
             
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                // 🏠 Home Icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => HomePage()),
                    );
                  },
                  child: _buildNavIcon(Icons.home, false),
                ),

                // 🛒 Cart Icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => CartPage()),
                    );
                  },
                  child: _buildNavIcon(Icons.shopping_cart, true),
                ),

                // ❤️ Favorites Icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => FavoritesPage()),
                    );
                  },
                  child: _buildNavIcon(Icons.favorite, false),
                ),

                // 👤 Profile Icon
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ProfilePage()),
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

  Widget _buildCartItem(
    String name,
    String description,
    String imageUrl,
    double price,
    int quantity,
    Function(int) onQuantityChanged, {
    bool showClose = false,
  }) {
    const primaryColor = Color(0xFF75070C);

    return Container(
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFFFEDAD),
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          /// QUANTITY CONTROLS
          Column(
            children: [
              GestureDetector(
                onTap: () => onQuantityChanged(quantity + 1),
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(Icons.add, size: 20, color: primaryColor),
                ),
              ),
              const SizedBox(height: 12),
              Text(
                '$quantity',
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: primaryColor,
                ),
              ),
              const SizedBox(height: 12),
              GestureDetector(
                onTap: () {
                  if (quantity > 1) onQuantityChanged(quantity - 1);
                },
                child: Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(8),
                  ),
                  child: const Icon(
                    Icons.remove,
                    size: 20,
                    color: primaryColor,
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(width: 16),

          /// IMAGE
          ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.network(
              imageUrl,
              width: 90,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),

          const SizedBox(width: 16),

          /// NAME, DESCRIPTION AND PRICE
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  name,
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 8),
                Text(
                  description,
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
                      '\$${price.toStringAsFixed(0)}',
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: primaryColor,
                      ),
                    ),
                    const SizedBox(width: 12),
                    const Icon(Icons.star, color: Colors.orange, size: 16),
                    const SizedBox(width: 4),
                    const Text(
                      '2.0',
                      style: TextStyle(fontSize: 14, color: primaryColor),
                    ),
                  ],
                ),
              ],
            ),
          ),

          /// CLOSE ICON
          if (showClose)
            GestureDetector(
              onTap: () {
                // Handle remove item
              },
              child: const Icon(Icons.close, color: primaryColor, size: 24),
            ),
        ],
      ),
    );
  }

  Widget _buildPriceRow(String label, String amount) {
    const primaryColor = Color(0xFF75070C);

    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
        Text(
          amount,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: primaryColor,
          ),
        ),
      ],
    );
  }

  Widget _buildPaymentOption(String text, String value) {
    const primaryColor = Color(0xFF75070C);
    final isSelected = selectedPayment == value;

    return GestureDetector(
      onTap: () => setState(() => selectedPayment = value),
      child: Container(
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          color: const Color(0xFFFFEDAD),
          borderRadius: BorderRadius.circular(16),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              text,
              style: const TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.bold,
                color: primaryColor,
                height: 1.2,
              ),
            ),
            Container(
              width: 32,
              height: 32,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(8),
              ),
              child: isSelected
                  ? const Icon(Icons.check, color: primaryColor, size: 20)
                  : null,
            ),
          ],
        ),
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
