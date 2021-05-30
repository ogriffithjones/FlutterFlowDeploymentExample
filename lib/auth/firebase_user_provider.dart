import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';

class FlutterFlowDeploymentExampleFirebaseUser {
  FlutterFlowDeploymentExampleFirebaseUser(this.user);
  final User user;
  bool get loggedIn => user != null;
}

FlutterFlowDeploymentExampleFirebaseUser currentUser;
bool get loggedIn => currentUser?.loggedIn ?? false;
Stream<FlutterFlowDeploymentExampleFirebaseUser>
    flutterFlowDeploymentExampleFirebaseUserStream() => FirebaseAuth.instance
        .authStateChanges()
        .debounce((user) => user == null && !loggedIn
            ? TimerStream(true, const Duration(seconds: 1))
            : Stream.value(user))
        .map<FlutterFlowDeploymentExampleFirebaseUser>((user) =>
            currentUser = FlutterFlowDeploymentExampleFirebaseUser(user));
