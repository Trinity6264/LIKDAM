import 'package:bloc_practice/navigation/nav.dart';
import 'package:bloc_practice/routes/router.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Likdam',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      navigatorKey: navigationKey,
      scaffoldMessengerKey: scaffolKey,
      initialRoute: Routers.authScreen,
      onGenerateRoute: Routers.onGenerateRoutes,
    );
  }
}
