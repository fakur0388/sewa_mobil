import '../data/mock_cars.dart';
import '../models/car.dart';
import '../models/order.dart';
import 'auth_service.dart';

class OrderService {
  OrderService._();

  static final List<Order> _orders = [];

  static List<Order> getOrdersForCurrentUser() {
    final currentName = AuthService.currentUserName;
    if (currentName == null) return [];

    return _orders.where((o) => o.customerName == currentName).toList();
  }

  static Order createOrder({
    required String carId,
    required DateTime startDate,
    required DateTime endDate,
    required String customerName,
    required String customerPhone,
    required int totalPrice,
  }) {
    final car = mockCars.firstWhere((c) => c.id == carId);

    final order = Order(
      id: DateTime.now().microsecondsSinceEpoch.toString(),
      carId: car.id,
      carNameSnapshot: car.name,
      startDate: startDate,
      endDate: endDate,
      customerName: customerName,
      customerPhone: customerPhone,
      totalPrice: totalPrice,
      status: OrderStatus.pending,
    );

    _orders.insert(0, order);
    return order;
  }

  static int computeTotalPrice({
    required Car car,
    required DateTime startDate,
    required DateTime endDate,
  }) {
    final diffDays = endDate.difference(startDate).inDays;
    final days = diffDays <= 0 ? 1 : diffDays;
    return car.pricePerDay * days;
  }
}
