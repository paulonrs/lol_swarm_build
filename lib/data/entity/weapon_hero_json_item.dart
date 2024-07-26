class WeaponHeroJsonItem {
  final String hero;
  final String imageUrl;
  final String name;
  final String function;
  final List<String> scalesWith;
  final String evolution;

  WeaponHeroJsonItem(
      {required this.hero,
      required this.imageUrl,
      required this.name,
      required this.function,
      required this.scalesWith,
      required this.evolution});

  factory WeaponHeroJsonItem.fromJson(Map<String, dynamic> json) {
    List<String> scalesWithList = (json['scalesWith'] as List<dynamic>)
        .map((item) => item as String)
        .toList();

    return WeaponHeroJsonItem(
      hero: json["hero"],
      imageUrl: json["imageUrl"],
      name: json["name"],
      function: json["function"],
      scalesWith: scalesWithList,
      evolution: json["evolution"],
    );
  }
}
