import 'package:meta/meta.dart';
import 'package:monobank_app/models.dart';

@immutable
class CashState {
  static var startValues = CashState(10000, 0, 0, 100, [
    Transaction("222", 222, "Fake taxi driver","Pornhub account"),
    Transaction("222", 222, "Fake taxi driver","Pornhub account"),
    Transaction("222", 222, "Fake taxi driver","Pornhub account"),
    Transaction("222", 222, "Fake taxi driver","Pornhub account"),
    Transaction("222", 222, "Fake taxi driver","Pornhub account"),
    Transaction("222", 222, "Fake taxi driver","Pornhub account"),
    ], "UAH");
  double cash;
  double cashbackProducts;
  double cashbackTaxi;
  double cashbackElse;
  String currency;
  List<Transaction> transactions;
  CashState(this.cash, this.cashbackProducts, this.cashbackTaxi, this.cashbackElse, this.transactions, [this.currency="UAH"]);
}