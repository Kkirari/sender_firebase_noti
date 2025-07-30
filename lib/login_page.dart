import 'package:flutter/material.dart';
import 'package:google_sign_in/google_sign_in.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final GoogleSignIn _googleSignIn = GoogleSignIn.instance;

  GoogleSignInAccount? _user;

  Future<void> _handleSignIn() async {
    try {
      final account = await _googleSignIn.signIn();
      setState(() {
        _user = account;
      });
    } catch (error) {
      print("Sign in failed: $error");
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text("Login Page")),
      body: Center(
        child: _user == null
            ? ElevatedButton(
                onPressed: _handleSignIn,
                child: const Text("Sign in with Google"),
              )
            : Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                    backgroundImage: NetworkImage(_user!.photoUrl ?? ""),
                    radius: 40,
                  ),
                  const SizedBox(height: 10),
                  Text("Hello, ${_user!.displayName}"),
                  const SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: () async {
                      await _googleSignIn.signOut();
                      setState(() {
                        _user = null;
                      });
                    },
                    child: const Text("Sign Out"),
                  ),
                ],
              ),
      ),
    );
  }
}
