class WeaponJsonItem {
  final String name;
  final String function;
  final String evolution;
  final List<String> scalesWith;

  WeaponJsonItem(
      {required this.name,
      required this.function,
      required this.evolution,
      required this.scalesWith});

  factory WeaponJsonItem.fromJson(Map<String, dynamic> json) {
    List<String> scalesWithList = (json['scalesWith'] as List<dynamic>)
        .map((item) => item as String)
        .toList();

    return WeaponJsonItem(
      name: json["name"],
      function: json["function"],
      evolution: json["evolution"],
      scalesWith: scalesWithList,
    );
  }
}
