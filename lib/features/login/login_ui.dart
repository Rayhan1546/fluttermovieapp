import 'dart:ui';

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/common/widgets/primary_pass_field.dart';
import 'package:mymovieapp/common/widgets/primary_text_field.dart';
import 'package:mymovieapp/features/login/login_viewmodel.dart';
import 'package:mymovieapp/features/registation/registation_ui.dart';

class LoginUi extends StatelessWidget {
  LoginUi({super.key});

  LoginViewModel viewModel = LoginViewModel();

  @override
  Widget build(BuildContext context) {
    viewModel.shouldNavigate.addListener(() {
      if (viewModel.shouldNavigate.value == true) {
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => RegistationUI(),
          )
        );
      }
    });
    return SafeArea(
      child: Scaffold(
        body: Container(
          height: MediaQuery.of(context).size.height,
          color: Colors.black87,
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: SingleChildScrollView(
            child: Column(
              children: [
                const SizedBox(
                  height: 60,
                ),
                const Text(
                  'Welcome Back!',
                  style: TextStyle(fontSize: 30, color: Colors.white, fontWeight: FontWeight.bold),
                ),
                const SizedBox(height: 10,),
                const Text(
                  'Please sign in to your account',
                  style: TextStyle(fontSize: 16, color: Colors.white),
                ),
                const SizedBox(
                  height: 80,
                ),
                ValueListenableBuilder(
                  valueListenable: viewModel.emailcontroller,
                  builder: (BuildContext context, emailcontroller, _) {
                    return PrimaryTextField(
                      errortext: viewModel.getEmailError(),
                      controller: viewModel.emailcontroller,
                      label: 'username or email',
                    );
                  },
                ),
                const SizedBox(
                  height: 20,
                ),
                ValueListenableBuilder<bool>(
                  valueListenable: viewModel.obsecuretext,
                  builder: (context, value1, child) {
                    return ValueListenableBuilder(
                      valueListenable: viewModel.passcontroller,
                      builder: (context, passcontroller, _) {
                        return PrimaryPassField(
                          controller: viewModel.passcontroller,
                          obsecurebool: value1,
                          onpressed: () {
                            viewModel.obsecureiconclick();
                          },
                          errortext: viewModel.getPasswordError(),
                          label: 'password',
                        );
                      },
                    );
                  },
                ),
                const SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: RichText(
                      text: TextSpan(
                    text: "forget password?",
                    recognizer: TapGestureRecognizer()
                      ..onTap = () {
                        print('hello forgetter');
                      },
                  )),
                ),
                const SizedBox(
                  height: 120,
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedBtn(
                      buttonText: 'Sign In',
                      backgroundColor: Colors.blue,
                      onPressed: () {
                        String? toastmessage = viewModel.signInvalidation();
                        CustomSnackbar.show(context, toastmessage!);
                      },
                      textcolor: Colors.white),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  height: 60,
                  width: MediaQuery.of(context).size.width,
                  child: ElevatedBtn(
                      buttonText: 'Sign in with Google',
                      backgroundColor: Colors.white,
                      onPressed: () {},
                      textcolor: Colors.black),
                ),
                const SizedBox(
                  height: 25,
                ),
                RichText(
                  text: TextSpan(
                    text: "Don't have an account? ",
                    style: const TextStyle(fontSize: 16),
                    children: [
                      TextSpan(
                        text: 'Sign Up',
                        style: const TextStyle(fontWeight: FontWeight.bold),
                        recognizer: TapGestureRecognizer()
                          ..onTap = () {
                            print('hello ontap');
                          },
                      ),
                    ],
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
