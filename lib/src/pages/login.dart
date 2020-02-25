import 'package:flutter/material.dart';
import 'package:porri_app/resources/constants/imagePaths.dart';

class Login extends StatelessWidget {
  final String loginButtonText = 'Entrar',
      emailInputLabel = 'E-mail',
      passwordInputLabel = 'Password';
  final double loginButtonHeight = 50,
      loginButtonRadius = 15,
      loginButtonVerticalMargin = 20;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Flex(
          direction: Axis.vertical,
          children: <Widget>[
            Expanded(
              flex: 6,
              child: Image.asset(
                porriLogo,
                fit: BoxFit.contain,
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: ListView(
                  physics: ClampingScrollPhysics(),
                  children: <Widget>[
                    _loginInputWidget(label: emailInputLabel),
                    _loginInputWidget(label: passwordInputLabel),
                    _errorMessageWidget(),
                  ],
                ),
              ),
            ),
            _loginButtonWidget(onPressed: () {}),
          ],
        ),
      ),
    );
  }

  Widget _loginInputWidget({@required label}) {
    return TextField(
      decoration: InputDecoration(labelText: label),
    );
  }

  Widget _errorMessageWidget() {
    return Container(
      height: 50,
    );
  }

  Widget _loginButtonWidget({@required Function onPressed}) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: loginButtonVerticalMargin),
      child: RaisedButton(
        child: Container(
          width: double.infinity,
          height: loginButtonHeight,
          alignment: Alignment.center,
          child: Text(
            loginButtonText,
          ),
        ),
        color: Colors.black,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(
            loginButtonRadius,
          ),
          side: BorderSide(
            color: Colors.white,
          ),
        ),
        onPressed: () {
          onPressed();
        },
      ),
    );
  }
}
