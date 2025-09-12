import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:newsnow/models/article_model.dart';

class NewsHorizontalCard extends StatelessWidget {
  final ArticleModel article;
  const NewsHorizontalCard({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final publishedAt = DateTime.parse(article.publishedAt!);
    final formattedDate = DateFormat('MMM d, yyyy').format(publishedAt);
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.network(
              article.imageUrl!,
              width: 72,
              height: 90,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(width: 12),

          // Right: content
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.sourceName!,
                  style: const TextStyle(fontSize: 12, color: Colors.grey),
                ),
                const SizedBox(height: 4),
                Text(
                  article.title!,
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                      fontSize: 14, fontWeight: FontWeight.w700),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Text(
                      article.author ?? '',
                      style: const TextStyle(
                          fontSize: 10, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      width: 15,
                    ),
                    const Icon(
                      Icons.timer_outlined,
                      size: 15,
                    ),
                    const SizedBox(
                      width: 3,
                    ),
                    Text(
                      formattedDate,
                      style: const TextStyle(fontSize: 10),
                    ),
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
