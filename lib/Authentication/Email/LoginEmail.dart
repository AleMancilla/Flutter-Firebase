import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Authentication/Email/RegisterEmail.dart';
import 'package:flutter_firebase/Authentication/HomeScreen.dart';

class LoginEmail extends StatefulWidget {

  @override
  _LoginEmailState createState() => _LoginEmailState();
}

class _LoginEmailState extends State<LoginEmail> {

  TextEditingController _controllerEmail;
  TextEditingController _controllerPass;

  @override
  void dispose() { 
    try {
      _controllerEmail.dispose();
      _controllerPass.dispose();
      
    } catch (e) {
    }
    super.dispose();
  }

  @override
  void initState() {
    _controllerEmail = TextEditingController();
    _controllerPass = TextEditingController();
    _verificarEstadoSesion();
    super.initState();
  }

  _verificarEstadoSesion(){
    FirebaseAuth.instance
    .authStateChanges()
    .listen((User user) {
      if (user == null) {
        // Navigator.push(
        //   context, MaterialPageRoute(builder: (BuildContext context) => LoginEmail())
        // );
      } else {
        try {
          Navigator.pushReplacement(
            context, MaterialPageRoute(builder: (BuildContext context) => HomePage())
          );
        } catch (e) {
        }
      }
    });
    
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
                Navigator.pushReplacement(
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

      Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (BuildContext context) => HomePage())
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