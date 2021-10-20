import 'dart:ffi';
// import 'dart:js';
// import 'dart:js';

import 'package:flutter/material.dart';
import 'package:monobank_app/monobank_icons.dart';
import '../Elements/navigation_bar.dart';
import 'package:intl/intl.dart';

Color whiteColor = Colors.orange;
Color purpleColor = Colors.deepPurple;
final oCcy = new NumberFormat("#,##0.00", "en_US");



Widget HomePage(context) {
  List<Widget> _transactions = [
    _dateTimeMain("23 Thermidor 2023"),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _dateTime("22 Thermidor 2023"),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _dateTime("21 Thermidor 2023"),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(Transaction("222", -214, "Pornhub account",
        "Max Leszczynski", MonobankIcons.credit_card)),
    _transactionCard(
        Transaction("222", -214, "2222", "2222", MonobankIcons.credit_card)),
  ];

  return Container(
    child: Container(
      decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topRight,
              end: Alignment.centerLeft,
              colors: [whiteColor, purpleColor])),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        children: <Widget>[
          _moneyBar(3253231, "EUR"),
          _transactionsView(_transactions, context)
        ],
      ),
    ),
  );
}

Widget _moneyBar(double money, String currency) {
  return Expanded(
    flex: 1,
    child: Align(
      alignment: Alignment.center,
      child: Text(
        "${oCcy.format(money)} ${currency}",
        style: TextStyle(color: Colors.white, fontSize: 20),
      ),
    ),
  );
}

Widget _transactionsView(elements, context) {
  return Expanded(
    flex: 5,
    child: Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30), topRight: Radius.circular(30)),
        color: Colors.white,
      ),
      height: MediaQuery.of(context).size.height,
      child: ListView(
        scrollDirection: Axis.vertical,
        children: elements,
      ),
    ),
  );
}

Widget _transactionCard(Transaction transaction) {
  return Padding(
    padding: EdgeInsets.only(top: 10, left: 40, right: 40),
    child: Container(
        height: 40,
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Icon(transaction.icon),
            _transactionText(transaction.text, transaction.receiver),
            Spacer(),
            Align(
                alignment: Alignment.centerRight,
                child: Text(
                  "${transaction.money}",
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                ))
          ],
        )),
  );
}

Widget _transactionText(String text, String destination) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          destination,
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14),
        ),
        Text(
          text,
          style: TextStyle(fontSize: 12),
        )
      ],
    ),
  );
}

Widget _dateTime(String date) {
  return Container(
    padding: EdgeInsets.only(top: 15),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          date,
          style: TextStyle(fontSize: 12),
        ),
      ],
    ),
  );
}

Widget _dateTimeMain(String date) {
  return Container(
    padding: EdgeInsets.only(
      top: 15,
      left: 25,
      right: 25,
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Container(
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(15),
              border: Border.all(color: Colors.black)),
          child: Icon(Icons.bar_chart_sharp),
        ),
        Text(
          date,
          style: TextStyle(fontSize: 12),
        ),
        Container(
          padding: EdgeInsets.all(3),
          decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(20),
              border: Border.all(color: Colors.black)),
          child: Icon(Icons.search_outlined),
        ),
      ],
    ),
  );
}

class Transaction {
  String time;
  int money;
  String text;
  String receiver;
  IconData icon;

  Transaction(this.time, this.money, this.text, this.receiver, this.icon);
}
