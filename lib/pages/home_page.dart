import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:mobile_frist_task/bloc/news_bloc.dart';
import 'package:mobile_frist_task/bloc/news_state.dart';
import 'package:mobile_frist_task/components/article_card.dart';
import 'package:mobile_frist_task/core/theme_colors.dart';

import '../data/models/article_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppPallet.backgroundColor,
      appBar: AppBar(
        title: Text(
          "NEWS",
          style: GoogleFonts.aBeeZee(
            fontWeight: FontWeight.w600,
            fontSize: 30,
            letterSpacing: 4,
            color: Colors.white,
          ),
        ),
        elevation: 0,
        // shadowColor: Colors.black,
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(horizontal: 10),
        padding: const EdgeInsets.symmetric(horizontal: 10),
        child: BlocBuilder<NewsBloc, NewsStates>(
          builder: (BuildContext context, NewsStates state) {
            if (state is NewsLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NewsErrorState) {
              String error = state.errorMessage;

              return Center(child: Text(error));
            } else if (state is NewsLoadedState) {
              List<ArticleModel> articleList = [];
              articleList = state.articleList;
              return ListView.builder(
                  itemCount: articleList.length,
                  itemBuilder: (context, index) {
                    return ArticleCard(
                      article: articleList[index],
                      index: index,
                    );
                  });
            } else {
              return const Center(
                  child: CircularProgressIndicator(
                backgroundColor: Colors.green,
              ));
            }
          },
        ),
      ),
    );
  }
}
