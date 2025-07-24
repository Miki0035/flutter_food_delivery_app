import 'dart:ui';

class HomeListItem {
  final int index;
  final String name;
  final String image;
  final Color backgroundColor;
  final String lowerTitle;

  HomeListItem({
    required this.index,
    required this.name,
    required this.image,
    required this.lowerTitle,
    required this.backgroundColor,
  });
}
