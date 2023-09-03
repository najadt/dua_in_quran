import 'package:dua_in_quran/dua_page.dart';
import 'package:flutter/material.dart';
import 'dart:async';

late Timer _timer;
int _start = 4;

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  void startTimer() {
    _start = 4;
    const oneSec = Duration(seconds: 1);
    
    _timer =  Timer.periodic(oneSec, (Timer timer) {
      if (_start < 1) {
        _start = 4;
        Navigator.pushReplacement(context,
            MaterialPageRoute(builder: (BuildContext context) => const DuaPage()));
      } else {
        _start = _start - 1;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    startTimer();
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          color: Colors.teal,
          image: DecorationImage(
            image: AssetImage("assets/dua_app_splash.png"),
            fit: BoxFit.fitWidth,
          ),
        ),
        child: const Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(flex: 2, child: SizedBox()),
            Text(
              'وَقَالَ رَبُّكُمُ ٱدْعُونِىٓ أَسْتَجِبْ لَكُمْ',
              textAlign: TextAlign.center,
              style: TextStyle(
                  shadows: <Shadow>[
                    Shadow(
                      offset: Offset(-4.0, 4.0),
                      blurRadius: 5.0,
                      color: Color.fromARGB(255, 0, 0, 0),
                    ),
                  ],
                  fontSize: 50,
                  fontWeight: FontWeight.bold,
                  color: Colors.amber),
              textDirection: TextDirection.rtl,
            ),
            Text(
              'നിങ്ങളുടെ രക്ഷിതാവ് പറഞ്ഞിരിക്കുന്നു: നിങ്ങള്‍ എന്നോട് പ്രാര്‍ത്ഥിക്കൂ. ഞാന്‍ നിങ്ങള്‍ക്ക് ഉത്തരം നല്‍കാം.',
              style: TextStyle(
                height: 1.5,
                fontSize: 20,
                color: Colors.white70,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            Expanded(
              flex: 1,
              child: SizedBox(),
            ),
            LinearProgressIndicator(
              color: Colors.amber,
            ),
          ],
        ),
      ),
    );
  }
}
