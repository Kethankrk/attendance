import 'package:attendance_app/helper/auth.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.goToRegister});

  final void Function() goToRegister;

  @override
  State<LoginPage> createState() => _LoginPage();
}

class _LoginPage extends State<LoginPage> {
  String _email = "";
  String _password = "";

  void emailState(String newValue) {
    setState(() {
      _email = newValue;
    });
  }

  void passwordState(String newValue) {
    setState(() {
      _password = newValue;
    });
  }

  Future<void> googleLogin() async {
    try {
      await Auth().singInWithGoogle();
    } on FirebaseAuthException catch (e) {
      print(e);
    }
  }

  Future<void> loginHandler() async {
    try {
      await Auth()
          .signInWithEmailAndPassword(email: _email, password: _password);
    } on FirebaseAuthException catch (e) {
      print("This is an error: $e");
    }
  }


  @override
  Widget build(context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: const Color.fromARGB(255, 22, 22, 22),
        body: Center(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(40.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Center(
                    child: Text(
                      "LOGIN",
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 32,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const SizedBox(
                    height: 40,
                  ),
                  emailInput(emailState),
                  const SizedBox(
                    height: 20,
                  ),
                  passwordInput(passwordState),
                  const SizedBox(
                    height: 20,
                  ),
                  fullWidthButton(loginHandler),
                  const Row(
                    children: [
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                          height: 50,
                          endIndent: 10,
                        ),
                      ),
                      Text(
                        "OR",
                        style: TextStyle(color: Colors.white),
                      ),
                      Expanded(
                        child: Divider(
                          thickness: 1,
                          color: Colors.white,
                          height: 50,
                          indent: 10,
                        ),
                      ),
                    ],
                  ),
                  loginWithGoogle(googleLogin),
                  const SizedBox(
                    height: 10,
                  ),
                  loginWithFacebook(),
                  TextButton(
                    onPressed: () {},
                    child: const Text(
                      "Forget password?",
                      style: TextStyle(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w400),
                    ),
                  ),
                  TextButton(
                    onPressed: () {widget.goToRegister();},
                    child: const Text(
                      "Don't have an account? Register Here!",
                    ),
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}

Widget emailInput(Function stateHandle) {
  return TextFormField(
    onChanged: (value) => stateHandle(value),
    style: const TextStyle(color: Colors.white),
    decoration: InputDecoration(
        contentPadding: const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
        enabledBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: const BorderSide(color: Colors.white),
          borderRadius: BorderRadius.circular(15),
        ),
        labelText: "email",
        labelStyle:
            const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
        prefixIcon: const Icon(
          Icons.email,
          color: Colors.blue,
        )),
  );
}

Widget passwordInput(Function passwordState) => TextFormField(
      onChanged: (value) => passwordState(value),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "password",
          labelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.blue,
          )),
    );

Widget fullWidthButton(
  Function loginHandler,
) =>
    SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          loginHandler();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.green,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Text(
          "LOGIN",
          style: TextStyle(color: Colors.white),
        ),
      ),
    );

Widget loginWithGoogle(Function googleLogin) => SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {
          googleLogin();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.google, color: Colors.black),
            SizedBox(
              width: 10,
            ),
            Text(
              "Login with google",
              style: TextStyle(color: Colors.black),
            ),
          ],
        ),
      ),
    );

Widget loginWithFacebook() => SizedBox(
      width: double.infinity,
      child: OutlinedButton(
        onPressed: () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(15.0),
          ),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(FontAwesomeIcons.facebook, color: Colors.white),
            SizedBox(
              width: 10,
            ),
            Text(
              "Login with facebook",
              style: TextStyle(color: Colors.white),
            ),
          ],
        ),
      ),
    );

Widget cPasswordInput(Function passwordState) => TextFormField(
      onChanged: (value) => passwordState(value),
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
          contentPadding:
              const EdgeInsets.symmetric(vertical: 1, horizontal: 2),
          enabledBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: const BorderSide(color: Colors.white),
            borderRadius: BorderRadius.circular(15),
          ),
          labelText: "conform password",
          labelStyle:
              const TextStyle(color: Colors.white, fontWeight: FontWeight.w300),
          prefixIcon: const Icon(
            Icons.lock,
            color: Colors.blue,
          )),
    );
