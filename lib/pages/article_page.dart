import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_frist_task/core/theme_colors.dart';
import 'package:mobile_frist_task/data/models/article_model.dart';
import 'package:url_launcher/url_launcher.dart';

class ArticlePage extends StatefulWidget {
  const ArticlePage({super.key, required this.article});
  final ArticleModel article;

  @override
  State<ArticlePage> createState() => _ArticlePageState();
}

class _ArticlePageState extends State<ArticlePage> {
  Future<void> _launchUrl(String url) async {
    print("clicked");
    if (await canLaunchUrl(Uri.parse(url))) {
      await launchUrl(Uri.parse(url));
    } else {
      throw 'Could not launch $url';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.blogBackgroundColor,
      appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            color: Colors.black,
            icon: const Icon(
              Icons.arrow_back_ios_new_outlined,
              size: 20,
            ),
          )),
      body: Scrollbar(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.article.title ?? "",
                  style: GoogleFonts.bebasNeue(
                    textStyle: const TextStyle(
                      fontSize: 30,
                      color: Colors.black,
                      wordSpacing: 1,
                    ),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                Text(
                  "By ${widget.article.author}",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 15,
                      color: Colors.black,
                      wordSpacing: 1,
                      letterSpacing: 1,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
                Text(
                  widget.article.source?.name ?? "",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontWeight: FontWeight.w500,
                      color: AppPallet.fontColor2,
                      fontSize: 12,
                      letterSpacing: 1,
                    ),
                  ),
                ),
                const SizedBox(height: 20),
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.network(widget.article.urlToImage ?? ""),
                ),
                const SizedBox(height: 20),
                Text(
                  widget.article.description ?? "",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.justify,
                ),
                Text(
                  widget.article.content ?? "",
                  style: GoogleFonts.montserrat(
                    textStyle: const TextStyle(
                      fontSize: 16,
                      color: Colors.black,
                    ),
                  ),
                  textAlign: TextAlign.justify,
                ),
                const SizedBox(height: 20),
                widget.article.url != null
                    ? GestureDetector(
                        onTap: () {
                          _launchUrl(widget.article.url!);
                        },
                        child: Text(
                          "read full article",
                          style: GoogleFonts.montserrat(),
                        ),
                      )
                    : Container(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
