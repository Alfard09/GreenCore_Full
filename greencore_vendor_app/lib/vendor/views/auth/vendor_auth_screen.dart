import 'package:firebase_auth/firebase_auth.dart' hide EmailAuthProvider;
import 'package:firebase_ui_auth/firebase_ui_auth.dart';
import 'package:flutter/material.dart';
import 'package:greencore_vendor_app/vendor/views/auth/vendor_login_screen.dart';
import 'auth_service.dart';
import 'package:greencore_vendor_app/vendor/views/auth/vendor_registration_screen.dart';

class VendorAuthScreen extends StatefulWidget {
  const VendorAuthScreen({super.key});

  @override
  State<VendorAuthScreen> createState() => _VendorAuthScreenState();
}

class _VendorAuthScreenState extends State<VendorAuthScreen> {
  @override
  Widget build(BuildContext context) {
    return StreamBuilder<User?>(
      stream: FirebaseAuth.instance.authStateChanges(),
      initialData: FirebaseAuth.instance.currentUser,
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          // return SignInScreen(
          //   providers: [
          //     EmailAuthProvider(),
          //     GoogleAuthProvider();
          //     PhoneAuthProvider();
          //   ],
          // );
          if (!snapshot.hasData) {
            return VendorLoginPage();
          }
        }
        return VendorRegistrationScreen();
        // FloatingActionButton.extended(
        //   onPressed: () {
        //     AuthService().signInWithGoogle();
        //   },
        //   label: Text('Signin with Google'),
        // );

        return ElevatedButton(
            onPressed: () async {
              await FirebaseAuth.instance.signOut();
            },
            child: Text('Signout'));
      },
    );
  }
}
