import 'package:flutter/material.dart';

import '../../data/mock_cars.dart';
import '../../models/car.dart';
import '../../services/auth_service.dart';
import '../widgets/car_card.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  void _openCar(BuildContext context, Car car) {
    Navigator.of(context).pushNamed('/car', arguments: car.id);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Katalog Mobil'),
        actions: [
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/orders'),
            tooltip: 'Riwayat',
            icon: const Icon(Icons.history),
          ),
          IconButton(
            onPressed: () => Navigator.of(context).pushNamed('/profile'),
            tooltip: 'Profil',
            icon: const Icon(Icons.person),
          ),
          IconButton(
            onPressed: () {
              AuthService.logout();
              Navigator.of(context).pushReplacementNamed('/login');
            },
            tooltip: 'Logout',
            icon: const Icon(Icons.logout),
          ),
        ],
      ),
      body: SafeArea(
        child: LayoutBuilder(
          builder: (context, constraints) {
            final width = constraints.maxWidth;
            final crossAxisCount = width < 380 ? 1 : 2;

            return Padding(
              padding: const EdgeInsets.all(16),
              child: GridView.builder(
                itemCount: mockCars.length,
                gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: crossAxisCount,
                  crossAxisSpacing: 14,
                  mainAxisSpacing: 14,
                  childAspectRatio: 0.95,
                ),
                itemBuilder: (context, index) {
                  final car = mockCars[index];
                  return CarCard(car: car, onTap: () => _openCar(context, car));
                },
              ),
            );
          },
        ),
      ),
    );
  }
}
