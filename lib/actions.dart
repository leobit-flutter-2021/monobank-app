enum Action { MakeTransaction, MakeBankSaving }

class MakeTransaction {
  double cash;
  String typeOfTransaction;

  MakeTransaction(this.cash, this.typeOfTransaction);
}

class MakeBankSaving {
  double cash;
  int amount;
  int firstTransacrion;
  String jarName;

  MakeBankSaving(this.cash, this.amount, this.firstTransacrion, this.jarName);
}
