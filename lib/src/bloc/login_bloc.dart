import 'dart:async';

import 'package:formularios_flutter/src/bloc/validators.dart';
import 'package:rxdart/rxdart.dart';

class LoginBloc with Validators {

  // final _emailController = StreamController<String>.broadcast();
  // final _passwordController = StreamController<String>.broadcast();
  final _emailController = BehaviorSubject<String>();
  final _passwordController = BehaviorSubject<String>();

  // listen values of stream
  Stream<String> get emailStream => _emailController.stream.transform( validEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validPassword );

  Stream<bool> get formValidStream => 
    Rx.combineLatest2(emailStream, passwordStream, (email, password) => true);

  // Insert values
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  // get last value
  String get email => _emailController.value;
  String get password => _passwordController.value;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}