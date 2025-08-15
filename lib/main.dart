import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:yachay_kawsay/screens/splash_screen.dart';
import 'package:yachay_kawsay/theme/app_theme.dart';
import 'package:yachay_kawsay/providers/language_provider.dart';
import 'package:yachay_kawsay/providers/theme_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const YachayKawsayApp());
}

class YachayKawsayApp extends StatelessWidget {
  const YachayKawsayApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LanguageProvider()),
        ChangeNotifierProvider(create: (_) => ThemeProvider()),
      ],
      child: Consumer2<LanguageProvider, ThemeProvider>(
        builder: (context, languageProvider, themeProvider, child) {
          return MaterialApp(
            title: 'YachayKawsay',
            debugShowCheckedModeBanner: false,
            theme: AppTheme.lightTheme,
            darkTheme: AppTheme.darkTheme,
            themeMode: themeProvider.isDarkMode ? ThemeMode.dark : ThemeMode.light,
            locale: languageProvider.currentLocale,
            supportedLocales: const [
              Locale('es', 'ES'),
              Locale('qu', 'EC'),
            ],
            home: const SplashScreen(),
          );
        },
      ),
    );
  }
}
