import 'dart:ffi';

import 'package:flutter/material.dart';
import '../Elements/navigation_bar.dart';
import 'package:intl/intl.dart';


Color whiteColor = Colors.orange;
Color purpleColor = Colors.deepPurple;
final oCcy = new NumberFormat("# ##0.00", "ua_UA");

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: NavigationBar(),
      body: _HomeScroller(),
    );
  }
}


Widget _HomeScroller(){
  return SingleChildScrollView(
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topRight,
            end: Alignment.centerLeft,
            colors: [whiteColor, purpleColor]
            )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
              _moneyBar(3253231, "EUR"),
              _transactionsView()
          ],
        ),
      ),
  );
}

Widget _moneyBar(double money, String currency){
  return Container(
    height: 80,
    child: Align(
        alignment: Alignment.center,
        child: Text(
          "${oCcy.format(money)} ${currency}",
          style: TextStyle(color: Colors.white, fontSize: 20 ),
        ),
      ),
  );
}

Widget _transactionsView(){
  return Container(
    decoration: BoxDecoration(
      borderRadius: BorderRadius.only(topLeft: Radius.circular(30), topRight: Radius.circular(30)),
      color: Colors.white,
    ),
    child: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: <Widget>[
        Padding(padding: EdgeInsets.only(top: 20), child: Container(height: 200,),)

      ],
    ),
  );
}

Widget _transactionCard(Transaction transaction){
  return Padding(
    padding: EdgeInsets.only(top: 10),
    child: Container(
      height: 40,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          transaction.icon,
          
        ],
      )
    ),
  );
}

Widget _transactionText(String text, String destination){
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 10),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(destination),
        Text(text)
      ],
    ),
  );
}

class Transaction{
  String time;
  int money;
  String text;
  String receiver;
  Icon icon;

  Transaction(
    this.time,
    this.money,
    this.text,
    this.receiver,
    this.icon
  );
}