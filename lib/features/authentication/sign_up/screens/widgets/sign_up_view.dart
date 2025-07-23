import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/bottom_wave_clipper.dart';
import 'package:food_delivery_app/common/widgets/buttons/text_button.dart';
import 'package:food_delivery_app/features/authentication/login/screens/login_screen.dart';
import 'package:food_delivery_app/features/authentication/sign_up/providers/sign_up_provider.dart';
import 'package:food_delivery_app/features/authentication/sign_up/screens/widgets/popup_bottom_sheet_container.dart';
import 'package:food_delivery_app/features/home/screens/home.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:food_delivery_app/utilis/validators/validator.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatelessWidget {
  const SignUpView({super.key});

  @override
  Widget build(BuildContext context) {
    final provider = context.watch<SignUpProvider>();
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
                        key: provider.signUpFormKey,
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                vertical: FSize.normalSpace,
                              ),
                              child: TextFormField(
                                validator:
                                    (value) => FValidator.validateEmptyText(
                                      "Full Name",
                                      value,
                                    ),
                                controller: provider.fullNameTextController,
                                cursorColor: FColor.orange,
                                style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: FSize.fontSizeMd,
                                ),
                                decoration: InputDecoration(
                                  labelText: "Full Name",
                                ),
                              ),
                            ),
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
                                    (value) =>
                                        FValidator.validatePassword(value),
                                cursorColor: FColor.orange,
                                obscureText: provider.obscureText,
                                decoration: InputDecoration(
                                  labelText: "Password",
                                  suffixIcon: IconButton(
                                    onPressed: () => provider.setObscureText(),
                                    icon:
                                        provider.obscureText
                                            ? Icon(Icons.visibility_off)
                                            : Icon(Icons.visibility),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(height: FSize.defaultSpace),
                            FTextButton(
                              onPressed: () async {
                                // final success = await provider.signUp();
                                if (true && context.mounted) {
                                  showModalBottomSheet(
                                    context: context,
                                    builder:
                                        (context) => FPopUpBottomSheetContainer(
                                          onPressed: () {
                                            Navigator.pushAndRemoveUntil(
                                              context,
                                              MaterialPageRoute(
                                                builder:
                                                    (context) =>
                                                        const HomeScreen(),
                                              ),
                                              (route) => false,
                                            );
                                          },
                                        ),
                                  );
                                }
                              },
                              buttonText: 'Sign Up',
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
