import 'package:flutter/material.dart';
import 'package:monobank_app/monobank_icons.dart';
import 'monobank_icons.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);
  final String title;
  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
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
          children: [
            Icon(icon, size: 23, color: const Color(0xFF979797)),
            Text(
              title,
              style: const TextStyle(fontSize: 9, color: Color(0xFF979797)),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: BottomAppBar(
        color: const Color(0xFFFEFEFE),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: appBarInfo
              .map(
                (e) => SizedBox(
                  child: _screenNaming(e["title"], e["icon"]),
                  height: 50,
                ),
              )
              .toList(),
        ),
      ),
      body: Center(),
    );
  }
}
