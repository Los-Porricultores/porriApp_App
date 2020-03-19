import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:porri_app/resources/constants/imagePaths.dart';
import 'package:porri_app/src/controllers/loginController.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/streams/streamsController.dart';

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
                    _loginInputWidget(
                      label: emailInputLabel,
                      controller: sl<LoginController>().usernameController,
                    ),
                    _loginInputWidget(
                      label: passwordInputLabel,
                      controller: sl<LoginController>().passwordController,
                    ),
                    _errorMessageWidget(),
                  ],
                ),
              ),
            ),
            _loginButtonWidget(
              onPressed: () {
                sl<LoginController>().sendLogin();
              },
            ),
          ],
        ),
      ),
    );
  }

  Widget _loginInputWidget(
      {@required String label, @required TextEditingController controller}) {
    return TextField(
      controller: controller,
      decoration: InputDecoration(labelText: label),
      inputFormatters: [BlacklistingTextInputFormatter(RegExp("[ ]"))],
    );
  }

  Widget _errorMessageWidget() {
    return StreamBuilder<String>(
      stream: sl<StreamsController>().registerValidationErrorStream.stream,
      initialData: null,
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        return Container(
          alignment: Alignment.center,
          height: snapshot.data != null ? 150 : 0,
          child: snapshot.data != null
              ? Text(
                  snapshot.data,
                  style: TextStyle(
                    color: Colors.deepPurpleAccent,
                    fontSize: 15,
                  ),
                )
              : null,
        );
      },
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
