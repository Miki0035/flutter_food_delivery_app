enum CustomizationType { topping, option }

class FToppingOptionModel {
  final String image;
  final String name;
  final CustomizationType type;

  FToppingOptionModel({
    required this.image,
    required this.name,
    required this.type,
  });
}
