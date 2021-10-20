import 'package:flutter/material.dart';
import 'package:monobank_app/monobank_icons.dart';
void main() => runApp(NavigationBar());

class NavigationBar extends StatelessWidget {
  NavigationBar({ Key? key }) : super(key: key);

  final appBarInfo = [
    {"title": "Карта", "icon": MonobankIcons.credit_card},
    {"title": "Кредити", "icon": MonobankIcons.credits},
    {"title": "Накопичення", "icon": MonobankIcons.calendar_check},
    {"title": "Кешбек", "icon": MonobankIcons.gift_1},
    {"title": "Ще", "icon": MonobankIcons.th_large},
  ];

  Widget _screenNaming(title, icon) {
    return SizedBox(
      width: 75,
      child: IconButton(
        onPressed: () {},
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

  Widget _buttonText(String title){
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
                  child: _screenNaming(e["title"], e["icon"]),
                  height: 60,
                ),
              )
              .toList(),
        ),
      );
  }
}