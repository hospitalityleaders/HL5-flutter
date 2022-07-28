class User {
  int? id;
  int? companyId;
  int? roleId;
  int? companyRoleId;
  int? countryId;
  int? userTitleTypesId;
  dynamic currencyId;
  dynamic contactNumberTypesId;
  dynamic maritalStatusId;
  dynamic genderId;
  int? currentMembershipGradeId;
  int? nextMembershipGradeId;
  String? slug;
  String? firstName;
  String? lastName;
  String? email;
  int? emailVisibility;
  bool? active;
  dynamic dateOfBirth;
  String? avatar;
  String? banner;
  String? professionalTitle;
  String? area;
  String? contactNumber;
  bool? contactNumberVisibility;
  int? contactableWhatsapp;
  int? contactableSms;
  String? website;
  bool? websiteVisibility;
  String? skype;
  bool? skypeVisibility;
  String? facebook;
  bool? facebookVisibility;
  String? twitter;
  bool? twitterVisibility;
  String? google;
  bool? googleVisibility;
  String? xing;
  bool? xingVisibility;
  String? linkedin;
  bool? linkedinVisibility;
  String? proxycurlWhodis;
  bool? allowRecruiterAccess;
  String? address1;
  String? address2;
  String? addressPostalCode;
  String? addressArea;
  String? workPermits;
  bool? relocate;
  String? nextJob;
  dynamic salaryExpectation;
  String? profileSummary;
  String? profileVideoTitle;
  String? profileVideoDescription;
  String? profileVideoUrl;
  int? membershipGradeLeaderPoints;
  int? membershipGradeNeededLeaderPoints;
  int? membershipGradePercentAccomplished;
  int? logins;
  dynamic lastLogin;
  bool? membershipGradeEligibility;
  String? matrixUid;
  dynamic matrixRoomSync;
  bool? allowApiLogin;
  String? embedSrc;
  String? fullName;
  String? expertiseString;
  String? activeStatus;
  String? avatarCdn;
  String? holedoUrl;
  String? totalExperience;

  User({
    this.id,
    this.companyId,
    this.roleId,
    this.companyRoleId,
    this.countryId,
    this.userTitleTypesId,
    this.currencyId,
    this.contactNumberTypesId,
    this.maritalStatusId,
    this.genderId,
    this.currentMembershipGradeId,
    this.nextMembershipGradeId,
    this.slug,
    this.firstName,
    this.lastName,
    this.email,
    this.emailVisibility,
    this.active,
    this.dateOfBirth,
    this.avatar,
    this.banner,
    this.professionalTitle,
    this.area,
    this.contactNumber,
    this.contactNumberVisibility,
    this.contactableWhatsapp,
    this.contactableSms,
    this.website,
    this.websiteVisibility,
    this.skype,
    this.skypeVisibility,
    this.facebook,
    this.facebookVisibility,
    this.twitter,
    this.twitterVisibility,
    this.google,
    this.googleVisibility,
    this.xing,
    this.xingVisibility,
    this.linkedin,
    this.linkedinVisibility,
    this.proxycurlWhodis,
    this.allowRecruiterAccess,
    this.address1,
    this.address2,
    this.addressPostalCode,
    this.addressArea,
    this.workPermits,
    this.relocate,
    this.nextJob,
    this.salaryExpectation,
    this.profileSummary,
    this.profileVideoTitle,
    this.profileVideoDescription,
    this.profileVideoUrl,
    this.membershipGradeLeaderPoints,
    this.membershipGradeNeededLeaderPoints,
    this.membershipGradePercentAccomplished,
    this.logins,
    this.lastLogin,
    this.membershipGradeEligibility,
    this.matrixUid,
    this.matrixRoomSync,
    this.allowApiLogin,
    this.embedSrc,
    this.fullName,
    this.expertiseString,
    this.activeStatus,
    this.avatarCdn,
    this.holedoUrl,
    this.totalExperience,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
        id: json['id'] as int?,
        companyId: json['company_id'] as int?,
        roleId: json['role_id'] as int?,
        companyRoleId: json['company_role_id'] as int?,
        countryId: json['country_id'] as dynamic,
        userTitleTypesId: json['user_title_types_id'] as dynamic,
        currencyId: json['currency_id'] as dynamic,
        contactNumberTypesId: json['contact_number_types_id'] as dynamic,
        maritalStatusId: json['marital_status_id'] as dynamic,
        genderId: json['gender_id'] as dynamic,
        currentMembershipGradeId: json['current_membership_grade_id'] as int?,
        nextMembershipGradeId: json['next_membership_grade_id'] as int?,
        slug: json['slug'] as String?,
        firstName: json['first_name'] as String?,
        lastName: json['last_name'] as String?,
        email: json['email'] as String?,
        emailVisibility: json['email_visibility'] as int?,
        active: json['active'] as bool?,
        dateOfBirth: json['date_of_birth'] as dynamic,
        avatar: json['avatar'] as String?,
        banner: json['banner'] as String?,
        professionalTitle: json['professional_title'] as String?,
        area: json['area'] as String?,
        contactNumber: json['contact_number'] as String?,
        contactNumberVisibility: json['contact_number_visibility'] as bool?,
        contactableWhatsapp: json['contactable_whatsapp'] as int?,
        contactableSms: json['contactable_sms'] as int?,
        website: json['website'] as String?,
        websiteVisibility: json['website_visibility'] as bool?,
        skype: json['skype'] as String?,
        skypeVisibility: json['skype_visibility'] as bool?,
        facebook: json['facebook'] as String?,
        facebookVisibility: json['facebook_visibility'] as bool?,
        twitter: json['twitter'] as String?,
        twitterVisibility: json['twitter_visibility'] as bool?,
        google: json['google'] as String?,
        googleVisibility: json['google_visibility'] as bool?,
        xing: json['xing'] as String?,
        xingVisibility: json['xing_visibility'] as bool?,
        linkedin: json['linkedin'] as String?,
        linkedinVisibility: json['linkedin_visibility'] as bool?,
        proxycurlWhodis: json['proxycurl_whodis'] as String?,
        allowRecruiterAccess: json['allow_recruiter_access'] as bool?,
        address1: json['address_1'] as String?,
        address2: json['address_2'] as String?,
        addressPostalCode: json['address_postal_code'] as String?,
        addressArea: json['address_area'] as String?,
        workPermits: json['work_permits'] as String?,
        relocate: json['relocate'] as bool?,
        nextJob: json['next_job'] as String?,
        salaryExpectation: json['salary_expectation'] as dynamic,
        profileSummary: json['profile_summary'] as String?,
        profileVideoTitle: json['profile_video_title'] as String?,
        profileVideoDescription: json['profile_video_description'] as String?,
        profileVideoUrl: json['profile_video_url'] as String?,
        membershipGradeLeaderPoints:
            json['membership_grade_leader_points'] as int?,
        membershipGradeNeededLeaderPoints:
            json['membership_grade_needed_leader_points'] as int?,
        membershipGradePercentAccomplished:
            json['membership_grade_percent_accomplished'] as int?,
        logins: json['logins'] as int?,
        lastLogin: json['last_login'] as dynamic,
        membershipGradeEligibility:
            json['membership_grade_eligibility'] as bool?,
        matrixUid: json['matrix_uid'] as String?,
        matrixRoomSync: json['matrix_room_sync'] as dynamic,
        allowApiLogin: json['allow_api_login'] as bool?,
        embedSrc: json['embed_src'] as String?,
        fullName: json['full_name'] as String?,
        expertiseString: json['expertise_string'] as String?,
        activeStatus: json['active_status'] as String?,
        avatarCdn: json['avatar_cdn'] as String?,
        holedoUrl: json['holedo_url'] as String?,
        totalExperience: json['total_experience'] as String?,
      );

  Map<String, dynamic> toJson() => {
        'id': id,
        'company_id': companyId,
        'role_id': roleId,
        'company_role_id': companyRoleId,
        'country_id': countryId,
        'user_title_types_id': userTitleTypesId,
        'currency_id': currencyId,
        'contact_number_types_id': contactNumberTypesId,
        'marital_status_id': maritalStatusId,
        'gender_id': genderId,
        'current_membership_grade_id': currentMembershipGradeId,
        'next_membership_grade_id': nextMembershipGradeId,
        'slug': slug,
        'first_name': firstName,
        'last_name': lastName,
        'email': email,
        'email_visibility': emailVisibility,
        'active': active,
        'date_of_birth': dateOfBirth,
        'avatar': avatar,
        'banner': banner,
        'professional_title': professionalTitle,
        'area': area,
        'contact_number': contactNumber,
        'contact_number_visibility': contactNumberVisibility,
        'contactable_whatsapp': contactableWhatsapp,
        'contactable_sms': contactableSms,
        'website': website,
        'website_visibility': websiteVisibility,
        'skype': skype,
        'skype_visibility': skypeVisibility,
        'facebook': facebook,
        'facebook_visibility': facebookVisibility,
        'twitter': twitter,
        'twitter_visibility': twitterVisibility,
        'google': google,
        'google_visibility': googleVisibility,
        'xing': xing,
        'xing_visibility': xingVisibility,
        'linkedin': linkedin,
        'linkedin_visibility': linkedinVisibility,
        'proxycurl_whodis': proxycurlWhodis,
        'allow_recruiter_access': allowRecruiterAccess,
        'address_1': address1,
        'address_2': address2,
        'address_postal_code': addressPostalCode,
        'address_area': addressArea,
        'work_permits': workPermits,
        'relocate': relocate,
        'next_job': nextJob,
        'salary_expectation': salaryExpectation,
        'profile_summary': profileSummary,
        'profile_video_title': profileVideoTitle,
        'profile_video_description': profileVideoDescription,
        'profile_video_url': profileVideoUrl,
        'membership_grade_leader_points': membershipGradeLeaderPoints,
        'membership_grade_needed_leader_points':
            membershipGradeNeededLeaderPoints,
        'membership_grade_percent_accomplished':
            membershipGradePercentAccomplished,
        'logins': logins,
        'last_login': lastLogin,
        'membership_grade_eligibility': membershipGradeEligibility,
        'matrix_uid': matrixUid,
        'matrix_room_sync': matrixRoomSync,
        'allow_api_login': allowApiLogin,
        'embed_src': embedSrc,
        'full_name': fullName,
        'expertise_string': expertiseString,
        'active_status': activeStatus,
        'avatar_cdn': avatarCdn,
        'holedo_url': holedoUrl,
        'total_experience': totalExperience,
      };
}
