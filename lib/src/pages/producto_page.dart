import 'package:flutter/material.dart';
import 'package:formularios_flutter/src/models/product_model.dart';
import 'package:formularios_flutter/src/utils/utils.dart' as utils;

class ProductoPage extends StatefulWidget {

  @override
  _ProductoPageState createState() => _ProductoPageState();
}

class _ProductoPageState extends State<ProductoPage> {

  ProductModel product = ProductModel();

  final formKey = GlobalKey<FormState>();

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
            key: formKey,
            child: Column(
              children: [
                _createName(),
                SizedBox(height: 40,),
                _createPrice(),
                SizedBox(height: 40,),
                _createAvailable(),
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
      initialValue: product.title,
      textCapitalization: TextCapitalization.sentences,
      decoration: InputDecoration(
        labelText: 'Producto',
        border: OutlineInputBorder()
      ),
      onSaved: (newValue) => product.title = newValue,
      validator: (value) {
        if (value.length < 3) {
          return 'Ingrese el nombre del producto';
        }
        return null;
      },
    );
  }

  Widget _createPrice() {
    return TextFormField(
      initialValue: product.price.toString(),
      keyboardType: TextInputType.numberWithOptions(decimal: true),
      decoration: InputDecoration(
        labelText: 'Price',
        border: OutlineInputBorder()
      ),
      onSaved: (newValue) => product.price = double.parse(newValue),
      validator: (value) {
        return utils.isNumeric(value) ? null : 'Sólo se aceptan números';
      },
    );
  }

  Widget _createAvailable() {
    return SwitchListTile(
      value: product.available,
      activeColor: Colors.deepPurple,
      title: Text('Disponible'),
      onChanged: (value) => setState(() {
        product.available = value;
      }),
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
      onPressed: _submit
    );
  }

  void _submit() {
    if (formKey.currentState.validate()) {

      formKey.currentState.save();

      print('all ok');
      print( product.title );
      print( product.price );
      print( product.available );
    }
  }
}