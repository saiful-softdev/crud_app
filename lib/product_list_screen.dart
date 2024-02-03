import 'package:crud_app/add_new_product_screen.dart';
import 'package:crud_app/edit_new_screen.dart';
import 'package:flutter/material.dart';
enum PopupMenuType{
  edit,
  delete
}

class ProductListScreen extends StatefulWidget {
  const ProductListScreen({Key? key}) : super(key: key);

  @override
  State<ProductListScreen> createState() => _ProductListScreenState();
}

class _ProductListScreenState extends State<ProductListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("CRUD app"),
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return  ListTile(
            leading: const CircleAvatar(
              backgroundImage: NetworkImage(
                  "https://pixabay.com/vectors/laptop-computer-business-technology-312499/"),
            ),
            title: const Text("Product Name"),
            subtitle: const Wrap(
              spacing: 16,
              children: [
                Text("Product Code"),
                Text("Product Image"),
                Text("Unit Prize"),
                Text("Quantity"),
                Text("Total Prize")
              ],
            ),
            trailing: PopupMenuButton<PopupMenuType>(
              onSelected: onTapPopUpMenuButton ,
              itemBuilder:(context)=>[
              const PopupMenuItem(
                  value: PopupMenuType.edit,
                  child: Row(
                children: [
                  Icon(Icons.edit),
                  SizedBox(width: 8,),
                  Text("Edit")
                ],
              ),
              ),
              const PopupMenuItem(
                  value: PopupMenuType.delete,
                  child:Row(
                    children: [
                      Icon(Icons.delete),
                      SizedBox(width: 8),
                      Text("Delete"),
                    ],
                  ) ),
            ],

            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton.extended(
          onPressed: () {
            Navigator.push(context, MaterialPageRoute(builder: (context)=>const AddNewProductScreen()));
          }, icon: const Icon(Icons.add), label: const Text("Add")),
    );
  }
  void onTapPopUpMenuButton(PopupMenuType type){
    switch (type)
    {
      case PopupMenuType.edit:
        Navigator.push(context, MaterialPageRoute(
            builder: (contex)=> const EditNewScreen(),),);
      break;
      case PopupMenuType.delete:
        _showDeleteDialoge();

    }
  }
  void _showDeleteDialoge(){
    showDialog(context: context, builder: (contex){
      return  AlertDialog(
        title: const Text("Delete Dialoge"),
        content: const Text("Are You Sure Delete"),
        actions: [
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Cancel")),
          TextButton(onPressed: (){
            Navigator.pop(context);
          }, child: const Text("Yes,Sure",
            style: TextStyle(color: Colors.red),))
        ],
      );
    });
  }
}
