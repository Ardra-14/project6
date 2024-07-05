import 'package:flutter/material.dart';
import 'package:my_app/models/cart_model_tile_provider.dart';
import 'package:my_app/pages/intro_page.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => CartModel(),
      child: MaterialApp(
        title: "App",
        home: IntroPage(),
      ),
    );
  }
}
