import 'package:flutter/material.dart';
import 'package:formularios_flutter/src/bloc/provider.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          _createWallpaper(context),
          _loginForm(context)
        ],
      )
    );
  }

  Widget _loginForm(BuildContext context) {

    final bloc = Provider.of(context);

    final size = MediaQuery.of(context).size;

    return SingleChildScrollView(
      child: Column(
        children: [
          SafeArea( // Para los teléfonos con notch
            child: Container(
              height: 180.0,
            )
          ),
          Container(
            width: size.width * 0.85,
            padding: EdgeInsets.symmetric(vertical: 50),
            margin: EdgeInsets.symmetric(vertical: 30),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5.0),
              color: Colors.white,
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 3.0,
                  offset: Offset(0, 5),
                  spreadRadius: 1
                )
              ]
            ),
            child: Column(
              children: [
                Text('Ingreso', style: TextStyle(fontSize: 20.0),),
                SizedBox(height: 60),
                _createEmail(bloc),
                SizedBox(height: 30),
                _createPassword(bloc),
                SizedBox(height: 30),
                _createButton()
              ],
            ),
          ),
          Text('¿Olvido la contraseña?'),
          SizedBox(height: 100,)
        ],
      ),
    );
  }

  Widget _createEmail(LoginBloc bloc) {

    return StreamBuilder(
      stream: bloc.emailStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              icon: Icon(Icons.email, color: Colors.deepPurple,),
              hintText: 'email@domain.com',
              labelText: 'Correo electrónico',
              counterText: snapshot.data
            ),
            // onChanged: (value) => bloc.changeEmail(value),
            onChanged: bloc.changeEmail,
          ),
        );
      },
    );
  }
  
  Widget _createPassword(LoginBloc bloc) {
    return StreamBuilder(
      stream: bloc.passwordStream,
      builder: (context, snapshot) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: TextField(
            obscureText: true,
            decoration: InputDecoration(
              icon: Icon(Icons.lock, color: Colors.deepPurple,),
              labelText: 'Contraseña',
              counterText: snapshot.data
            ),
            onChanged: bloc.changePassword,
          ),
        );
      },
    );
  }

  Widget _createButton() {
    return RaisedButton(
      child: Container(
        padding: EdgeInsets.symmetric(horizontal: 80, vertical: 15),
        child: Text('Ingresar'),
      ),
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(5)
      ),
      elevation: 0,
      color: Colors.deepPurple,
      textColor: Colors.white,
      onPressed: () {}
    );
  }

  Widget _createWallpaper(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final wallpaper =  Container(
      height: size.height * 0.4,
      width: double.infinity,
      decoration: BoxDecoration(
        gradient: LinearGradient(
          colors: [
            Color.fromRGBO(63, 63, 156, 1),
            Color.fromRGBO(90, 70, 118, 1),
          ]
        )
      ),
    );

    final circle = Container(
      width: 100,
      height: 100,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(100),
        color: Color.fromRGBO(255, 255, 255, 0.05)
      ),
    );

    return Stack(
      children: [
        wallpaper,
        Positioned(top: 90, left: 30, child: circle),
        Positioned(top: -40, right: -30, child: circle),
        Positioned(bottom: -50, right: -10, child: circle),
        Positioned(bottom: 120, right: 20, child: circle),
        Positioned(bottom: -50, left: -20, child: circle),
        Container(
          padding: EdgeInsets.only(top: 80),
          child: Column(
            children: [
              Icon(Icons.account_circle, color: Colors.white, size: 100,),
              SizedBox(height: 10, width: double.infinity,),
              Text('Fake Login', style: TextStyle(color: Colors.white, fontSize: 25))
            ],
          ),
        )
      ],
    );
  }
}