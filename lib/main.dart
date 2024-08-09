import 'package:flutter/material.dart';

import 'modules/google_maps/google_map.dart';
import 'modules/main_page/main_page.dart';
import 'modules/ntc_data_package/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: MainPage(),
    );
  }
}
