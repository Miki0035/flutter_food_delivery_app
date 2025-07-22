import 'package:flutter/material.dart';
import 'package:food_delivery_app/common/data/models/HomeListItem.dart';
import 'package:food_delivery_app/utilis/constants/sizes.dart';

class FHomeMenuItemContainer extends StatelessWidget {
  final HomeListItem item;

  const FHomeMenuItemContainer({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return Material(
      child: InkWell(
        onTap: () {},
        borderRadius: BorderRadius.circular(12.0),
        splashColor: Colors.redAccent.withValues(alpha: 0.8),
        child: Ink(
          width: 220,
          height: 190,

          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12.0),
            color: item.backgroundColor,
          ),
          child: Row(
            textDirection:
                item.index % 2 == 0 ? TextDirection.ltr : TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              // LEFT SIDE
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: FSize.defaultSpace),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.w900,
                          fontFamily: 'Rubik',
                          fontSize: FSize.fontSizeLg * 1.6,
                          color: Colors.white,
                        ),
                      ),
                      item.index == 0
                          ? SizedBox(height: FSize.spaceBtw)
                          : SizedBox(height: FSize.normalSpace),

                      item.index == 0
                          ? Text(
                            item.lowerTitle,
                            style: TextStyle(
                              fontWeight: FontWeight.w900,
                              fontFamily: 'Rubik',
                              fontSize: FSize.fontSizeLg * 1.5,
                              color: Colors.white,
                            ),
                          )
                          : Image.asset(
                            item.lowerTitle,
                            fit: BoxFit.contain,
                            width: FSize.iconXl * 1.2,
                            height: FSize.iconXl * 1.2,
                          ),
                    ],
                  ),
                ),
              ),
              // RIGHT SIDE
              Expanded(
                flex: 3,
                child: Image.asset(item.image, fit: BoxFit.contain),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
