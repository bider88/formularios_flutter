import 'dart:async';

import 'package:formularios_flutter/src/bloc/validators.dart';

class LoginBloc with Validators {

  final _emailController = StreamController<String>.broadcast();
  final _passwordController = StreamController<String>.broadcast();

  // listen values of stream
  Stream<String> get emailStream => _emailController.stream.transform( validEmail );
  Stream<String> get passwordStream => _passwordController.stream.transform( validPassword );

  // Insert values
  Function(String) get changeEmail => _emailController.sink.add;
  Function(String) get changePassword => _passwordController.sink.add;

  dispose() {
    _emailController?.close();
    _passwordController?.close();
  }

}