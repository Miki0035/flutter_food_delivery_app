import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/bottom_wave_clipper.dart';
import 'package:food_delivery_app/common/widgets/buttons/text_button.dart';
import 'package:food_delivery_app/features/authentication/login/providers/login_provider.dart';
import 'package:food_delivery_app/features/authentication/sign_up/screens/sign_up_screen.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_bar.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:food_delivery_app/utilis/validators/validator.dart';
import 'package:provider/provider.dart';

class LoginView extends StatelessWidget {
  const LoginView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<LoginProvider>();
    return Scaffold(
      extendBodyBehindAppBar: true,
      body:
          provider.isLoading
              ? Center(child: CircularProgressIndicator(color: FColor.orange))
              : SingleChildScrollView(
                child: Column(
                  children: [
                    Stack(
                      clipBehavior: Clip.none,
                      children: [
                        ClipPath(
                          clipper: BottomWaveClipper(),
                          child: Image.asset(
                            FImage.loginGraphic,
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
                        key: provider.loginFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: FSize.normalSpace,
                              ),
                              child: TextFormField(
                                controller: provider.emailTextController,
                                validator:
                                    (value) => FValidator.validateEmail(value),
                                cursorColor: FColor.orange,
                                decoration: InputDecoration(
                                  labelText: "Email address",
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: FSize.normalSpace,
                              ),
                              child: TextFormField(
                                controller: provider.passwordTextController,
                                validator:
                                    (value) => FValidator.validateEmptyText(
                                      'Password',
                                      value,
                                    ),
                                cursorColor: FColor.orange,
                                obscureText: provider.obscureText,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed: () => provider.setObscureText(),
                                    icon: Icon(
                                      provider.obscureText
                                          ? Icons.visibility_off
                                          : Icons.visibility,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: FSize.defaultSpace),
                            FTextButton(
                              width:  MediaQuery.sizeOf(context).width * 0.8,
                              buttonText: "Login",
                              onPressed: () async {
                                final success = await provider.login();
                                if (success && context.mounted) {
                                  Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => FBottomNavBar(),
                                    ),
                                    (route) => false,
                                  );
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    SnackBar(
                                      content: Text(
                                        "Successfully signed in",
                                        style: TextStyle(
                                          fontWeight: FontWeight.w600,
                                          fontSize: FSize.fontSizeLg,
                                          color: Colors.white,
                                        ),
                                      ),
                                      backgroundColor: Colors.green,
                                    ),
                                  );
                                }
                              },
                            ),
                            SizedBox(height: FSize.defaultSpace),

                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  "Don't have an account?",
                                  style: TextStyle(fontWeight: FontWeight.w500),
                                ),
                                SizedBox(width: 4.0),
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushAndRemoveUntil(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => SignUpScreen(),
                                      ),
                                      (route) => false,
                                    );
                                  },
                                  child: Text(
                                    "Sign up",
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
