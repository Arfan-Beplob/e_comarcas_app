import 'package:e_comarcas_app/auth/auth_service.dart';
import 'package:e_comarcas_app/pages/login_screen.dart';
import 'package:flutter/material.dart';

class DashboardScreen extends StatefulWidget {
  static const String routeName = '/dashboard';

  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              color: Colors.teal,
              height: 150,
            ),
            ListTile(
              onTap: _logOut,
              title: const Text('LogOut'),
             trailing: const           Icon(Icons.logout),
            )
          ],
        ),
      ),
      backgroundColor: Colors.indigo,
      appBar: AppBar(
        centerTitle: true,
        title: const Text('Dashboard screen'),
      ),
    );
  }

  void _logOut() {
    AuthService.logout();
    Navigator.pushReplacementNamed(context, LoginScreen.routeName);
  }
}
