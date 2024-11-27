import 'package:flutter/material.dart';
import 'package:tackizer/view/login/sign_up_view.dart';
import 'package:tackizer/view/main_tab/main_tab_view.dart';

import '../../common/color_extension.dart';
import '../../common/widgets/buttons/primary_button.dart';
import '../../common/widgets/buttons/secondary_button.dart';
import '../../common/widgets/textfield/round_textfield.dart';

class SignInView extends StatefulWidget {
  const SignInView({super.key});

  @override
  State<SignInView> createState() => _SignInViewState();
}

class _SignInViewState extends State<SignInView> {
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  bool isRemember = false;
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
                  title: "E-mail Address",
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress),
              const SizedBox(height: 15),
              RoundTextfield(
                  title: "Password",
                  controller: passwordController,
                  obsureText: true),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isRemember = !isRemember;
                      });
                    },
                    child: Row(
                      children: [
                        Icon(
                            isRemember
                                ? Icons.check_box
                                : Icons.check_box_outline_blank_rounded,
                            size: 18,
                            color: TColor.gray50),
                        const SizedBox(width: 5),
                        Text(
                          "Remember Me",
                          style: TextStyle(fontSize: 14, color: TColor.gray50),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      TextButton(
                        onPressed: () {},
                        child: Text(
                          "Forgot Password?",
                          style: TextStyle(fontSize: 14, color: TColor.gray50),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
              PrimaryButton(
                  title: "Sign In",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const MainTabView(),
                        ));
                  }),
              const Spacer(),
              Text(
                "Don't have an account?",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: TColor.white),
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                  title: "Sign Up",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ));
                  }),
            ],
          ),
        ),
      ),
    );
  }
}
