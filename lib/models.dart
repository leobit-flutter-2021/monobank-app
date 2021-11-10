
import 'package:flutter/material.dart';
import 'package:monobank_app/monobank_icons.dart';

class Transaction {
  String time;
  int money;
  String text;
  String receiver;
  IconData icon;

  Transaction(this.time, this.money, this.text, this.receiver, [this.icon=MonobankIcons.credit_card]);
}