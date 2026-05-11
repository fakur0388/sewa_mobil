import 'package:flutter/material.dart';

import 'services/auth_service.dart';
import 'ui/screens/car_detail_screen.dart';
import 'ui/screens/checkout_screen.dart';
import 'ui/screens/home_screen.dart';
import 'ui/screens/login_screen.dart';
import 'ui/screens/orders_screen.dart';
import 'ui/screens/profile_screen.dart';
import 'ui/screens/register_screen.dart';
import 'ui/screens/welcome_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final initialRoute = AuthService.currentUserName != null ? '/home' : '/';

    return MaterialApp(
      title: 'Sewa Mobil',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      initialRoute: initialRoute,
      routes: {
        '/': (_) => const WelcomeScreen(),
        '/login': (_) => const LoginScreen(),
        '/register': (_) => const RegisterScreen(),
        '/home': (_) => const HomeScreen(),
        '/car': (_) => const CarDetailScreen(),
        '/checkout': (_) => const CheckoutScreen(),
        '/orders': (_) => const OrdersScreen(),
        '/profile': (_) => const ProfileScreen(),
      },
      onUnknownRoute: (settings) {
        return MaterialPageRoute(
          builder: (_) => const Scaffold(
            body: Center(child: Text('Halaman tidak ditemukan.')),
          ),
        );
      },
    );
  }
}
