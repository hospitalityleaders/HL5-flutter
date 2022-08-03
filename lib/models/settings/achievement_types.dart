class AchievementTypes {
	String? 1;
	String? 2;
	String? 3;
	String? 4;
	String? 5;

	AchievementTypes({this.1, this.2, this.3, this.4, this.5});

	factory AchievementTypes.fromJson(Map<String, dynamic> json) {
		return AchievementTypes(
			1: json['1'] as String?,
			2: json['2'] as String?,
			3: json['3'] as String?,
			4: json['4'] as String?,
			5: json['5'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'1': 1,
				'2': 2,
				'3': 3,
				'4': 4,
				'5': 5,
			};
}
