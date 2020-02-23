import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/login.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';

class Login extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            TextFormField(
              controller: sl<LoginController>().usernameController,
              decoration: const InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Utiliza tu alias porricultor...',
                labelText: 'Usuario',
              ),
            ),
            TextFormField(
              controller: sl<LoginController>().passwordController,
              decoration: const InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: 'Que nadie te vea...',
                labelText: 'Contraseña',
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16.0),
              child: RaisedButton(
                onPressed: () {
                  sl<LoginController>().sendLogin();
                },
                child: Text('Entrar'),
              ),
            ),
            StreamBuilder<String>(
                stream: sl<LoginController>().validationErrorStream.stream,
                initialData: null,
                builder:
                    (BuildContext context, AsyncSnapshot<String> snapshot) {
                  if (snapshot.hasData) {
                    return Container(
                      padding: EdgeInsets.only(top: 20),
                      child: Text(
                        snapshot.data,
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 20,
                        ),
                      ),
                    );
                  }

                  return Container();
                }),
          ],
        ),
      ),
    );
  }
}
