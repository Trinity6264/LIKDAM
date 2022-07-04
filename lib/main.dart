import 'package:bloc_practice/logic/auth/login/cubit/login_cubit.dart';
import 'package:bloc_practice/logic/auth/new_account/cubit/create_new_user_cubit.dart';
import 'package:bloc_practice/logic/cubit/custome_theme_state_cubit.dart';
import 'package:bloc_practice/logic/date/end/cubit/end_date_cubit.dart';
import 'package:bloc_practice/logic/date/start/cubit/startdate_cubit.dart';
import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:bloc_practice/service/0b_service.dart';
import 'package:bloc_practice/locator/service_locator.dart';
import 'package:bloc_practice/theme/custom_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'service/shared_prefs.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([DeviceOrientation.portraitUp]);
  setup();
  await locator.get<SharedPrefs>().initShared();
  await locator.get<ObService>().openStore();
  runApp(
    MultiBlocProvider(
      providers: [
        BlocProvider<CustomeThemeStateCubit>(
          create: (context) => CustomeThemeStateCubit(),
        ),
        BlocProvider<CreateNewUserCubit>(
          create: (context) => CreateNewUserCubit(),
        ),
        BlocProvider<LoginCubit>(
          create: (context) => LoginCubit(),
        ),
        BlocProvider<StartdateCubit>(
          create: (context) => StartdateCubit(),
        ),
        BlocProvider<EndDateCubit>(
          create: (context) => EndDateCubit(),
        ),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static final _locatorTheme = locator.get<CustomTheme>();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Likdam',
      themeMode:
          context.watch<CustomeThemeStateCubit>().state is CustomeThemeStateDay
              ? ThemeMode.light
              : ThemeMode.dark,
      theme: _locatorTheme.lightTheme,
      darkTheme: _locatorTheme.darkTheme,
      navigatorKey: navigationKey,
      scaffoldMessengerKey: scaffolKey,
      initialRoute: Routers.splashScreen,
      onGenerateRoute: Routers.onGenerateRoutes,
    );
  }
}
