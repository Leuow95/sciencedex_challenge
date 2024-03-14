class Configuration {
  final String name;
  final DateTime startDate;
  final DateTime endDate;
  final int goal1;
  final int goal2;

  Configuration({
    required this.name,
    required this.startDate,
    required this.endDate,
    required this.goal1,
    required this.goal2,
  });

  factory Configuration.fromJson(Map<String, dynamic> json) {
    return Configuration(
      name: json["name"],
      startDate: json["startDate"],
      endDate: json["endDate"],
      goal1: json["goal1"],
      goal2: json["goal2"],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "name": name,
      "startDate": startDate,
      "endDate": endDate,
      "goal1": goal1,
      "goal2": goal2,
    };
  }
}
