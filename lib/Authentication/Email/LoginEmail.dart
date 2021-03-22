import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Authentication/Email/RegisterEmail.dart';

class LoginEmail extends StatefulWidget {

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {

  TextEditingController _controllerEmail;
  TextEditingController _controllerPass;

  @override
  void initState() {
    _controllerEmail = TextEditingController();
    _controllerPass = TextEditingController();
    super.initState();
  }

  @override
  void dispose() { 
    _controllerEmail.dispose();
    _controllerPass.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("LOGIN"),),
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /////////// [EMAIL] ///////////////
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextField(
                controller: _controllerEmail,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Email'
                ),
              ),
            ),
            /////////// [PASS] ///////////////
            Container(
              padding: EdgeInsets.symmetric(horizontal: 20,vertical: 10),
              child: TextField(
                controller: _controllerPass,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Pass'
                ),
              ),
            ),
            /////////// [BOTON LOGIN] ///////////////
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.green)
              ),
              onPressed: () {
                print("""
                _controllerEmail ${_controllerEmail.text}
                _controllerPass ${_controllerPass.text}
                """);
                _iniciarSesion(_controllerEmail.text,_controllerPass.text);
              },
              child: Text("INICIAR SESION"),
            ),
            /////////// [BOTON REGISTRAR] ///////////////
            ElevatedButton(
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Colors.blueGrey)
              ),
              onPressed: () {
                print("""
                _controllerEmail ${_controllerEmail.text}
                _controllerPass ${_controllerPass.text}
                """);
                Navigator.push(
                  context, MaterialPageRoute(builder: (BuildContext context) => RegisterEmail())
                );
              },
              child: Text("crear cuenta"),
            )
          ],
        ),
      ),
    );
  }

  _iniciarSesion(String emailInput, String passInput)async{
    try {
      /// El usuario se guardara en [userCredential] pueden almacenarlo si lo necesitan
      UserCredential userCredential = await FirebaseAuth.instance.signInWithEmailAndPassword(
        email: emailInput,
        password: passInput
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found') {
        print('No se encontró ningún usuario para ese correo electrónico.');
      } else if (e.code == 'wrong-password') {
        print('Se proporcionó una contraseña incorrecta para ese usuario.');
      }
    }
  }
}