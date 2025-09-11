import 'package:flutter/material.dart';
import 'package:newsnow/views/widgets/news_card.dart';
import 'package:newsnow/views/widgets/news_horiontal_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // App name
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text(
                      'News',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                        color: Colors.blueAccent,
                      ),
                    ),
                    Text(
                      'Now',
                      style: TextStyle(
                        fontSize: 22,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20),

                const Text(
                  'Hottest News',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10),

                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(children: [
                    NewsCard(),
                    NewsCard(),
                    NewsCard(),
                  ]),
                ),

                const SizedBox(height: 20),

                const Text(
                  'Hottest News',
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
                NewsHorizontalCard(),
                NewsHorizontalCard(),
                NewsHorizontalCard(),
                NewsHorizontalCard(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
