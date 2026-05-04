import 'package:flutter/material.dart';

import '../../models/order.dart';
import '../../services/auth_service.dart';
import '../../services/order_service.dart';

class OrdersScreen extends StatelessWidget {
  const OrdersScreen({super.key});

  String _formatDate(DateTime date) {
    final d = date.day.toString().padLeft(2, '0');
    final m = date.month.toString().padLeft(2, '0');
    final y = date.year.toString();
    return '$d/$m/$y';
  }

  String _statusLabel(OrderStatus status) {
    switch (status) {
      case OrderStatus.pending:
        return 'Diproses';
      case OrderStatus.confirmed:
        return 'Terkonfirmasi';
      case OrderStatus.canceled:
        return 'Dibatalkan';
      case OrderStatus.completed:
        return 'Selesai';
    }
  }

  @override
  Widget build(BuildContext context) {
    final orders = OrderService.getOrdersForCurrentUser();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Riwayat Pesanan'),
        actions: [
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
        child: orders.isEmpty
            ? const Center(child: Text('Belum ada pesanan.'))
            : ListView.separated(
                padding: const EdgeInsets.all(16),
                itemCount: orders.length,
                separatorBuilder: (context, index) =>
                    const SizedBox(height: 12),
                itemBuilder: (context, index) {
                  final order = orders[index];
                  final subtitle =
                      '${_formatDate(order.startDate)} - ${_formatDate(order.endDate)}';

                  return Card(
                    child: Padding(
                      padding: const EdgeInsets.all(14),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            order.carNameSnapshot,
                            style: Theme.of(context).textTheme.titleMedium
                                ?.copyWith(fontWeight: FontWeight.w800),
                          ),
                          const SizedBox(height: 6),
                          Text(
                            subtitle,
                            style: Theme.of(context).textTheme.bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context).colorScheme.onSurface
                                      .withValues(alpha: 0.7),
                                ),
                          ),
                          const SizedBox(height: 10),
                          Row(
                            children: [
                              Chip(label: Text(_statusLabel(order.status))),
                              const Spacer(),
                              Text(
                                'Rp ${order.totalPrice.toCurrencyString()}',
                                style: Theme.of(context).textTheme.titleMedium
                                    ?.copyWith(
                                      fontWeight: FontWeight.w900,
                                      color: Theme.of(
                                        context,
                                      ).colorScheme.primary,
                                    ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
      ),
    );
  }
}

extension _CurrencyExt on int {
  String toCurrencyString() {
    final s = toString();
    final buffer = StringBuffer();
    for (var i = 0; i < s.length; i++) {
      final idxFromEnd = s.length - i;
      buffer.write(s[i]);
      if (idxFromEnd > 1 && idxFromEnd % 3 == 1) buffer.write('.');
    }
    return buffer.toString();
  }
}
