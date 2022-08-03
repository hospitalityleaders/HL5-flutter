class ExpertiseList {
	String? 71;
	String? 72;

	ExpertiseList({this.71, this.72});

	factory ExpertiseList.fromJson(Map<String, dynamic> json) => ExpertiseList(
				71: json['71'] as String?,
				72: json['72'] as String?,
			);

	Map<String, dynamic> toJson() => {
				'71': 71,
				'72': 72,
			};
}
