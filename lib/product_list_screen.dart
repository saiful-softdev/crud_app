import 'package:flutter/material.dart';

class ProductListscreen extends StatefulWidget {
  const ProductListscreen({Key? key}) : super(key: key);

  @override
  State<ProductListscreen> createState() => _ProductListscreenState();
}

class _ProductListscreenState extends State<ProductListscreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("CRUD app"),),
    );
  }
}
