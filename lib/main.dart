import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/main.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/models/session.dart';
import 'package:porri_app/src/pages/login.dart';
import 'package:porri_app/src/pages/splash.dart';
import 'package:porri_app/src/states/session.dart';
import 'package:porri_app/src/widgets/fullLoader.dart';

void main() {
  // main controller
  mainController.init();

  // run app
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primaryColor: Colors.white,
        backgroundColor: Colors.black,
        scaffoldBackgroundColor: Colors.black,
        brightness: Brightness.dark,
        accentColor: Colors.white,
      ),
      home: StreamBuilder<bool>(
        stream: mainController.initCompleteStream.stream,
        initialData: false,
        builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
          if (snapshot.hasData && snapshot.data) {
            return StreamBuilder<bool>(
              stream: mainController.fullLoaderStream.stream,
              initialData: false,
              builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
                if (!snapshot.data) {
                  return StreamBuilder<SessionModel>(
                    stream: sl<SessionState>().updatedSessionStream.stream,
                    initialData: sl<SessionState>().sessionModel,
                    builder: (BuildContext context,
                        AsyncSnapshot<SessionModel> snapshot) {
                      if (snapshot.hasData && snapshot.data != null) {
                        mainController.hideFullLoader();
                        return MyHomePage(title: 'Flutter Demo Home Page');
                      }

                      return Login();
                    },
                  );
                }

                return FullLoader();
              },
            );
          }

          return Splash();
        },
      ),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.display1,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: Icon(Icons.add),
      ),
    );
  }
}
