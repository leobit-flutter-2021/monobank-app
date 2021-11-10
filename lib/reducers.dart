import 'package:monobank_app/models.dart';

import 'states.dart';
import 'actions.dart';

CashState cashReducer(CashState previousState, dynamic action) {
  double newCash = action.cash;
  if (action is MakeTransaction) {
    double diff = previousState.cash - newCash;
    double productCashbackPercents = 0.03;
    double taxiCashbackPercents = 0.03;
    double elseCashbackPercents = 0.03;
    List<Transaction> newTransactions = previousState.transactions;
    newTransactions.add(Transaction("Now", newCash.toInt(),
        action.typeOfTransaction, action.typeOfTransaction));

    if (action.typeOfTransaction == 'product') {
      double newProductCashback =
          previousState.cashbackProducts + diff * productCashbackPercents;
      return CashState(
          newCash,
          newProductCashback,
          previousState.cashbackTaxi,
          previousState.cashbackElse,
          previousState.jars,
          previousState.savingsTotalAmount,
          newTransactions);
    } else if (action.typeOfTransaction == 'taxi') {
      double newTaxiCashback =
          previousState.cashbackTaxi + diff * taxiCashbackPercents;
      return CashState(
          newCash,
          previousState.cashbackProducts,
          newTaxiCashback,
          previousState.cashbackElse,
          previousState.jars,
          previousState.savingsTotalAmount,
          newTransactions);
    } else {
      double newElseCashback =
          previousState.cashbackElse + diff * elseCashbackPercents;
      return CashState(
          newCash,
          previousState.cashbackProducts,
          previousState.cashbackTaxi,
          newElseCashback,
          previousState.jars,
          previousState.savingsTotalAmount,
          newTransactions);
    }
  } else if (action is MakeBankSaving) {
    double newCash = previousState.cash - action.firstTransacrion;
    previousState.jars.add({
      "total_amount": action.amount,
      "current_amount": action.firstTransacrion,
      "name": action.jarName
    });
    int newSavingsTotalAmount =
        previousState.savingsTotalAmount + action.firstTransacrion;

    return CashState(
        newCash,
        previousState.cashbackProducts,
        previousState.cashbackTaxi,
        previousState.cashbackElse,
        previousState.jars,
        newSavingsTotalAmount,
        previousState.transactions);
  } else {
    return previousState;
  }
}
