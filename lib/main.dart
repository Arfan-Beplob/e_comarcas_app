import 'package:e_comarcas_app/pages/dashbord.dart';
import 'package:e_comarcas_app/pages/launcher_screen.dart';
import 'package:e_comarcas_app/pages/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';
void main() async{
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
     initialRoute: LauncherScreen.routeName,
      routes: {
        LauncherScreen.routeName : (_)=> const LauncherScreen(),
        LoginScreen.routeName : (_)=> const LoginScreen(),
        DashboardScreen.routeName : (_)=> const DashboardScreen(),
      },
    );
  }
}


