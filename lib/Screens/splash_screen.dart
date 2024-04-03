import 'package:flutter/material.dart';
import 'package:intern/ProviderStuff/provider.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  ProviderClass providerClass = ProviderClass();

  @override
  void initState() {
    providerClass.splashscreenn(context);
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Center(
      child: Container(
        alignment: Alignment.center,
        width: 250,
        height: 60,
        child: Row(
          children: [
            Text(
              'Inter',
              style:
                  TextStyle(fontSize: 40, color: Colors.blue, letterSpacing: 2),
            ),
            Text(
              'Shala',
              style: TextStyle(fontSize: 40, color: Colors.grey),
            ),
          ],
        ),
      ),
    ));
  }
}
