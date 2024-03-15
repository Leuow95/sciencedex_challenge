class PeriodEntity {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final String category;
  final int goal1;
  final int goal2;

  PeriodEntity({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.category,
    required this.goal1,
    required this.goal2,
  });

  factory PeriodEntity.fromJson(Map<String, dynamic> json) {
    return PeriodEntity(
      name: json["name"] ?? "",
      startDate: DateTime.parse(json["startDate"]),
      endDate: DateTime.parse(json["endDate"]),
      category: json["category"] ?? "",
      goal1: json["goal1"] ?? "",
      goal2: json["goal2"] ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "startDate": startDate.toIso8601String(),
      "endDate": endDate.toIso8601String(),
      "category": category,
      "goal1": goal1,
      "goal2": goal2,
    };
  }
}
