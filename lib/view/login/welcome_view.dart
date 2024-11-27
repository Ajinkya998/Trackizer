import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:tackizer/common/widgets/buttons/secondary_button.dart';
import 'package:tackizer/view/login/sign_in_view.dart';
import 'package:tackizer/view/login/social_login.dart';

import '../../common/color_extension.dart';
import '../../common/widgets/buttons/primary_button.dart';

class WelcomeView extends StatefulWidget {
  const WelcomeView({super.key});

  @override
  State<WelcomeView> createState() => _WelcomeViewState();
}

class _WelcomeViewState extends State<WelcomeView> {
  @override
  void initState() {
    super.initState();
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.leanBack);
  }

  @override
  Widget build(BuildContext context) {
    Size media = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Stack(
        alignment: Alignment.topCenter,
        children: [
          Image.asset("assets/images/welcome_screen.png",
              width: media.width, height: media.height, fit: BoxFit.cover),
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset("assets/images/app_logo.png",
                      width: media.width * 0.5, fit: BoxFit.cover),
                  const Spacer(),
                  Text(
                    "Track your expenses effortlessly and take control of your finances. \nYour journey to smarter spending starts here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(color: TColor.white, fontSize: 14),
                  ),
                  const SizedBox(height: 30),
                  PrimaryButton(title: "Get Started", onTap: () {
                    Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const SocialLoginView(),
                          ),
                        );
                  }),
                  const SizedBox(height: 15),
                  SecondaryButton(
                      title: "I have an account",
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
        ],
      ),
    );
  }
}
