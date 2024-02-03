import 'package:flutter/material.dart';

class EditNewScreen extends StatefulWidget {
  const EditNewScreen({Key? key}) : super(key: key);

  @override
  State<EditNewScreen> createState() => _EditNewScreenState();
}

class _EditNewScreenState extends State<EditNewScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _codeController = TextEditingController();
  final TextEditingController _imageController = TextEditingController();
  final TextEditingController _unitPrizeController = TextEditingController();
  final TextEditingController _quantityController = TextEditingController();
  final TextEditingController _totalPrizeController = TextEditingController();
  final GlobalKey<FormState> _keyForm = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Edit Product Screen"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Form(
            key: _keyForm,
            child: Column(
              children: [
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                      hintText: "Product Name", labelText: "Enter Product Name"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Product Name";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _codeController,
                  decoration: const InputDecoration(
                      hintText: "Product Code", labelText: "Enter Product Code"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter product Code";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _imageController,
                  decoration: const InputDecoration(
                      hintText: "Product Image", labelText: "Give Image"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Give Image";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _unitPrizeController,
                  decoration: const InputDecoration(
                      hintText: "Unit Prize", labelText: "Write Per Unit Prize"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Unit Prize";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                  controller: _quantityController,
                  decoration: const InputDecoration(
                      hintText: "Quantity", labelText: "Enter Quantity"),
                  validator: (String? value) {
                    if (value?.trim().isEmpty ?? true) {
                      return "Enter Quantity";
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 8,
                ),
                TextFormField(
                    controller: _totalPrizeController,
                    decoration: const InputDecoration(
                        hintText: "Total prize", labelText: "Total prize"),
                    validator: (String? value){
                      if(value!.isEmpty){
                        return "Total prize ";

                      }
                      return null;
                    }

                ),


                const SizedBox(
                  height: 8,
                ),
                SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                        onPressed: () {
                          if (_keyForm.currentState!.validate()) ;
                        },
                        child: const Text("Update")))
              ],
            ),
          ),
        ),
      ),
    );
  }
  String? textValidator(String?value){
    if(value!.isEmpty){
      return value;
    }
    return null;
  }
}
