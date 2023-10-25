import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:testmasuk2/utils/routes/approutes.dart';
import 'package:testmasuk2/views/widgets/confirm_dialog.dart';

class AuthController extends GetxController {
  final _auth = FirebaseAuth.instance;

  Future<UserCredential> signInWithGoogle() async {
    // Trigger the authentication flow
    final GoogleSignInAccount? googleUser = await GoogleSignIn().signIn();

    // Obtain the auth details from the request
    final GoogleSignInAuthentication? googleAuth =
        await googleUser?.authentication;

    // Create a new credential
    final credential = GoogleAuthProvider.credential(
      accessToken: googleAuth?.accessToken,
      idToken: googleAuth?.idToken,
    );

    // Once signed in, return the UserCredential
    Get.offAllNamed(AppRoutes.homeRoute);
    return await FirebaseAuth.instance.signInWithCredential(credential);
  }

  logoutNow() {
    print("Signin out");
    _auth.signOut();
  }
}
