import 'package:meta/meta.dart';
import 'package:monobank_app/models.dart';

@immutable
class CashState {
  static var startValues = CashState(
      10000,
      0,
      0,
      0,
      [
        {"total_amount": 9000, "current_amount": 5000, "name": "На гараж"},
        {"total_amount": 9000, "current_amount": 200, "name": "На гараж"},
        {"total_amount": 9000, "current_amount": 6000, "name": "На гараж"},
        {"total_amount": 9000, "current_amount": 5000, "name": "На гараж"},
        {"total_amount": 9000, "current_amount": 3000, "name": "На гараж"},
        {"total_amount": 9000, "current_amount": 6000, "name": "На гараж"},
      ],
      5000 + 200 + 6000 + 5000 + 3000 + 6000,
      [
        Transaction("222", 222, "Fake taxi driver", "Pornhub account"),
        Transaction("222", 222, "Fake taxi driver", "Pornhub account"),
        Transaction("222", 222, "Fake taxi driver", "Pornhub account"),
        Transaction("222", 222, "Fake taxi driver", "Pornhub account"),
        Transaction("222", 222, "Fake taxi driver", "Pornhub account"),
        Transaction("222", 222, "Fake taxi driver", "Pornhub account"),
      ],
      "UAH");

  double cash;
  double cashbackProducts;
  double cashbackTaxi;
  double cashbackElse;
  int savingsTotalAmount;
  List<Map> jars;
  String currency;
  List<Transaction> transactions;

// <<<<<<< HEAD

//   CashState(this.cash, this.cashbackProducts, this.cashbackTaxi,
//       this.cashbackElse, );
// }

  CashState(this.cash, this.cashbackProducts, this.cashbackTaxi,
      this.cashbackElse, this.jars, this.savingsTotalAmount, this.transactions,
      [this.currency = "UAH"]);
}
// >>>>>>> eaa8202f36d9895491c745cf59b8e6131d4a7410
