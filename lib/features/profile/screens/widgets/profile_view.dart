import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/features/authentication/login/screens/login_screen.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_provider.dart';
import 'package:food_delivery_app/features/profile/providers/profile_provider.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/outlined_button.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/profile_form_row_image_form_text_field.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
import 'package:food_delivery_app/utilis/validators/validator.dart';
import 'package:provider/provider.dart';

class ProfileView extends StatelessWidget {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    final navProvider = context.watch<FBottomNavBarProvider>();
    return Consumer<FProfileProvider>(
      builder: (context, provider, child) {
        if (provider.isLoading) {
          return Center(child: CircularProgressIndicator(color: FColor.orange));
        }
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              FSliverAppBar(
                leading: FImageAsIconButton(
                  image: FImage.arrowBack,
                  onPressed: () => navProvider.back(),
                ),
                title: Text(
                  'Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.w700,
                    fontSize: FSize.fontSizeLg,
                  ),
                ),
                centerTitle: true,
                actions: [
                  FImageAsIconButton(
                    image: FImage.search,
                    onPressed: () {
                      navProvider.changeIndex(1);
                    },
                  ),
                ],
              ),
              SliverToBoxAdapter(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(FSize.normalSpace),
                            child: CircleAvatar(
                              radius: FSize.iconXl * 1.2,
                              child: Image.asset(FImage.avatar),
                            ),
                          ),
                          Positioned(
                            right: 0,
                            bottom: 0,
                            child: FImageAsIconButton(
                              onPressed: () {},
                              image: FImage.pencil,
                              backgroundColor: FColor.orange,
                              iconColor: Colors.white,
                              iconSize: 8.0,
                            ),
                          ),
                        ],
                      ),
                      Container(
                        margin: EdgeInsets.symmetric(
                          horizontal: FSize.normalSpace,
                        ),
                        decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(12.0),
                        ),
                        child: Form(
                          key: provider.profileEditForm,
                          child: Column(
                            children: [
                              //FULL NAME
                              FProfileRowIconTextFormField(
                                image: provider.profileListTile[0].icon,
                                label: provider.profileListTile[0].label,
                                controller: provider.fullNameController,
                                validator:
                                    (value) => FValidator.validateEmptyText(
                                      "Full name",
                                      value,
                                    ),
                              ),
                              SizedBox(height: 4.0),
                              FProfileRowIconTextFormField(
                                image: provider.profileListTile[1].icon,
                                label: provider.profileListTile[1].label,
                                controller: provider.emailController,
                                validator:
                                    (value) => FValidator.validateEmail(value),
                              ),
                              SizedBox(height: 4.0),
                              FProfileRowIconTextFormField(
                                image: provider.profileListTile[2].icon,
                                label: provider.profileListTile[2].label,
                                controller: provider.phoneController,
                              ),
                              SizedBox(height: 4.0),
                              FProfileRowIconTextFormField(
                                image: provider.profileListTile[3].icon,
                                label: provider.profileListTile[3].label,
                                controller: provider.address1Controller,
                              ),
                              SizedBox(height: 4.0),
                              FProfileRowIconTextFormField(
                                image: provider.profileListTile[4].icon,
                                label: provider.profileListTile[4].label,
                                controller: provider.address2Controller,
                              ),
                              SizedBox(height: 4.0),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(height: FSize.defaultSpace * 1.5),
                      FOutlinedButton(
                        onPressed: () async {
                          final success = await provider.editProfile();
                          if (success && context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Successfully updated profile out",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: FSize.fontSizeLg,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.green,
                              ),
                            );
                          } else if (context.mounted) {
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Profile not updated, please try again",
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                    fontSize: FSize.fontSizeLg,
                                    color: Colors.white,
                                  ),
                                ),
                                backgroundColor: Colors.red,
                              ),
                            );
                          }
                        },
                        widget: Text(
                          "Edit Profile",
                          style: TextStyle(
                            fontWeight: FontWeight.w700,
                            fontSize: FSize.fontSizeLg,
                            color: FColor.orange,
                          ),
                        ),
                        backgroundColor: FColor.lightOrange.withValues(
                          alpha: 0.1,
                        ),
                        borderColor: FColor.orange,
                      ),
                      SizedBox(height: FSize.defaultSpace),
                      FOutlinedButton(
                        onPressed: () async {
                          final result = await provider.logout();
                          if (result && context.mounted) {
                            Navigator.pushAndRemoveUntil(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginScreen(),
                              ),
                              (result) => false,
                            );
                            ScaffoldMessenger.of(context).showSnackBar(
                              SnackBar(
                                content: Text(
                                  "Successfully logged out",
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
                        widget: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Image.asset(
                              FImage.logout,
                              width: FSize.iconMd,
                              height: FSize.iconMd,
                            ),
                            SizedBox(width: 4.0),
                            Text(
                              "Logout",
                              style: TextStyle(
                                fontWeight: FontWeight.w700,
                                color: FColor.lightRed,
                                fontSize: FSize.fontSizeLg,
                              ),
                            ),
                          ],
                        ),
                        backgroundColor: FColor.lightRed.withValues(alpha: 0.1),
                        borderColor: FColor.red,
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
