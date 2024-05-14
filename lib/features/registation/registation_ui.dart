import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:mymovieapp/common/widgets/custom_snack_bar.dart';
import 'package:mymovieapp/common/widgets/elevated_btn.dart';
import 'package:mymovieapp/common/widgets/primary_pass_field.dart';
import 'package:mymovieapp/common/widgets/primary_text_field.dart';
import 'package:mymovieapp/features/registation/registation_viewmodel.dart';

class RegistationUI extends StatelessWidget {
  RegistationUI({super.key});

  RegistationViewModel viewModel = RegistationViewModel();

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        color: Colors.black87,
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(horizontal: 20),
        child: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 80,
              ),
              const Text(
                'Create an account',
                style: TextStyle(
                    fontSize: 30,
                    color: Colors.white,
                    fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 10,
              ),
              const Text(
                'Please fill the form to continue',
                style: TextStyle(fontSize: 16, color: Colors.white),
              ),
              const SizedBox(
                height: 40,
              ),
              PrimaryTextField(
                errortext: null,
                controller: viewModel.nameController,
                label: 'Full Name',
              ),
              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder(
                valueListenable: viewModel.emailController,
                builder: (BuildContext context, emailController, _) {
                  return PrimaryTextField(
                    errortext: viewModel.emailError(),
                    controller: viewModel.emailController,
                    label: 'Email',
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: viewModel.obsecureText1,
                builder: (context, value, child) {
                  return ValueListenableBuilder(
                    valueListenable: viewModel.passwordF1Controller,
                    builder: (context, passwordF1Controller, _) {
                      return PrimaryPassField(
                        controller: viewModel.passwordF1Controller,
                        obsecurebool: value,
                        onpressed: () {
                          viewModel.showPasswordF1();
                        },
                        errortext: viewModel.passwordErrorF1(),
                        label: 'Password',
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 15,
              ),
              ValueListenableBuilder<bool>(
                valueListenable: viewModel.obsecureText2,
                builder: (context, value, child) {
                  return ValueListenableBuilder(
                    valueListenable: viewModel.passwordF2Controller,
                    builder: (context, passwordF2Ccontroller, _) {
                      return PrimaryPassField(
                        controller: viewModel.passwordF2Controller,
                        obsecurebool: value,
                        onpressed: () {
                          viewModel.showPasswordF2();
                        },
                        errortext: viewModel.passwordErrorF2(),
                        label: 'Confirm Password',
                      );
                    },
                  );
                },
              ),
              const SizedBox(
                height: 100,
              ),
              SizedBox(
                height: 60,
                width: MediaQuery.of(context).size.width,
                child: ElevatedBtn(
                  buttonText: 'Sign Up',
                  backgroundColor: Colors.blue,
                  onPressed: () {
                    viewModel.onClickedSignUp();
                    CustomSnackbar.show(context, viewModel.errorSnackbarMsg.value);
                  },
                  textcolor: Colors.white,
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              RichText(
                text: TextSpan(
                  text: "have an account? ",
                  style: const TextStyle(fontSize: 16),
                  children: [
                    TextSpan(
                      text: 'Sign In',
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
    ));
  }
}
