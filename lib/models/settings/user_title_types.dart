class UserTitleTypes {
	String? 1;
	String? 2;
	String? 3;
	String? 4;
	String? 5;
	String? 6;
	String? 7;
	String? 8;
	String? 9;
	String? 10;
	String? 11;

	UserTitleTypes({
		this.1, 
		this.2, 
		this.3, 
		this.4, 
		this.5, 
		this.6, 
		this.7, 
		this.8, 
		this.9, 
		this.10, 
		this.11, 
	});

	factory UserTitleTypes.fromJson(Map<String, dynamic> json) {
		return UserTitleTypes(
			1: json['1'] as String?,
			2: json['2'] as String?,
			3: json['3'] as String?,
			4: json['4'] as String?,
			5: json['5'] as String?,
			6: json['6'] as String?,
			7: json['7'] as String?,
			8: json['8'] as String?,
			9: json['9'] as String?,
			10: json['10'] as String?,
			11: json['11'] as String?,
		);
	}



	Map<String, dynamic> toJson() => {
				'1': 1,
				'2': 2,
				'3': 3,
				'4': 4,
				'5': 5,
				'6': 6,
				'7': 7,
				'8': 8,
				'9': 9,
				'10': 10,
				'11': 11,
			};
}
