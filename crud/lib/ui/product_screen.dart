import 'dart:io';

import 'package:crud/model/product.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_database/firebase_database.dart';

File image;
String fileName;

class ProductScreen extends StatefulWidget {
  final Product product;

  ProductScreen(this.product);

  @override
  _ProductScreenState createState() => _ProductScreenState();
}

final productReference = FirebaseDatabase.instance.reference().child('product');

class _ProductScreenState extends State<ProductScreen> {
  List<Product> items;
  TextEditingController _nameController;
  TextEditingController _codebarController;
  TextEditingController _descriptionController;
  TextEditingController _priceController;
  TextEditingController _stockController;

  String productImage;

  pickerCam() async {
    File img = await ImagePicker.pickImage(source: ImageSource.camera);
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  pickerGallery() async {
    File img = await ImagePicker.pickImage(source: (ImageSource.gallery));
    if (img != null) {
      image = img;
      setState(() {});
    }
  }

  Widget divider() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
      child: Container(
        width: 0.8,
        color: Colors.black,
      ),
    );
  }

  @override
  void initState() {
    super.initState();
    _nameController = new TextEditingController(text: widget.product.name);
    _codebarController =
        new TextEditingController(text: widget.product.codebar);
    _descriptionController =
        new TextEditingController(text: widget.product.description);
    _priceController = new TextEditingController(text: widget.product.price);
    _stockController = new TextEditingController(text: widget.product.stock);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        title: Text("Prodcut BD"),
        backgroundColor: Colors.deepOrangeAccent,
      ),
      body: ListView(
        padding: const EdgeInsets.all(20.0),
        children: <Widget>[
          TextField(
            controller: _nameController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration: InputDecoration(
              icon: Icon(Icons.person),
              labelText: 'Name',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          TextField(
            controller: _descriptionController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration: InputDecoration(
              icon: Icon(Icons.description),
              labelText: 'Description',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          TextField(
            controller: _codebarController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration: InputDecoration(
              icon: Icon(Icons.check),
              labelText: 'CodeBar',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          TextField(
            controller: _priceController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration: InputDecoration(
              icon: Icon(Icons.monetization_on),
              labelText: 'Price',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          TextField(
            controller: _stockController,
            style: TextStyle(fontSize: 17.0, color: Colors.deepOrangeAccent),
            decoration: InputDecoration(
              icon: Icon(Icons.adb),
              labelText: 'Stock',
            ),
          ),
          Padding(
            padding: EdgeInsets.only(top: 8.0),
          ),
          Divider(),
          FlatButton(
              onPressed: () {
                if (widget.product.id != null) {
                  productReference.child(widget.product.id).set({
                    'name': _nameController.text,
                    'codebar': _codebarController.text,
                    'descripcion': _descriptionController.text,
                    'price': _priceController.text,
                    'stock': _stockController,
                  }).then((_) {
                    Navigator.pop(context);
                  });
                } else {
                  productReference.push().set({
                    'name': _nameController.text,
                    'codebar': _codebarController.text,
                    'descripcion': _descriptionController.text,
                    'price': _priceController.text,
                    'stock': _stockController,
                  })
                    ..then((_) {
                      Navigator.pop(context);
                    });
                }
              },
              child:
                  (widget.product.id != null) ? Text('Update') : Text("Add")),
        ],
      ),
    );
  }
}
