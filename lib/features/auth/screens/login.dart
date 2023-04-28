import 'package:fcb_donate/features/auth/screens/signup_screen.dart';
import 'package:fcb_donate/features/auth/services/auth_services.dart';
import 'package:fcb_donate/utils/costom_textfield.dart';
import 'package:flutter/material.dart';

import '../../../utils/button.dart';

// ignore: must_be_immutable
class Login extends StatefulWidget {
  static const routeName = "/login";
  const Login({super.key});

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();

  final TextEditingController _passwordController = TextEditingController();

  final _loginkey = GlobalKey<FormState>();

  AuthServices authServices = AuthServices();

  bool isLogin = false;

  void loginUser(String email, String password) async {
    setState(() {
      isLogin = true;
    });
    await authServices.signInUser(
        email: email, password: password, context: context);
    setState(() {
      isLogin = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return GestureDetector(
      
      child: Scaffold(
        body: SingleChildScrollView(
          child: Container(
            constraints:
                BoxConstraints(maxHeight: size.height, maxWidth: size.width),
            decoration: BoxDecoration(
              gradient: LinearGradient(
                  colors: [Colors.blue[800]!, Colors.blue[400]!],
                  begin: Alignment.topLeft,
                  end: Alignment.topRight),
            ),
            child: Column(
              children: [
                Expanded(
                  flex: 2,
                  child: SafeArea(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: const [
                        Text(
                          "Login",
                          style: TextStyle(
                              fontSize: 30,
                              fontWeight: FontWeight.bold,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                        Text(
                          "Welcome back to FBC",
                          style: TextStyle(
                              fontSize: 20,
                              fontWeight: FontWeight.w400,
                              color: Colors.white),
                        ),
                        SizedBox(
                          height: 10,
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 5,
                  child: Container(
                    decoration: const BoxDecoration(
                      boxShadow: [
                        BoxShadow(
                            color: Colors.white,
                            offset: Offset.infinite,
                            blurRadius: 2)
                      ],
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topRight: Radius.circular(20),
                        topLeft: Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Form(
                        key: _loginkey,
                        child: Column(children: [
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                              hintText: "Email", controller: _emailController),
                          const SizedBox(
                            height: 20,
                          ),
                          CustomTextField(
                            hintText: "Password",
                            controller: _passwordController,
                            isPass: true,
                          ),
                          const SizedBox(
                            height: 20,
                          ),
                          GestureDetector(
                            onTap: () {
                              if (_loginkey.currentState!.validate()) {
                                loginUser(_emailController.text,
                                    _passwordController.text);
                              }
                            },
                            child: CustomButton(
                              widget: isLogin
                                  ? const CircularProgressIndicator(
                                      color: Colors.red,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                          fontSize: 16,
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Row(
                            children: [
                              const Text("Not have an Account?"),
                              TextButton(
                                  onPressed: () {
                                    Navigator.pushNamedAndRemoveUntil(context,
                                        SignUp.routeName, (route) => false);
                                  },
                                  child: const Text("Sign Up"))
                            ],
                          )
                        ]),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
