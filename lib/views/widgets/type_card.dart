import 'package:flutter/material.dart';

class TypeCard extends StatelessWidget {
  final String image;
  final String categoryName;

  const TypeCard({super.key, required this.image, required this.categoryName});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Image.asset(
            image,
            fit: BoxFit.cover,
          ),
          Container(
            color: Colors.black26, // overlay
            alignment: Alignment.center,
            child: Text(
              categoryName,
              style: const TextStyle(
                color: Colors.white,
                fontSize: 16,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
