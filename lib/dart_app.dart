import 'package:crud_app/product_list_screen.dart';
import 'package:flutter/material.dart';

class CRUDapp extends StatelessWidget {
  const CRUDapp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.amberAccent,
          centerTitle: true
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(),
          errorBorder: OutlineInputBorder(),
          enabledBorder: OutlineInputBorder(),
          focusedBorder: OutlineInputBorder(),
          disabledBorder: OutlineInputBorder()
        ),
        elevatedButtonTheme: ElevatedButtonThemeData(
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.amberAccent,
            foregroundColor: Colors.white,
            padding: const EdgeInsets.symmetric(vertical: 22),
            textStyle: const TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.w200
            )
          )
        )
      ),
home: const ProductListScreen(),
    );
  }
}
