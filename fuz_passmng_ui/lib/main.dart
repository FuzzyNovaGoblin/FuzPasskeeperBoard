import 'package:flutter/material.dart';
import 'package:fuz_passmng_ui/pages/home_page.dart';

void main() {
  runApp(const BaseApp());
}

class BaseApp extends StatelessWidget {
  const BaseApp({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
    home: const HomePage(),
    );
  }
}