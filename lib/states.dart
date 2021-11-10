import 'package:meta/meta.dart';

@immutable
class CashState {
  static var startValues = CashState(10000, 0, 0, 100);
  double cash;
  double cashbackProducts;
  double cashbackTaxi;
  double cashbackElse;
  CashState(this.cash, this.cashbackProducts, this.cashbackTaxi, this.cashbackElse);
}