import 'package:flutter/material.dart';

class ProductoPage extends StatelessWidget {
  const ProductoPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Producto'),
        actions: [
          IconButton(
            icon: Icon(Icons.photo),
            onPressed: () {}
          ),
          IconButton(
            icon: Icon(Icons.camera_alt),
            onPressed: () {}
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.all(15),
          child: Form(
            child: Column(
              children: [
                _createName(),
                SizedBox(height: 40,),
                _createPrice(),
                SizedBox(height: 40,),
                _createButton()
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _createName() {
    return TextFormField(
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
        border: OutlineInputBorder()
      ),
    );
  }

  Widget _createPrice() {
    return TextFormField(
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Price',
        border: OutlineInputBorder()
      ),
    );
  }

  Widget _createButton() {
    return RaisedButton.icon(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20)
      ),
      padding: EdgeInsets.symmetric(horizontal: 50, vertical: 10),
      color: Colors.deepPurple,
      textColor: Colors.white,
      label: Text('Guardar'),
      icon: Icon(Icons.save),
      onPressed: () { }
    );
  }
}