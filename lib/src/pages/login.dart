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
            TextField(
              controller: sl<LoginController>().usernameController,
              decoration: InputDecoration(
                icon: Icon(Icons.person),
                hintText: 'Utiliza tu alias porricultor...',
                labelText: 'Usuario',
                suffix: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    sl<LoginController>().clearUsername();
                  },
                ),
              ),
            ),
            TextFormField(
              controller: sl<LoginController>().passwordController,
              decoration: InputDecoration(
                icon: Icon(Icons.vpn_key),
                hintText: 'Que nadie te vea...',
                labelText: 'Contraseña',
                suffix: IconButton(
                  icon: Icon(
                    Icons.clear,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    sl<LoginController>().clearPassword();
                  },
                ),
              ),
            ),
            StreamBuilder<String>(
              stream: sl<LoginController>().validationErrorStream.stream,
              initialData: null,
              builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
                return Container(
                  padding: EdgeInsets.symmetric(vertical: 50, horizontal: 40),
                  child: snapshot.hasData
                      ? Text(
                          snapshot.data,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                            color: Colors.purpleAccent,
                            fontSize: 18,
                          ),
                        )
                      : Container(),
                );
              },
            ),
            OutlineButton(
              child: Container(
                width: double.infinity,
                alignment: Alignment.center,
                child: Text('Entrar'),
              ),
              padding: EdgeInsets.symmetric(vertical: 15),
              onPressed: () {
                sl<LoginController>().sendLogin();
              },
              highlightedBorderColor: Colors.white,
              borderSide: BorderSide(
                color: Colors.white,
                style: BorderStyle.solid,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
