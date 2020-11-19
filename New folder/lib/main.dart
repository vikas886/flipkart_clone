import 'package:easy_localization/easy_localization.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flipkart_clone/screens/camerademo.dart';
import 'package:flipkart_clone/screens/homescreen.dart';
import 'package:flipkart_clone/screens/splashscreen.dart';
import 'package:flipkart_clone/utils/constants.dart';
import 'package:flipkart_clone/utils/i18N.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  Firebase.initializeApp();
  runApp(
      EasyLocalization(
        child: MyApp(),
        fallbackLocale: Locale('en', 'US'),
        supportedLocales: [Locale('en', 'US'), Locale('hi', 'IN')],
        path: 'assets/translations'
        ),
    );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: context.localizationDelegates,
      supportedLocales: context.supportedLocales,
      locale: context.locale,
      title: 'Flipkart Clone',
      theme: ThemeData(
        backgroundColor: Colors.white,
        appBarTheme: AppBarTheme(
          color: Color(Constants.FLIPKART_BLUE),
          elevation: 5,
        ),
      ),
      debugShowCheckedModeBanner: false,
      // home:CameraDemo() ,
      routes: <String, WidgetBuilder>{      
        Constants.ROOT_ROUTE: (BuildContext context) => SplashScreen(),
        Constants.HOME_ROUTE: (BuildContext context) => HomeScreen(2),
      },
    );
  }
}
