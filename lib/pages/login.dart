import 'package:flutter/gestures.dart';
import "package:flutter/material.dart";
import 'package:private_upload/auth/privateprovider.dart';
import 'package:private_upload/pages/home.dart';
import 'package:private_upload/pages/signup.dart';
import 'package:provider/provider.dart';

class Login extends StatefulWidget {
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _email = TextEditingController();
  final TextEditingController _password = TextEditingController();
  Future<void> login(BuildContext context, VoidCallback onSuccess) async {
    try {
      PrivateProvider state =
          Provider.of<PrivateProvider>(context, listen: false);
      await state.login(_email.text, _password.text);
      onSuccess.call();
    } catch (e) {
      rethrow;
    }
  }

  @override
  Widget build(BuildContext context) {
    Color hexToColor(String code) {
      // ignore: unnecessary_new
      return new Color(int.parse(code.substring(1, 7), radix: 16) + 0xFF000000);
    }

    return MaterialApp(
        debugShowCheckedModeBanner: false,
        home: Material(
            child: Container(
                padding: const EdgeInsets.all(30.0),
                color: Colors.white,
                child: Center(
                    child: Column(children: [
                  const Padding(padding: EdgeInsets.only(top: 140.0)),
                  Text(
                    'Sign in',
                    style:
                        TextStyle(color: hexToColor("#F2A03D"), fontSize: 25.0),
                  ),
                  const Padding(padding: EdgeInsets.only(top: 50.0)),
                  TextFormField(
                    controller: _email,
                    decoration: InputDecoration(
                      labelText: "Enter Email",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Name cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  TextFormField(
                    controller: _password,
                    obscureText: true,
                    decoration: InputDecoration(
                      labelText: "Enter Password",
                      fillColor: Colors.white,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(25.0),
                        borderSide: const BorderSide(),
                      ),
                      //fillColor: Colors.green
                    ),
                    validator: (val) {
                      if (val!.isEmpty) {
                        return "Name cannot be empty";
                      } else {
                        return null;
                      }
                    },
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                      fontFamily: "Poppins",
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Consumer<PrivateProvider>(
                    builder: (context, state, child) {
                      return Align(
                        alignment: Alignment.center,
                        child: FloatingActionButton.extended(
                          onPressed: () => login(context, () {
                            if (state.isLoggedin == true) return;
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      const Homepage(title: "Home"),
                                ));
                          }),
                          label: const Text('Log  in'),
                          backgroundColor: hexToColor("#F2A03D"),
                        ),
                      );
                    },
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Expanded(
                    child: Text.rich(TextSpan(children: [
                      const TextSpan(text: "New to Swagga?"),
                      TextSpan(
                          text: " Sign Up!",
                          style: const TextStyle(color: Colors.blue),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => const Signup()));
                            })
                    ])),
                  )
                ])))));
  }
}
