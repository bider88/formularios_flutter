import 'package:flutter/material.dart';
import 'package:formularios_flutter/src/bloc/login_bloc.dart';

class Provider extends InheritedWidget{

  final loginBloc = LoginBloc();

  Provider({ Key key, Widget child }): super(key: key, child: child);

  @override // Debe de actualizar a los hijos?
  bool updateShouldNotify(covariant InheritedWidget oldWidget) => true;

  static LoginBloc of (BuildContext context) {
    return ( context.dependOnInheritedWidgetOfExactType<Provider>().loginBloc );
  }

}