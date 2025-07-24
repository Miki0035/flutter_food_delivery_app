import 'package:food_delivery_app/common/data/models/home_list_item_model.dart';
import 'package:food_delivery_app/common/data/models/profile_list_tile_model.dart';
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

final List<FProfileListTileModel> profileListTile = [
  FProfileListTileModel(
    label: "Full Name",
    value: "Mikiyas Kebede",
    icon: FImage.user,
  ),
  FProfileListTileModel(
    label: "Email",
    value: "mk@microsoft.com",
    icon: FImage.envelope,
  ),
  FProfileListTileModel(
    label: "Phone number",
    value: "+1 555 123 4567",
    icon: FImage.phone,
  ),
  FProfileListTileModel(
    label: "Address 1 - (Home)",
    value: "123 Mainstreet, NY",
    icon: FImage.location,
  ),
  FProfileListTileModel(
    label: "Address 2 - (Work)",
    value: "123 Mainstreet, NY",
    icon: FImage.location,
  ),
];
