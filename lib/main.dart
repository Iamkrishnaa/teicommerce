import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import 'package:get/get.dart';
import 'package:khalti_flutter/khalti_flutter.dart';
import 'app/routes/app_pages.dart';

void main() {
  /*
  KhaltiScope(
  publicKey: <public-key>,
  builder: (context, navigatorKey) {
    return MaterialApp(
      navigatorKey: navigatorKey,
      supportedLocales: const [
        Locale('en', 'US'),
        Locale('ne', 'NP'),
      ],
      localizationsDelegates: const [
        KhaltiLocalizations.delegate,
        ...
      ],
      ...
    );  
  } 
);
  */
  runApp(
    KhaltiScope(
      publicKey: 'test_public_key_78e3f26a5e9343af96329d3ad21a058b',
      builder: (context, naviKey) {
        return GetMaterialApp(
          title: "Teicommerce",
          initialRoute: AppPages.INITIAL,
          getPages: AppPages.routes,
          debugShowCheckedModeBanner: false,
          navigatorKey: naviKey,
          supportedLocales: const [
            Locale('en', 'US'),
            Locale('ne', 'NP'),
          ],
          localizationsDelegates: const [
            KhaltiLocalizations.delegate,
          ],
        );
      },
    ),
  );

  SystemChrome.setSystemUIOverlayStyle(
    const SystemUiOverlayStyle(
      statusBarColor: Colors.transparent,
    ),
  );

  SystemChrome.setPreferredOrientations(
    [
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ],
  );
}
