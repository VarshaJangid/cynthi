import 'package:flutter_localizations/flutter_localizations.dart';
import '/ui/component/dismiss_keyboard.dart';
import 'package:flutter/services.dart';
import 'package:flutter/material.dart';
import '/utils/theme_color.dart';
import '/ui/splash/splash.dart';
import '/generated/l10n.dart';

void main() {
  SystemChrome.setSystemUIOverlayStyle(
    SystemUiOverlayStyle(
      systemNavigationBarColor: const AppColor.getColor().theme,
      statusBarColor: const AppColor.getColor().theme,
    ),
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return DismissKeyboard(
      child: MaterialApp(
        title: Strings.of(context).cynthians,
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SplashScreen(),
        localizationsDelegates: const [
          Strings.delegate,
          GlobalMaterialLocalizations.delegate,
        ],
        supportedLocales: Strings.delegate.supportedLocales,
      ),
    );
  }
}
