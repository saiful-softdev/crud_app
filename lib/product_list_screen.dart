import 'dart:convert';
import 'package:crud_app/add_new_product_screen.dart';
import 'package:crud_app/edit_new_screen.dart';
import 'package:crud_app/product.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart';

enum PopupMenuType { edit, delete }

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  List<Product> productList = [];

  @override
  void initState() {
    super.initState();
    getProductListFromApi();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD app"),
      ),
      body: ListView.builder(
        itemCount: productList.length,
        itemBuilder: (context, index) {
          return ListTile(
            leading:  CircleAvatar(
              backgroundImage: NetworkImage(productList[index].image ?? ""),
            ),
            title:  Text(productList[index].productName ?? "Unkown"),
            subtitle:  Wrap(
              spacing: 16,
              children: [
                Text(productList[index].productCode ?? ""),
                Text(productList[index].totalPrice ?? ""),
                Text(productList[index].unitPrice ?? ""),
                Text(productList[index].quantity ?? ""),
                Text("Total Prize")
              ],
            ),
            trailing: PopupMenuButton<PopupMenuType>(
              onSelected: onTapPopUpMenuButton,
              itemBuilder: (context) => [
                const PopupMenuItem(
                  value: PopupMenuType.edit,
                  child: Row(
                    children: [
                      Icon(Icons.edit),
                      SizedBox(
                        width: 8
                      ),
                      Text("Edit")
                    ],
                  ),
                ),
                const PopupMenuItem(
                  value: PopupMenuType.delete,
                  child: Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 8),
                      Text("Delete")
                    ],
                  ),
                ),
              ],
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(
                context,
                MaterialPageRoute(
                    builder: (context) => const AddNewProductScreen()));
          },
          icon: const Icon(Icons.add),
          label: const Text("Add")),
    );
  }

  void onTapPopUpMenuButton(PopupMenuType type) {
    switch (type) {
      case PopupMenuType.edit:
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => const EditNewScreen(),
          ),
        );
        break;
      case PopupMenuType.delete:
        _showDeleteDialoge();
    }
  }

  void _showDeleteDialoge() {
    showDialog(
        context: context,
        builder: (contex) {
          return AlertDialog(
            title: const Text("Delete Dialoge"),
            content: const Text("Are You Sure Delete"),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text("Cancel")),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    "Yes,Sure",
                    style: TextStyle(color: Colors.red),
                  ))
            ],
          );
        });
  }

  Future<void> getProductListFromApi() async {
    Uri uri = Uri.parse("https://crud.teamrabbil.com/api/v1/ReadProduct");
    Response response = await get(uri);
    print(response);
    print(response.statusCode);
    print(response.body);
    if (response.statusCode == 200) {
      var decodedResponse = jsonDecode(response.body);
      if (decodedResponse["status"] == "success") {
        var list = decodedResponse["data"];
        for (var item in list) {
          Product product = Product(
              id: item["_id"],
              productName: item["ProductName"],
              productCode: item["ProductCode"],
              quantity: item["Qty"],
              totalPrice: item["TotalPrice"],
              image: item["Img"]);
          productList.add(product);
        }
        setState(() {});
      }
    }
  }
}
