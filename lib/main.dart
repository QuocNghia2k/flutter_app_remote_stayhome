// import 'package:device_preview/device_preview.dart';
import 'package:device_preview/device_preview.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_remote_stayhome/l10n/l10n.dart';
import 'package:flutter_app_remote_stayhome/providers/user_provider.dart';
import 'package:flutter_app_remote_stayhome/screens/login_screen.dart';
import 'package:flutter_app_remote_stayhome/widgets/userPage/splash_screen.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:provider/provider.dart';
import 'firebase_options.dart';

void main() async {
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(DevicePreview(builder: (context) => const MyApp(), enabled: true));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      useInheritedMediaQuery: true,
      locale: DevicePreview.locale(context),
      builder: DevicePreview.appBuilder,
      themeMode: ThemeMode.system,
      debugShowCheckedModeBanner: false,
      localizationsDelegates: const [
        AppLocalizations.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: L10n.all,
      theme: ThemeData(primarySwatch: Colors.blue, fontFamily: 'Poppins'),
      home: MultiProvider(
          providers: [
            ChangeNotifierProvider(
              create: (context) => UserProvider(),
            )
          ],
          // builder: (context, child) => re,
          child: SplashScreen()),
    );
  }
}
