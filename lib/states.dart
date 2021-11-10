import 'package:meta/meta.dart';

@immutable
class CashState {
  static var startValues = CashState(10000, 0, 0, 100, [
    {"total_amount": 9000, "current_amount": 5000, "name": "На гараж"},
    {"total_amount": 9000, "current_amount": 200, "name": "На гараж"},
    {"total_amount": 9000, "current_amount": 6000, "name": "На гараж"},
    {"total_amount": 9000, "current_amount": 5000, "name": "На гараж"},
    {"total_amount": 9000, "current_amount": 3000, "name": "На гараж"},
    {"total_amount": 9000, "current_amount": 6000, "name": "На гараж"},
  ], 5000+200+6000+5000+3000+6000);
  double cash;
  double cashbackProducts;
  double cashbackTaxi;
  double cashbackElse;
  int savingsTotalAmount;
  List<Map> jars;
  CashState(this.cash, this.cashbackProducts, this.cashbackTaxi,
      this.cashbackElse, this.jars, this.savingsTotalAmount);
}
