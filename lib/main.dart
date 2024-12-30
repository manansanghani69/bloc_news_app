import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_frist_task/data/repositories/article_repository.dart';
import 'package:mobile_frist_task/pages/splash_page.dart';

import 'bloc/news_bloc.dart';
import 'bloc/news_state.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<NewsBloc>(
          create: (context) => NewsBloc(
            initialState: NewsInitState(),
            articleRepository: ArticleRepository(),
          ),
        )
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        theme: ThemeData(
          scaffoldBackgroundColor: Colors.white,
          appBarTheme: const AppBarTheme(
            color: Colors.transparent,
            // foregroundColor: Colors.white,
          ),
        ),
        home: const SplashPage(),
      ),
    );
  }
}
