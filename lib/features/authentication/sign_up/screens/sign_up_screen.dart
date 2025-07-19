import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/bottom_wave_clipper.dart';
import 'package:food_delivery_app/features/authentication/login/screens/login_screen.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              clipBehavior: Clip.none,
              children: [
                ClipPath(
                  clipper: BottomWaveClipper(),
                  child: Image.asset(
                    FImage.loginGraphicTwo,
                    fit: BoxFit.fill,
                    width: double.infinity,
                    height: 430.0,
                  ),
                ),

                Positioned(
                  top: 360,
                  left: MediaQuery.sizeOf(context).width / 2 - 60,
                  child: Image.asset(
                    FImage.logo,
                    fit: BoxFit.contain,
                    width: 120.0,
                    height: 120.0,
                  ),
                ),
              ],
            ),

            Padding(
              padding: EdgeInsets.symmetric(
                horizontal: FSize.defaultSpace * 2,
                vertical: FSize.defaultSpace,
              ),
              child: Form(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: FSize.normalSpace,
                      ),
                      child: TextFormField(
                        cursorColor: FColor.orange,
                        style: TextStyle(
                          fontWeight: FontWeight.w600,
                          fontSize: FSize.fontSizeMd,
                        ),
                        decoration: InputDecoration(labelText: "Full Name"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: FSize.normalSpace,
                      ),
                      child: TextFormField(
                        cursorColor: FColor.orange,
                        decoration: InputDecoration(labelText: "Email address"),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(
                        vertical: FSize.normalSpace,
                      ),
                      child: TextFormField(
                        cursorColor: FColor.orange,
                        obscureText: true,
                        decoration: InputDecoration(labelText: "Password"),
                      ),
                    ),
                    SizedBox(height: FSize.defaultSpace),
                    SizedBox(
                      width: MediaQuery.sizeOf(context).width * 0.8,
                      child: TextButton(
                        onPressed: () {},
                        style: ElevatedButton.styleFrom(
                          backgroundColor: FColor.orange,
                          padding: EdgeInsets.symmetric(
                            vertical: FSize.normalSpace,
                          ),
                        ),
                        child: Text(
                          'Sign up',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: FSize.fontSizeLg,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: FSize.defaultSpace),

                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Text(
                          "Already have an account?",
                          style: TextStyle(fontWeight: FontWeight.w500),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (route) => false,
                            );
                          },
                          style: TextButton.styleFrom(
                            padding: EdgeInsets.zero,
                          ),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: FColor.orange,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
