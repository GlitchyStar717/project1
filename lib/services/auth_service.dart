import 'package:firebase_auth/firebase_auth.dart';
import 'package:google_sign_in/google_sign_in.dart';

class AuthService {
  //Google Sign In
  signInWithGoogle() async {
    //begin sign in
    final GoogleSignInAccount? gUser = await GoogleSignIn().signIn();
    //obtain authentication details
    final GoogleSignInAuthentication gAuth = await gUser!.authentication;
    //create new credential for user
    final credential = GoogleAuthProvider.credential(
      accessToken: gAuth.accessToken,
      idToken: gAuth.idToken,
    );
    //sign in
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }
}
