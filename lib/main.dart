import 'package:bmi/pages/BmiPage.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
          [DeviceOrientation.portraitUp, DeviceOrientation.portraitDown])
      .then((_) => runApp(MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData.dark().copyWith(
              primaryColor: Color(0xff0a0e21),
              scaffoldBackgroundColor: Color(0xff0a0e21),
            ),
            routes: {
              '/': (context) => BmiPage(),
            },
          )));
}
