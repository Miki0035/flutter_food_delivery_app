import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/data.dart';
import 'package:food_delivery_app/common/widgets/buttons/image_as_icon_button.dart';
import 'package:food_delivery_app/common/widgets/sliver_app_bar.dart';
import 'package:food_delivery_app/features/authentication/login/screens/login_screen.dart';
import 'package:food_delivery_app/features/navigation/bottom_navigation_provider.dart';
import 'package:food_delivery_app/features/profile/providers/profile_provider.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/image_as_icon_container.dart';
import 'package:food_delivery_app/features/profile/screens/widgets/outlined_button.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';
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
                actions: [FImageAsIconButton(image: FImage.search)],
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
                        child: ListView.separated(
                          padding: EdgeInsets.zero,
                          physics: NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          separatorBuilder:
                              (context, index) => SizedBox(height: 4.0),
                          itemCount: profileListTile.length,
                          itemBuilder:
                              (_, index) => ListTile(
                                leading: FImageAsIconContainer(
                                  image: profileListTile[index].icon,
                                ),
                                title: Text(
                                  profileListTile[index].label,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w500,
                                    fontSize: FSize.fontSizeMd,
                                  ),
                                ),
                                subtitle: Text(
                                  profileListTile[index].value,
                                  style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: FSize.fontSizeLg,
                                  ),
                                ),
                              ),
                        ),
                      ),
                      SizedBox(height: FSize.defaultSpace * 1.5),
                      FOutlinedButton(
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
                      SizedBox(height: FSize.normalSpace),
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
