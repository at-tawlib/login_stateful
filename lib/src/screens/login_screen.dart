// Stateful, Column, EdgeInsets, Form, GlobalKey, Validator
// ElevatedButton,
import 'package:flutter/material.dart';
import '../mixins/validation_mixin.dart';

class LoginScreen extends StatefulWidget {
  @override
  createState() {
    return LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> with ValidationMixin {
  final formKey = GlobalKey<FormState>();

  String email = '';
  String password = '';

  @override
  Widget build(context) {
    return Container(
      margin: const EdgeInsets.all(20.0),
      child: Form(
        key: formKey,
        child: Column(
          children: [
            Container(margin: const EdgeInsets.only(top: 25.0)),
            emailField(),
            passwordField(),
            // use container to add space between widgets instead of adding the margin to the widget itself
            Container(margin: const EdgeInsets.only(top: 25.0)),
            submitButton(),
          ],
        ),
      ),
    );
  }

  Widget emailField() {
    return TextFormField(
      keyboardType: TextInputType.emailAddress,
      decoration: const InputDecoration(
        labelText: 'Email Address',
        hintText: 'you@example.com',
      ),
      validator: validateEmail,
      onSaved: (value) {
        email = value!;
      },
    );
  }


  Widget passwordField() {
    return TextFormField(
      obscureText: true,
      decoration: const InputDecoration(
        labelText: 'Enter Password',
        hintText: 'Password',
      ),
      validator: validatePassword,
      onSaved: (value) {
        password = value!;
      },
    );
  }

 

  Widget submitButton() {
    return ElevatedButton(
      child: const Text('Submit!'),
      onPressed: () {
        // formKey.currentState?.reset();
        if (formKey.currentState!.validate()) {
          formKey.currentState!.save();
          print("Time to post $email and $password to my API");
        }
      },
    );
  }
}
