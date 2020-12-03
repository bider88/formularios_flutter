import 'package:flutter/material.dart';
import 'package:formularios_flutter/src/bloc/provider.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final bloc = Provider.of(context);
    
    return Scaffold(
      appBar: AppBar(
        title: Text('Home page'),
      ),
      body: Container(),
      floatingActionButton: _createActionButton(context),
    );
  }

  Widget _createActionButton(BuildContext context) {
    return FloatingActionButton(
      child: Icon(Icons.add),
      backgroundColor: Colors.deepPurple,
      onPressed: () => Navigator.pushNamed(context, 'producto')
    );
  }
}