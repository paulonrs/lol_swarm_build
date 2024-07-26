class HeroJsonItem {
  final String name;
  final String imageUrl;
  final String primaryWeapon;

  HeroJsonItem(
      {required this.name,
      required this.imageUrl,
      required this.primaryWeapon});

  factory HeroJsonItem.fromJson(Map<String, dynamic> json) {
    return HeroJsonItem(
      name: json['name'],
      imageUrl: json['imageUrl'],
      primaryWeapon: json['primaryWeapon'],
    );
  }
}
