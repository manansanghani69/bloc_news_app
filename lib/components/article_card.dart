import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_frist_task/core/theme_colors.dart';
import 'package:mobile_frist_task/pages/article_page.dart';

import '../data/models/article_model.dart';

class ArticleCard extends StatelessWidget {
  const ArticleCard({
    super.key,
    required this.article,
    required this.index,
  });
  final ArticleModel article;
  final int index;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) =>
                    ArticlePage(article: article)));
      },
      child: article.title == "[Removed]"
          ? Container()
          : Container(
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 7),
              decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: AppPallet.cardColor[index % 4],
              ),
              child: Text(
                article.title ?? "",
                style: GoogleFonts.bebasNeue(
                  fontSize: 20,
                  color: (index % 4) < 2 ? Colors.white : Colors.black,
                ),
              ),
            ),
    );
  }
}
