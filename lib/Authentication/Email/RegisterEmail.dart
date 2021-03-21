  import 'package:flutter/material.dart';
  import 'package:flutter_firebase/Authentication/Email/LoginEmail.dart';

  class RegisterEmail extends StatefulWidget {
    @override
    _RegisterEmailState createState() => _RegisterEmailState();
  }

  class _RegisterEmailState extends State<RegisterEmail> {
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
        appBar: AppBar(title: Text("REGISTRAR USUARIO"),),
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
              /////////// [BOTON REGISTRAR] ///////////////
              ElevatedButton(
                style: ButtonStyle(
                  backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
                ),
                onPressed: () {
                  print("""
                  _controllerEmail ${_controllerEmail.text}
                  _controllerPass ${_controllerPass.text}
                  """);
                },
                child: Text("REGISTRAR USUARIO"),
              ),
              /////////// [BOTON LOGIN] ///////////////
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
                    context, MaterialPageRoute(builder: (BuildContext context) => LoginEmail())
                  );
                },
                child: Text("INICIA SESION"),
              )
            ],
          ),
        ),
      );
    }
  }