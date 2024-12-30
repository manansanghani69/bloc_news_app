import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:mobile_frist_task/pages/home_page.dart';

class SplashPage extends StatefulWidget {
  const SplashPage({super.key});

  @override
  State<SplashPage> createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      Future.delayed(const Duration(seconds: 3), () {
        Navigator.pushReplacement(
            context,
            MaterialPageRoute(
                builder: (BuildContext context) => const HomePage()));
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Lottie.network(
          'https://lottie.host/22cb8e7f-1115-4db0-8622-27e04bfab02f/7RvfM631lb.json',
          repeat: false,
          errorBuilder: (context, error, stackTrace) {
            print("failed to load animation");
            return Text("data");
          },
        ),
      ),
    );
  }
}
