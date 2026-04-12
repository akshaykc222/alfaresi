import 'dart:math';

import 'package:alfaresi/config/themes/app_theme.dart';
import 'package:alfaresi/l10n/l10n.dart';
import 'package:alfaresi/l10n/local_provider.dart';
import 'package:alfaresi/routes/router.dart';
// import 'package:device_preview/device_preview.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:scaled_app/scaled_app.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

void main() async {
  ScaledWidgetsFlutterBinding.ensureInitialized(
    scaleFactor: _calculateScaleFactor,
  );
  WidgetsFlutterBinding.ensureInitialized();

  await Supabase.initialize(
    url: 'https://zcsrlmhdmmxmmdhrvmlv.supabase.co',
    anonKey:
        'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6Inpjc3JsbWhkbW14bW1kaHJ2bWx2Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3NjMyNjU3ODMsImV4cCI6MjA3ODg0MTc4M30.Oh7DEy0SUoWGkg9IdiVK_8M51iNGS_3Ovjz8fjIFsgU',
  );

  runApp(
    // DevicePreview(
    //   builder:
    //       (context) => ChangeNotifierProvider(
    //         create: (_) => LocaleProvider(),
    //         child: const MyApp(),
    //       ),
    // ),
    ChangeNotifierProvider(
      create: (context) => LocaleProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final localeProvider = Provider.of<LocaleProvider>(context);

    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      title: 'Alfaresi',
      theme: ThemeConfig.light(localeProvider.locale),
      supportedLocales: L10n.all,
      localizationsDelegates: L10n.localizationsDelegates,
      locale: localeProvider.locale,
      routerConfig: router,
    );
  }
}

double _calculateScaleFactor(Size size) {
  const double designWidth = 390;
  const double designHeight = 899;

  final widthScale = size.width / designWidth;
  final heightScale = size.height / designHeight;

  return min(widthScale, heightScale);
}
