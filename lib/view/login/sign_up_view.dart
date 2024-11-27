import 'package:flutter/material.dart';
import 'package:tackizer/common/widgets/buttons/primary_button.dart';
import 'package:tackizer/common/widgets/textfield/round_textfield.dart';

import '../../common/color_extension.dart';
import '../../common/widgets/buttons/secondary_button.dart';
import 'sign_in_view.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.sizeOf(context);
    return Scaffold(
      backgroundColor: TColor.gray80,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
          child: Column(
            children: [
              Image.asset("assets/images/app_logo.png",
                  width: media.width * 0.5, fit: BoxFit.cover),
              const Spacer(),
              RoundTextfield(
                  title: "E-mail address",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 15),
              RoundTextfield(
                  title: "Password",
                  controller: passwordController,
                  obsureText: true),
              const SizedBox(height: 20),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      height: 5,
                      margin: const EdgeInsets.symmetric(horizontal: 1),
                      decoration: BoxDecoration(color: TColor.gray70),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Text(
                    "Use 8 or more characters with a mix of letters,\nnumbers & symbols",
                    style: TextStyle(fontSize: 14, color: TColor.gray50),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              PrimaryButton(title: "Get Started, it's free", onTap: () {}),
              const Spacer(),
              Text(
                "Do you already have an account?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: TColor.white),
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                  title: "Sign In",
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const SignInView(),
                      ),
                    );
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
