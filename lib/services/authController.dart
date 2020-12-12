import 'package:firebase_auth/firebase_auth.dart';
import 'package:social_meet_up/Modals/users.dart';

class AuthController {
  final FirebaseAuth auth = FirebaseAuth.instance;
  String activeUserId;

  Users createUser(FirebaseUser firebaseUser) {
    return firebaseUser == null ? null : Users.createUser(firebaseUser);
  }

  Stream<Users> get authchanged {
    return auth.onAuthStateChanged.map(createUser);
  }

  Future<Users> createEmailAndPassword(String email, String password) async {
    var authSingUp = await auth.createUserWithEmailAndPassword(
        email: email, password: password);
    return Users.createUser(authSingUp.user);
  }

  Future<Users> loginEmailAndPassword(String email, String password) async {
    var authSingIn =
        await auth.signInWithEmailAndPassword(email: email, password: password);
    return Users.createUser(authSingIn.user);
  }

  Future<Users> exitEmailAndPassword() async {
    await auth.signOut();
  }
}
