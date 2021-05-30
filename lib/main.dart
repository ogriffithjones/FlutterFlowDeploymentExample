import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'auth/firebase_user_provider.dart';
import 'package:flutter_flow_deployment_example/login/login_widget.dart';
import 'package:flutter_flow_deployment_example/home_page/home_page_widget.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  // This widget is the root of your application.
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  Stream<FlutterFlowDeploymentExampleFirebaseUser> userStream;
  FlutterFlowDeploymentExampleFirebaseUser initialUser;

  @override
  void initState() {
    super.initState();
    userStream = flutterFlowDeploymentExampleFirebaseUserStream()
      ..listen((user) => initialUser ?? setState(() => initialUser = user));
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'FlutterFlow Deployment Example',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: initialUser == null
          ? const Center(
              child: CircularProgressIndicator(
                valueColor: AlwaysStoppedAnimation<Color>(Color(0xff4b39ef)),
              ),
            )
          : currentUser.loggedIn
              ? HomePageWidget()
              : LoginWidget(),
    );
  }
}
