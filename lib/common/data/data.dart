import 'package:food_delivery_app/common/data/models/home_list_item_model.dart';
import 'package:food_delivery_app/utilis/constants/colors.dart';
import 'package:food_delivery_app/utilis/constants/images.dart';

final List<HomeListItem> homeListItems = [
  HomeListItem(
    index: 0,
    name: 'summer combo'.toUpperCase(),
    image: FImage.burgerOne,
    lowerTitle: '\$10.88',
    backgroundColor: FColor.darkRed,
  ),
  HomeListItem(
    index: 1,
    name: 'burgers'.toUpperCase(),
    image: FImage.burgerTwo,
    lowerTitle: FImage.arrowRight,
    backgroundColor: FColor.lightOrange,
  ),
  HomeListItem(
    index: 2,

    name: 'pizza'.toUpperCase(),
    image: FImage.pizzaOne,
    lowerTitle: FImage.arrowRight,
    backgroundColor: FColor.darkGreen,
  ),
  HomeListItem(
    index: 3,

    name: 'burrito'.toUpperCase(),
    image: FImage.buritto,
    lowerTitle: FImage.arrowRight,
    backgroundColor: FColor.orange,
  ),
];
