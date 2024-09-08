


import 'package:firebase_auth/firebase_auth.dart';
import 'package:health_app/utils/app_print.dart';

class PhoneAuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> verifyPhoneNumber(
      String phoneNumber,
      Function(String verificationId) onCodeSent,
      Function(String error) onVerificationFailed,
      ) async {
    await _auth.verifyPhoneNumber(
      timeout: Duration(minutes: 1),
      phoneNumber: phoneNumber,
      verificationCompleted: (PhoneAuthCredential credential) async {
        await _auth.signInWithCredential(credential);
      },
      verificationFailed: (FirebaseAuthException e) {
        onVerificationFailed(e.message ?? "Verification failed");
      },
      codeSent: (String verificationId, int? resendToken) {
        onCodeSent(verificationId);
      },
      codeAutoRetrievalTimeout: (String verificationId) {
        appDebugPrint('verificationId $verificationId');
      },
    );
  }

  Future<void> signInWithSmsCode(String verificationId, String smsCode) async {
    PhoneAuthCredential credential = PhoneAuthProvider.credential(
      verificationId: verificationId,
      smsCode: smsCode,
    );
    await _auth.signInWithCredential(credential);
  }
}