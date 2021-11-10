enum Action { MakeTransaction, MakeBankSaving }

class MakeTransaction {
  double cash;
  String typeOfTransaction;

  MakeTransaction(this.cash, this.typeOfTransaction);
}

class MakeBankSaving {
  double cash;

  MakeBankSaving(this.cash);
}
