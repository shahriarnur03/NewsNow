import 'package:flutter/material.dart';

class NewsHorizontalCard extends StatelessWidget {
  const NewsHorizontalCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              'https://images.unsplash.com/photo-1542810634-71277d95dcbb?q=80&w=800',
              width: 72,
              height:90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),
    
          // Right: content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Europe',
                  style: TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                const Text(
                  "Ukraine's President Zelensky to BBC",
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
    
                Row(
                  children: [
                    Text('BBC news', style: TextStyle(fontSize: 10,fontWeight: FontWeight.bold),),
                    SizedBox(width: 15,),
                    Icon(Icons.timer_outlined, size: 15,),
                    SizedBox(width: 3,),
                    Text('12.30PM', style: TextStyle(fontSize: 10),),
                  ],
                )
                
              ],
            ),
          ),
        ],
      ),
    );
  }
}
