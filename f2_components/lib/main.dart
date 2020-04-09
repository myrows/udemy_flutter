import 'package:flutter/material.dart';

import 'package:f2_components/src/pages/routes/routes.dart';
import 'package:flutter_localizations/flutter_localizations.dart';





void main() => runApp(MyApp());
 
class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      localizationsDelegates: [
        // ... app-specific localization delegate[s] here
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
      ],
      supportedLocales: [
        const Locale('en'), // English
        const Locale('es'),
        const Locale.fromSubtags(languageCode: 'zh'), // Chinese *See Advanced Locales below*
        // ... other locales the app supports
      ],
      title: 'Componentes App',
      debugShowCheckedModeBanner: false,
      //  home: HomePage(),
      initialRoute: '/',
      routes: getApplicationRoutes(),
    );
  }
}