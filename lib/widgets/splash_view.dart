import 'package:flutter/cupertino.dart';

class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<StatefulWidget> createState() => _SplashView();
}

class _SplashView extends State<SplashView> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Padding(
        padding: const EdgeInsets.fromLTRB(20, 50, 20, 20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(children: [
                Image.asset(
                  'assets/images/logo.png',
                ),
                const Text(
                  'Charging Into \n The Future',
                  style: TextStyle(
                      fontFamily: 'PoiretOne',
                      fontWeight: FontWeight.w700,
                      fontSize: 30),
                ),
              ]),
            ),
            const Align(
              alignment: Alignment.bottomCenter,
              child: Text('1.0.0 version'),
            ),
          ],
        ),
      ),
    );
  }
}
