import 'package:flutter/material.dart';
import 'package:tackizer/common/color_extension.dart';
import 'package:tackizer/view/login/sign_up_view.dart';

import '../../common/widgets/buttons/secondary_button.dart';

class SocialLoginView extends StatefulWidget {
  const SocialLoginView({super.key});

  @override
  State<SocialLoginView> createState() => _SocialLoginViewState();
}

class _SocialLoginViewState extends State<SocialLoginView> {
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
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: const BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("assets/images/apple_btn.png"),
                    ),
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/apple.png",
                          width: 18, height: 18),
                      const SizedBox(width: 8),
                      Text("Sign up with Apple",
                          style: TextStyle(
                              fontSize: 14,
                              fontWeight: FontWeight.w600,
                              color: TColor.white)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/google_btn.png"),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.white.withOpacity(0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/google.png",
                          width: 18, height: 18, color: TColor.gray),
                      const SizedBox(width: 8),
                      Text("Sign up with Google",
                          style: TextStyle(
                              color: TColor.gray,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  height: 50,
                  decoration: BoxDecoration(
                    image: const DecorationImage(
                      image: AssetImage("assets/images/fb_btn.png"),
                    ),
                    borderRadius: BorderRadius.circular(30),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.blue.withOpacity(0.35),
                        blurRadius: 10,
                        offset: const Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Image.asset("assets/images/fb.png",
                          width: 18, height: 18),
                      const SizedBox(width: 8),
                      Text("Sign up with Facebook",
                          style: TextStyle(
                              color: TColor.white,
                              fontSize: 14,
                              fontWeight: FontWeight.w600)),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 20),
              Text(
                "or",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: TColor.white),
              ),
              const SizedBox(height: 20),
              SecondaryButton(
                  title: "Sign up with E-mail",
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => const SignUpView(),
                        ));
                  }),
              const SizedBox(height: 20),
              Text(
                "By registering, you agree to our Terms of Use. Learn how we collect, use and share your data.",
                textAlign: TextAlign.center,
                style: TextStyle(fontSize: 14, color: TColor.white),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
