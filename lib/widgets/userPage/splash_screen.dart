import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/screens/login_screen.dart';
import 'package:flutter_app_remote_stayhome/widgets/userPage/logo.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  late AnimationController animation;
  late final Animation<double> _animation = CurvedAnimation(
    parent: animation,
    curve: Curves.fastOutSlowIn,
  );
  @override
  void initState() {
    animation = AnimationController(
        vsync: this, duration: const Duration(seconds: 5), value: 0)
      ..forward();

    animation.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => LoginScreen(),
            )).then((value) => animation.reset());
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    animation.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SafeArea(
        child: Container(
          decoration: const BoxDecoration(
              color: Color(0xFFFFFFFF),
              image: DecorationImage(
                  image: AssetImage('assets/images/primaryBg.png'),
                  fit: BoxFit.cover)),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
            AnimatedBuilder(
              animation: animation,
              builder: (context, child) {
                return ScaleTransition(
                  scale: _animation,
                  child: Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: const [
                        Logo(),
                        
                      ],
                    ),
                  ),
                );
              },
            ),
            SizedBox(height: 100,),
            CircularProgressIndicator(
              color: Color.fromARGB(31, 51, 51, 51),
            )
          ]),
        ),
      ),
    );
  }
}
