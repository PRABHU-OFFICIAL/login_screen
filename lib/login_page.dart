import 'package:flutter/material.dart';
import 'package:login_screen/visit_again.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  bool clickBtn = false;
  String user = "User";

  final _formKey = GlobalKey<FormState>();

  formValidation(BuildContext context) async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        clickBtn = true;
      });
      await Future.delayed(const Duration(seconds: 1));
      await Navigator.of(context).push(MaterialPageRoute(
          builder: (BuildContext context) => const VisitAgain()));
      setState(() {
        clickBtn = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen Demo"),
      ),
      body: SingleChildScrollView(
        child: Form(
          key: _formKey,
          child: Column(
            children: [
              Image.asset(
                "images/login_image.jpg",
              ),
              const SizedBox(
                height: 20,
              ),
              Text(
                "Welcome $user",
                style: const TextStyle(
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                    color: Colors.red),
              ),
              Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 0, horizontal: 10),
                child: Column(
                  children: [
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Username",
                        label: Text("Username"),
                      ),
                      onChanged: (value) {
                        setState(() {
                          user = value;
                        });
                      },
                      validator: (value) {
                        if (value != null && value.toString().length == 0) {
                          return "Username can't be emoty";
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      decoration: const InputDecoration(
                        hintText: "Enter Password",
                        label: Text("Password"),
                      ),
                      validator: (value) {
                        if (value != null && value.toString().length == 0) {
                          return "Password can't be empty";
                        } else if (value.toString().length < 6) {
                          return "Password length must be atleast 6";
                        }
                        return null;
                      },
                      obscureText: true,
                    ),
                  ],
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              InkWell(
                onTap: () => formValidation(context),
                child: AnimatedContainer(
                  duration: const Duration(seconds: 1),
                  height: 50,
                  width: clickBtn ? 60 : 200,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(50),
                      color: Colors.cyan,
                      boxShadow: null),
                  child: clickBtn
                      ? const Icon(
                          Icons.done,
                          color: Colors.white,
                          size: 40,
                        )
                      : const Text(
                          "Log In",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 20,
                              fontWeight: FontWeight.bold),
                        ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
