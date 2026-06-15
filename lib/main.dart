import 'package:amwali/core/depandency_injection/service_locator.dart';
import 'package:amwali/core/local_database/isar_service.dart';
import 'package:amwali/core/routing/app_routes.dart';
import 'package:amwali/core/routing/route_generator.dart';
import 'package:amwali/core/theme/app_theme.dart';
import 'package:amwali/features/transactions/presentation/manager/cubit/transactions_cubit.dart';
import 'package:amwali/generated/l10n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  final isarService = IsarService();
  await isarService.isarInit();

  setupServiceLocator(isarService.db);
  runApp(const Amwali());
}

class Amwali extends StatelessWidget {
  const Amwali({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => getIt.get<TransactionsCubit>()..fetchAllFinanceData(),
      child: MaterialApp(
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
      ),
    );
  }
}
