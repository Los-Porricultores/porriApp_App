import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/login.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(20),
        alignment: Alignment.center,
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 2,
              child: Container(
                padding: EdgeInsets.all(25),
                child: Image.asset(
                  'lib/resources/images/porricultor_logo.png',
                  fit: BoxFit.contain,
                ),
              ),
            ),
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
                color: Colors.white,
                onPressed: () {
                  sl<LoginController>().sendLogin();
                },
                child: Text(
                  'Entrar',
                  style: TextStyle(
                    color: Colors.black,
                  ),
                ),
              ),
            ),
            StreamBuilder<String>(
              stream: sl<LoginController>().validationErrorStream.stream,
              initialData: null,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                if (snapshot.hasData) {
                  return Container(
                    padding: EdgeInsets.symmetric(vertical: 20, horizontal: 40),
                    child: Text(
                      snapshot.data,
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.purpleAccent,
                        fontSize: 18,
                      ),
                    ),
                  );
                }

                return Container();
              },
            ),
          ],
        ),
      ),
    );
  }
}
