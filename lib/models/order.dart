enum OrderStatus { pending, confirmed, canceled, completed }

class Order {
  final String id;
  final String carId;
  final String carNameSnapshot;
  final DateTime startDate;
  final DateTime endDate;
  final String customerName;
  final String customerPhone;
  final int totalPrice;
  final OrderStatus status;

  const Order({
    required this.id,
    required this.carId,
    required this.carNameSnapshot,
    required this.startDate,
    required this.endDate,
    required this.customerName,
    required this.customerPhone,
    required this.totalPrice,
    required this.status,
  });
}
