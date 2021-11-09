import 'package:flutter/material.dart';
import 'package:monobank_app/monobank_icons.dart';
import 'package:monobank_app/Savings/savings.dart';
import 'package:monobank_app/HomePage/home_page.dart';
import 'package:monobank_app/Elements/navigation_bar.dart';
import 'package:monobank_app/Cashback/cashback.dart';
import 'package:monobank_app/Savings/savings.dart';

class NavigationBar extends StatelessWidget {
  BuildContext context1;

  NavigationBar(this.context1, {Key? key}) : super(key: key);

  final appBarInfo = [
    {"title": "Карта", "icon": MonobankIcons.credit_card},
    {"title": "Кредити", "icon": MonobankIcons.credits},
    {"title": "Накопичення", "icon": MonobankIcons.calendar_check},
    {"title": "Кешбек", "icon": MonobankIcons.gift_1},
    {"title": "Ще", "icon": MonobankIcons.th_large},
  ];

  Widget _screenNaming(title, icon, context) {
    final List elements = [HomePage(context1), SavingsPage(), CashbackPage()];
    return SizedBox(
      width: 75,
      child: IconButton(
        onPressed: () {
          Widget nextPage;
          if (title == "Накопичення") {
            nextPage = elements[1];
          } else if (title == "Кешбек") {
            nextPage = elements[2];
          } else {
            nextPage = elements[0];
          }
          if (Navigator.canPop(context)) {
            Navigator.pop(context);
          }
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                bottomNavigationBar: NavigationBar(context1),
                body: nextPage,
              ),
            ),
          );
        },
        icon: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(icon, size: 23, color: const Color(0xFF979797)),
            _buttonText(title),
          ],
        ),
      ),
    );
  }

  Widget _buttonText(String title) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 5),
      child: Text(
        title,
        style: const TextStyle(fontSize: 9, color: Color(0xFF979797)),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: const Color(0xFFFEFEFE),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: appBarInfo
            .map(
              (e) => SizedBox(
                child: _screenNaming(e["title"], e["icon"], context),
                height: 60,
              ),
            )
            .toList(),
      ),
    );
  }
}
