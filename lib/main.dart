import 'package:amwali/core/routing/app_routes.dart';
import 'package:amwali/core/routing/route_generator.dart';
import 'package:amwali/core/theme/app_theme.dart';
import 'package:amwali/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() {
  runApp(const Amwali());
}

class Amwali extends StatelessWidget {
  const Amwali({super.key});

  @override
  Widget build(BuildContext context) {
            return MaterialApp(
              title: 'Amwali',
              theme: AppTheme.mainTheme,
              onGenerateRoute: RouteGenerator.onGenerateRoute,
              initialRoute: AppRoutes.splashView,
              debugShowCheckedModeBanner: false,
              localizationsDelegates: const [
                S.delegate,
                GlobalMaterialLocalizations.delegate,
                GlobalWidgetsLocalizations.delegate,
                GlobalCupertinoLocalizations.delegate,
              ],
              supportedLocales: S.delegate.supportedLocales,
               locale: const Locale('ar'),
            );
          
  }
}
