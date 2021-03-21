import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase/Authentication/Email/LoginEmail.dart';
void main(){
  WidgetsFlutterBinding.ensureInitialized();
  runApp(MyApp());
}
 
class MyApp extends StatelessWidget {
  // Cree el futuro de inicialización fuera de `build`:
  final Future<FirebaseApp> _initialization = Firebase.initializeApp();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      // Inicializar FlutterFire:
      future: _initialization,
      builder: (context, snapshot) {
        // Compruebe si hay errores
        if (snapshot.hasError) {
          return CircularProgressIndicator();
        }
        // Una vez completado, muestre su solicitud
        if (snapshot.connectionState == ConnectionState.done) {
          return MaterialApp(
            title: 'Material App',
            home: LoginEmail(),
          );
        }
        // De lo contrario, muestre algo mientras espera a que se complete la inicialización
        return CircularProgressIndicator();
      },
    );
  }
}