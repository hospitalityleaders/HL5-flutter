import 'dart:convert';

/// success : true
/// errors : null
/// messages : null
/// data : {"user":{"id":4280,"company_id":null,"role_id":2,"company_role_id":null,"country_id":null,"user_title_types_id":null,"currency_id":null,"contact_number_types_id":null,"marital_status_id":null,"gender_id":null,"current_membership_grade_id":1,"next_membership_grade_id":2,"slug":"johnd","first_name":"John","last_name":"Ubalde","email":"john@limabean.co.za","email_visibility":0,"date_of_birth":null,"avatar":"https://res.cloudinary.com/hospitalityleaders/image/upload/v1644465746/uploads/images/users/b62-mortal-kombat-movie-poster-thumb-1613594784791-Boi.jpg","banner":"https://res.cloudinary.com/hospitalityleaders/image/upload/v1643922455/uploads/images/users/6bc-136475-acoustic-guitar-wallpaper-1920x1080-photos-IPF.jpg","professional_title":null,"area":null,"contact_number":"","contact_number_visibility":false,"contactable_whatsapp":0,"contactable_sms":0,"website":null,"website_visibility":false,"skype":null,"skype_visibility":false,"facebook":null,"facebook_visibility":false,"twitter":null,"twitter_visibility":false,"google":null,"google_visibility":false,"xing":null,"xing_visibility":false,"linkedin":null,"linkedin_visibility":false,"proxycurl_whodis":null,"allow_recruiter_access":false,"address_1":null,"address_2":null,"address_postal_code":null,"address_area":null,"work_permits":null,"relocate":false,"next_job":null,"salary_expectation":null,"profile_summary":null,"active":false,"profile_video_title":null,"profile_video_description":null,"profile_video_url":null,"membership_grade_leader_points":1500,"membership_grade_needed_leader_points":48500,"membership_grade_percent_accomplished":3,"membership_grade_eligibility":true,"matrix_uid":"@johnd:holedo.com","matrix_room_sync":null,"allow_api_login":false,"company":null,"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQyODAsImV4cCI6MTk2NjQxMTI0NH0.umSFTSYjB9XCv6AHHfeOIpG-v0foRHwoaM2MnBgTDpw","embed_src":"","full_name":"John Ubalde","expertise_string":"","active_status":"inactive","avatar_cdn":"https://res.cloudinary.com/hospitalityleaders/image/upload/w_500/v1644465746/uploads/images/users/b62-mortal-kombat-movie-poster-thumb-1613594784791-Boi.jpg","holedo_url":"http://holedo.com/johnd"}}

UserProfileModel userProfileModelFromJson(String str) =>
    UserProfileModel.fromJson(json.decode(str));
String userProfileModelToJson(UserProfileModel data) =>
    json.encode(data.toJson());

class UserProfileModel {
  UserProfileModel({
    bool? success,
    dynamic errors,
    dynamic messages,
    Data? data,
  }) {
    _success = success;
    _errors = errors;
    _messages = messages;
    _data = data;
  }

  UserProfileModel.fromJson(dynamic json) {
    _success = json['success'];
    _errors = json['errors'];
    _messages = json['messages'];
    _data = json['data'] != null ? Data.fromJson(json['data']) : null;
  }
  bool? _success;
  dynamic _errors;
  dynamic _messages;
  Data? _data;
  UserProfileModel copyWith({
    bool? success,
    dynamic errors,
    dynamic messages,
    Data? data,
  }) =>
      UserProfileModel(
        success: success ?? _success,
        errors: errors ?? _errors,
        messages: messages ?? _messages,
        data: data ?? _data,
      );
  bool? get success => _success;
  dynamic get errors => _errors;
  dynamic get messages => _messages;
  Data? get data => _data;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = _success;
    map['errors'] = _errors;
    map['messages'] = _messages;
    if (_data != null) {
      map['data'] = _data?.toJson();
    }
    return map;
  }
}

/// user : {"id":4280,"company_id":null,"role_id":2,"company_role_id":null,"country_id":null,"user_title_types_id":null,"currency_id":null,"contact_number_types_id":null,"marital_status_id":null,"gender_id":null,"current_membership_grade_id":1,"next_membership_grade_id":2,"slug":"johnd","first_name":"John","last_name":"Ubalde","email":"john@limabean.co.za","email_visibility":0,"date_of_birth":null,"avatar":"https://res.cloudinary.com/hospitalityleaders/image/upload/v1644465746/uploads/images/users/b62-mortal-kombat-movie-poster-thumb-1613594784791-Boi.jpg","banner":"https://res.cloudinary.com/hospitalityleaders/image/upload/v1643922455/uploads/images/users/6bc-136475-acoustic-guitar-wallpaper-1920x1080-photos-IPF.jpg","professional_title":null,"area":null,"contact_number":"","contact_number_visibility":false,"contactable_whatsapp":0,"contactable_sms":0,"website":null,"website_visibility":false,"skype":null,"skype_visibility":false,"facebook":null,"facebook_visibility":false,"twitter":null,"twitter_visibility":false,"google":null,"google_visibility":false,"xing":null,"xing_visibility":false,"linkedin":null,"linkedin_visibility":false,"proxycurl_whodis":null,"allow_recruiter_access":false,"address_1":null,"address_2":null,"address_postal_code":null,"address_area":null,"work_permits":null,"relocate":false,"next_job":null,"salary_expectation":null,"profile_summary":null,"active":false,"profile_video_title":null,"profile_video_description":null,"profile_video_url":null,"membership_grade_leader_points":1500,"membership_grade_needed_leader_points":48500,"membership_grade_percent_accomplished":3,"membership_grade_eligibility":true,"matrix_uid":"@johnd:holedo.com","matrix_room_sync":null,"allow_api_login":false,"company":null,"token":"eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQyODAsImV4cCI6MTk2NjQxMTI0NH0.umSFTSYjB9XCv6AHHfeOIpG-v0foRHwoaM2MnBgTDpw","embed_src":"","full_name":"John Ubalde","expertise_string":"","active_status":"inactive","avatar_cdn":"https://res.cloudinary.com/hospitalityleaders/image/upload/w_500/v1644465746/uploads/images/users/b62-mortal-kombat-movie-poster-thumb-1613594784791-Boi.jpg","holedo_url":"http://holedo.com/johnd"}

Data dataFromJson(String str) => Data.fromJson(json.decode(str));
String dataToJson(Data data) => json.encode(data.toJson());

class Data {
  Data({
    User? user,
  }) {
    _user = user;
  }

  Data.fromJson(dynamic json) {
    _user = json['user'] != null ? User.fromJson(json['user']) : null;
  }
  User? _user;
  Data copyWith({
    User? user,
  }) =>
      Data(
        user: user ?? _user,
      );
  User? get user => _user;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (_user != null) {
      map['user'] = _user?.toJson();
    }
    return map;
  }
}

/// id : 4280
/// company_id : null
/// role_id : 2
/// company_role_id : null
/// country_id : null
/// user_title_types_id : null
/// currency_id : null
/// contact_number_types_id : null
/// marital_status_id : null
/// gender_id : null
/// current_membership_grade_id : 1
/// next_membership_grade_id : 2
/// slug : "johnd"
/// first_name : "John"
/// last_name : "Ubalde"
/// email : "john@limabean.co.za"
/// email_visibility : 0
/// date_of_birth : null
/// avatar : "https://res.cloudinary.com/hospitalityleaders/image/upload/v1644465746/uploads/images/users/b62-mortal-kombat-movie-poster-thumb-1613594784791-Boi.jpg"
/// banner : "https://res.cloudinary.com/hospitalityleaders/image/upload/v1643922455/uploads/images/users/6bc-136475-acoustic-guitar-wallpaper-1920x1080-photos-IPF.jpg"
/// professional_title : null
/// area : null
/// contact_number : ""
/// contact_number_visibility : false
/// contactable_whatsapp : 0
/// contactable_sms : 0
/// website : null
/// website_visibility : false
/// skype : null
/// skype_visibility : false
/// facebook : null
/// facebook_visibility : false
/// twitter : null
/// twitter_visibility : false
/// google : null
/// google_visibility : false
/// xing : null
/// xing_visibility : false
/// linkedin : null
/// linkedin_visibility : false
/// proxycurl_whodis : null
/// allow_recruiter_access : false
/// address_1 : null
/// address_2 : null
/// address_postal_code : null
/// address_area : null
/// work_permits : null
/// relocate : false
/// next_job : null
/// salary_expectation : null
/// profile_summary : null
/// active : false
/// profile_video_title : null
/// profile_video_description : null
/// profile_video_url : null
/// membership_grade_leader_points : 1500
/// membership_grade_needed_leader_points : 48500
/// membership_grade_percent_accomplished : 3
/// membership_grade_eligibility : true
/// matrix_uid : "@johnd:holedo.com"
/// matrix_room_sync : null
/// allow_api_login : false
/// company : null
/// token : "eyJ0eXAiOiJKV1QiLCJhbGciOiJIUzI1NiJ9.eyJzdWIiOjQyODAsImV4cCI6MTk2NjQxMTI0NH0.umSFTSYjB9XCv6AHHfeOIpG-v0foRHwoaM2MnBgTDpw"
/// embed_src : ""
/// full_name : "John Ubalde"
/// expertise_string : ""
/// active_status : "inactive"
/// avatar_cdn : "https://res.cloudinary.com/hospitalityleaders/image/upload/w_500/v1644465746/uploads/images/users/b62-mortal-kombat-movie-poster-thumb-1613594784791-Boi.jpg"
/// holedo_url : "http://holedo.com/johnd"

User userFromJson(String str) => User.fromJson(json.decode(str));
String userToJson(User data) => json.encode(data.toJson());

class User {
  User({
    int? id,
    dynamic companyId,
    int? roleId,
    dynamic companyRoleId,
    dynamic countryId,
    dynamic userTitleTypesId,
    dynamic currencyId,
    dynamic contactNumberTypesId,
    dynamic maritalStatusId,
    dynamic genderId,
    int? currentMembershipGradeId,
    int? nextMembershipGradeId,
    String? slug,
    String? firstName,
    String? lastName,
    String? email,
    int? emailVisibility,
    dynamic dateOfBirth,
    String? avatar,
    String? banner,
    dynamic professionalTitle,
    dynamic area,
    String? contactNumber,
    bool? contactNumberVisibility,
    int? contactableWhatsapp,
    int? contactableSms,
    dynamic website,
    bool? websiteVisibility,
    dynamic skype,
    bool? skypeVisibility,
    dynamic facebook,
    bool? facebookVisibility,
    dynamic twitter,
    bool? twitterVisibility,
    dynamic google,
    bool? googleVisibility,
    dynamic xing,
    bool? xingVisibility,
    dynamic linkedin,
    bool? linkedinVisibility,
    dynamic proxycurlWhodis,
    bool? allowRecruiterAccess,
    dynamic address1,
    dynamic address2,
    dynamic addressPostalCode,
    dynamic addressArea,
    dynamic workPermits,
    bool? relocate,
    dynamic nextJob,
    dynamic salaryExpectation,
    dynamic profileSummary,
    bool? active,
    dynamic profileVideoTitle,
    dynamic profileVideoDescription,
    dynamic profileVideoUrl,
    int? membershipGradeLeaderPoints,
    int? membershipGradeNeededLeaderPoints,
    int? membershipGradePercentAccomplished,
    bool? membershipGradeEligibility,
    String? matrixUid,
    dynamic matrixRoomSync,
    bool? allowApiLogin,
    dynamic company,
    String? token,
    String? embedSrc,
    String? fullName,
    String? expertiseString,
    String? activeStatus,
    String? avatarCdn,
    String? holedoUrl,
  }) {
    _id = id;
    _companyId = companyId;
    _roleId = roleId;
    _companyRoleId = companyRoleId;
    _countryId = countryId;
    _userTitleTypesId = userTitleTypesId;
    _currencyId = currencyId;
    _contactNumberTypesId = contactNumberTypesId;
    _maritalStatusId = maritalStatusId;
    _genderId = genderId;
    _currentMembershipGradeId = currentMembershipGradeId;
    _nextMembershipGradeId = nextMembershipGradeId;
    _slug = slug;
    _firstName = firstName;
    _lastName = lastName;
    _email = email;
    _emailVisibility = emailVisibility;
    _dateOfBirth = dateOfBirth;
    _avatar = avatar;
    _banner = banner;
    _professionalTitle = professionalTitle;
    _area = area;
    _contactNumber = contactNumber;
    _contactNumberVisibility = contactNumberVisibility;
    _contactableWhatsapp = contactableWhatsapp;
    _contactableSms = contactableSms;
    _website = website;
    _websiteVisibility = websiteVisibility;
    _skype = skype;
    _skypeVisibility = skypeVisibility;
    _facebook = facebook;
    _facebookVisibility = facebookVisibility;
    _twitter = twitter;
    _twitterVisibility = twitterVisibility;
    _google = google;
    _googleVisibility = googleVisibility;
    _xing = xing;
    _xingVisibility = xingVisibility;
    _linkedin = linkedin;
    _linkedinVisibility = linkedinVisibility;
    _proxycurlWhodis = proxycurlWhodis;
    _allowRecruiterAccess = allowRecruiterAccess;
    _address1 = address1;
    _address2 = address2;
    _addressPostalCode = addressPostalCode;
    _addressArea = addressArea;
    _workPermits = workPermits;
    _relocate = relocate;
    _nextJob = nextJob;
    _salaryExpectation = salaryExpectation;
    _profileSummary = profileSummary;
    _active = active;
    _profileVideoTitle = profileVideoTitle;
    _profileVideoDescription = profileVideoDescription;
    _profileVideoUrl = profileVideoUrl;
    _membershipGradeLeaderPoints = membershipGradeLeaderPoints;
    _membershipGradeNeededLeaderPoints = membershipGradeNeededLeaderPoints;
    _membershipGradePercentAccomplished = membershipGradePercentAccomplished;
    _membershipGradeEligibility = membershipGradeEligibility;
    _matrixUid = matrixUid;
    _matrixRoomSync = matrixRoomSync;
    _allowApiLogin = allowApiLogin;
    _company = company;
    _token = token;
    _embedSrc = embedSrc;
    _fullName = fullName;
    _expertiseString = expertiseString;
    _activeStatus = activeStatus;
    _avatarCdn = avatarCdn;
    _holedoUrl = holedoUrl;
  }

  User.fromJson(dynamic json) {
    _id = json['id'];
    _companyId = json['company_id'];
    _roleId = json['role_id'];
    _companyRoleId = json['company_role_id'];
    _countryId = json['country_id'];
    _userTitleTypesId = json['user_title_types_id'];
    _currencyId = json['currency_id'];
    _contactNumberTypesId = json['contact_number_types_id'];
    _maritalStatusId = json['marital_status_id'];
    _genderId = json['gender_id'];
    _currentMembershipGradeId = json['current_membership_grade_id'];
    _nextMembershipGradeId = json['next_membership_grade_id'];
    _slug = json['slug'];
    _firstName = json['first_name'];
    _lastName = json['last_name'];
    _email = json['email'];
    _emailVisibility = json['email_visibility'];
    _dateOfBirth = json['date_of_birth'];
    _avatar = json['avatar'];
    _banner = json['banner'];
    _professionalTitle = json['professional_title'];
    _area = json['area'];
    _contactNumber = json['contact_number'];
    _contactNumberVisibility = json['contact_number_visibility'];
    _contactableWhatsapp = json['contactable_whatsapp'];
    _contactableSms = json['contactable_sms'];
    _website = json['website'];
    _websiteVisibility = json['website_visibility'];
    _skype = json['skype'];
    _skypeVisibility = json['skype_visibility'];
    _facebook = json['facebook'];
    _facebookVisibility = json['facebook_visibility'];
    _twitter = json['twitter'];
    _twitterVisibility = json['twitter_visibility'];
    _google = json['google'];
    _googleVisibility = json['google_visibility'];
    _xing = json['xing'];
    _xingVisibility = json['xing_visibility'];
    _linkedin = json['linkedin'];
    _linkedinVisibility = json['linkedin_visibility'];
    _proxycurlWhodis = json['proxycurl_whodis'];
    _allowRecruiterAccess = json['allow_recruiter_access'];
    _address1 = json['address_1'];
    _address2 = json['address_2'];
    _addressPostalCode = json['address_postal_code'];
    _addressArea = json['address_area'];
    _workPermits = json['work_permits'];
    _relocate = json['relocate'];
    _nextJob = json['next_job'];
    _salaryExpectation = json['salary_expectation'];
    _profileSummary = json['profile_summary'];
    _active = json['active'];
    _profileVideoTitle = json['profile_video_title'];
    _profileVideoDescription = json['profile_video_description'];
    _profileVideoUrl = json['profile_video_url'];
    _membershipGradeLeaderPoints = json['membership_grade_leader_points'];
    _membershipGradeNeededLeaderPoints =
        json['membership_grade_needed_leader_points'];
    _membershipGradePercentAccomplished =
        json['membership_grade_percent_accomplished'];
    _membershipGradeEligibility = json['membership_grade_eligibility'];
    _matrixUid = json['matrix_uid'];
    _matrixRoomSync = json['matrix_room_sync'];
    _allowApiLogin = json['allow_api_login'];
    _company = json['company'];
    _token = json['token'];
    _embedSrc = json['embed_src'];
    _fullName = json['full_name'];
    _expertiseString = json['expertise_string'];
    _activeStatus = json['active_status'];
    _avatarCdn = json['avatar_cdn'];
    _holedoUrl = json['holedo_url'];
  }
  int? _id;
  dynamic _companyId;
  int? _roleId;
  dynamic _companyRoleId;
  dynamic _countryId;
  dynamic _userTitleTypesId;
  dynamic _currencyId;
  dynamic _contactNumberTypesId;
  dynamic _maritalStatusId;
  dynamic _genderId;
  int? _currentMembershipGradeId;
  int? _nextMembershipGradeId;
  String? _slug;
  String? _firstName;
  String? _lastName;
  String? _email;
  int? _emailVisibility;
  dynamic _dateOfBirth;
  String? _avatar;
  String? _banner;
  dynamic _professionalTitle;
  dynamic _area;
  String? _contactNumber;
  bool? _contactNumberVisibility;
  int? _contactableWhatsapp;
  int? _contactableSms;
  dynamic _website;
  bool? _websiteVisibility;
  dynamic _skype;
  bool? _skypeVisibility;
  dynamic _facebook;
  bool? _facebookVisibility;
  dynamic _twitter;
  bool? _twitterVisibility;
  dynamic _google;
  bool? _googleVisibility;
  dynamic _xing;
  bool? _xingVisibility;
  dynamic _linkedin;
  bool? _linkedinVisibility;
  dynamic _proxycurlWhodis;
  bool? _allowRecruiterAccess;
  dynamic _address1;
  dynamic _address2;
  dynamic _addressPostalCode;
  dynamic _addressArea;
  dynamic _workPermits;
  bool? _relocate;
  dynamic _nextJob;
  dynamic _salaryExpectation;
  dynamic _profileSummary;
  bool? _active;
  dynamic _profileVideoTitle;
  dynamic _profileVideoDescription;
  dynamic _profileVideoUrl;
  int? _membershipGradeLeaderPoints;
  int? _membershipGradeNeededLeaderPoints;
  int? _membershipGradePercentAccomplished;
  bool? _membershipGradeEligibility;
  String? _matrixUid;
  dynamic _matrixRoomSync;
  bool? _allowApiLogin;
  dynamic _company;
  String? _token;
  String? _embedSrc;
  String? _fullName;
  String? _expertiseString;
  String? _activeStatus;
  String? _avatarCdn;
  String? _holedoUrl;
  User copyWith({
    int? id,
    dynamic companyId,
    int? roleId,
    dynamic companyRoleId,
    dynamic countryId,
    dynamic userTitleTypesId,
    dynamic currencyId,
    dynamic contactNumberTypesId,
    dynamic maritalStatusId,
    dynamic genderId,
    int? currentMembershipGradeId,
    int? nextMembershipGradeId,
    String? slug,
    String? firstName,
    String? lastName,
    String? email,
    int? emailVisibility,
    dynamic dateOfBirth,
    String? avatar,
    String? banner,
    dynamic professionalTitle,
    dynamic area,
    String? contactNumber,
    bool? contactNumberVisibility,
    int? contactableWhatsapp,
    int? contactableSms,
    dynamic website,
    bool? websiteVisibility,
    dynamic skype,
    bool? skypeVisibility,
    dynamic facebook,
    bool? facebookVisibility,
    dynamic twitter,
    bool? twitterVisibility,
    dynamic google,
    bool? googleVisibility,
    dynamic xing,
    bool? xingVisibility,
    dynamic linkedin,
    bool? linkedinVisibility,
    dynamic proxycurlWhodis,
    bool? allowRecruiterAccess,
    dynamic address1,
    dynamic address2,
    dynamic addressPostalCode,
    dynamic addressArea,
    dynamic workPermits,
    bool? relocate,
    dynamic nextJob,
    dynamic salaryExpectation,
    dynamic profileSummary,
    bool? active,
    dynamic profileVideoTitle,
    dynamic profileVideoDescription,
    dynamic profileVideoUrl,
    int? membershipGradeLeaderPoints,
    int? membershipGradeNeededLeaderPoints,
    int? membershipGradePercentAccomplished,
    bool? membershipGradeEligibility,
    String? matrixUid,
    dynamic matrixRoomSync,
    bool? allowApiLogin,
    dynamic company,
    String? token,
    String? embedSrc,
    String? fullName,
    String? expertiseString,
    String? activeStatus,
    String? avatarCdn,
    String? holedoUrl,
  }) =>
      User(
        id: id ?? _id,
        companyId: companyId ?? _companyId,
        roleId: roleId ?? _roleId,
        companyRoleId: companyRoleId ?? _companyRoleId,
        countryId: countryId ?? _countryId,
        userTitleTypesId: userTitleTypesId ?? _userTitleTypesId,
        currencyId: currencyId ?? _currencyId,
        contactNumberTypesId: contactNumberTypesId ?? _contactNumberTypesId,
        maritalStatusId: maritalStatusId ?? _maritalStatusId,
        genderId: genderId ?? _genderId,
        currentMembershipGradeId:
            currentMembershipGradeId ?? _currentMembershipGradeId,
        nextMembershipGradeId: nextMembershipGradeId ?? _nextMembershipGradeId,
        slug: slug ?? _slug,
        firstName: firstName ?? _firstName,
        lastName: lastName ?? _lastName,
        email: email ?? _email,
        emailVisibility: emailVisibility ?? _emailVisibility,
        dateOfBirth: dateOfBirth ?? _dateOfBirth,
        avatar: avatar ?? _avatar,
        banner: banner ?? _banner,
        professionalTitle: professionalTitle ?? _professionalTitle,
        area: area ?? _area,
        contactNumber: contactNumber ?? _contactNumber,
        contactNumberVisibility:
            contactNumberVisibility ?? _contactNumberVisibility,
        contactableWhatsapp: contactableWhatsapp ?? _contactableWhatsapp,
        contactableSms: contactableSms ?? _contactableSms,
        website: website ?? _website,
        websiteVisibility: websiteVisibility ?? _websiteVisibility,
        skype: skype ?? _skype,
        skypeVisibility: skypeVisibility ?? _skypeVisibility,
        facebook: facebook ?? _facebook,
        facebookVisibility: facebookVisibility ?? _facebookVisibility,
        twitter: twitter ?? _twitter,
        twitterVisibility: twitterVisibility ?? _twitterVisibility,
        google: google ?? _google,
        googleVisibility: googleVisibility ?? _googleVisibility,
        xing: xing ?? _xing,
        xingVisibility: xingVisibility ?? _xingVisibility,
        linkedin: linkedin ?? _linkedin,
        linkedinVisibility: linkedinVisibility ?? _linkedinVisibility,
        proxycurlWhodis: proxycurlWhodis ?? _proxycurlWhodis,
        allowRecruiterAccess: allowRecruiterAccess ?? _allowRecruiterAccess,
        address1: address1 ?? _address1,
        address2: address2 ?? _address2,
        addressPostalCode: addressPostalCode ?? _addressPostalCode,
        addressArea: addressArea ?? _addressArea,
        workPermits: workPermits ?? _workPermits,
        relocate: relocate ?? _relocate,
        nextJob: nextJob ?? _nextJob,
        salaryExpectation: salaryExpectation ?? _salaryExpectation,
        profileSummary: profileSummary ?? _profileSummary,
        active: active ?? _active,
        profileVideoTitle: profileVideoTitle ?? _profileVideoTitle,
        profileVideoDescription:
            profileVideoDescription ?? _profileVideoDescription,
        profileVideoUrl: profileVideoUrl ?? _profileVideoUrl,
        membershipGradeLeaderPoints:
            membershipGradeLeaderPoints ?? _membershipGradeLeaderPoints,
        membershipGradeNeededLeaderPoints: membershipGradeNeededLeaderPoints ??
            _membershipGradeNeededLeaderPoints,
        membershipGradePercentAccomplished:
            membershipGradePercentAccomplished ??
                _membershipGradePercentAccomplished,
        membershipGradeEligibility:
            membershipGradeEligibility ?? _membershipGradeEligibility,
        matrixUid: matrixUid ?? _matrixUid,
        matrixRoomSync: matrixRoomSync ?? _matrixRoomSync,
        allowApiLogin: allowApiLogin ?? _allowApiLogin,
        company: company ?? _company,
        token: token ?? _token,
        embedSrc: embedSrc ?? _embedSrc,
        fullName: fullName ?? _fullName,
        expertiseString: expertiseString ?? _expertiseString,
        activeStatus: activeStatus ?? _activeStatus,
        avatarCdn: avatarCdn ?? _avatarCdn,
        holedoUrl: holedoUrl ?? _holedoUrl,
      );
  int? get id => _id;
  dynamic get companyId => _companyId;
  int? get roleId => _roleId;
  dynamic get companyRoleId => _companyRoleId;
  dynamic get countryId => _countryId;
  dynamic get userTitleTypesId => _userTitleTypesId;
  dynamic get currencyId => _currencyId;
  dynamic get contactNumberTypesId => _contactNumberTypesId;
  dynamic get maritalStatusId => _maritalStatusId;
  dynamic get genderId => _genderId;
  int? get currentMembershipGradeId => _currentMembershipGradeId;
  int? get nextMembershipGradeId => _nextMembershipGradeId;
  String? get slug => _slug;
  String? get firstName => _firstName;
  String? get lastName => _lastName;
  String? get email => _email;
  int? get emailVisibility => _emailVisibility;
  dynamic get dateOfBirth => _dateOfBirth;
  String? get avatar => _avatar;
  String? get banner => _banner;
  dynamic get professionalTitle => _professionalTitle;
  dynamic get area => _area;
  String? get contactNumber => _contactNumber;
  bool? get contactNumberVisibility => _contactNumberVisibility;
  int? get contactableWhatsapp => _contactableWhatsapp;
  int? get contactableSms => _contactableSms;
  dynamic get website => _website;
  bool? get websiteVisibility => _websiteVisibility;
  dynamic get skype => _skype;
  bool? get skypeVisibility => _skypeVisibility;
  dynamic get facebook => _facebook;
  bool? get facebookVisibility => _facebookVisibility;
  dynamic get twitter => _twitter;
  bool? get twitterVisibility => _twitterVisibility;
  dynamic get google => _google;
  bool? get googleVisibility => _googleVisibility;
  dynamic get xing => _xing;
  bool? get xingVisibility => _xingVisibility;
  dynamic get linkedin => _linkedin;
  bool? get linkedinVisibility => _linkedinVisibility;
  dynamic get proxycurlWhodis => _proxycurlWhodis;
  bool? get allowRecruiterAccess => _allowRecruiterAccess;
  dynamic get address1 => _address1;
  dynamic get address2 => _address2;
  dynamic get addressPostalCode => _addressPostalCode;
  dynamic get addressArea => _addressArea;
  dynamic get workPermits => _workPermits;
  bool? get relocate => _relocate;
  dynamic get nextJob => _nextJob;
  dynamic get salaryExpectation => _salaryExpectation;
  dynamic get profileSummary => _profileSummary;
  bool? get active => _active;
  dynamic get profileVideoTitle => _profileVideoTitle;
  dynamic get profileVideoDescription => _profileVideoDescription;
  dynamic get profileVideoUrl => _profileVideoUrl;
  int? get membershipGradeLeaderPoints => _membershipGradeLeaderPoints;
  int? get membershipGradeNeededLeaderPoints =>
      _membershipGradeNeededLeaderPoints;
  int? get membershipGradePercentAccomplished =>
      _membershipGradePercentAccomplished;
  bool? get membershipGradeEligibility => _membershipGradeEligibility;
  String? get matrixUid => _matrixUid;
  dynamic get matrixRoomSync => _matrixRoomSync;
  bool? get allowApiLogin => _allowApiLogin;
  dynamic get company => _company;
  String? get token => _token;
  String? get embedSrc => _embedSrc;
  String? get fullName => _fullName;
  String? get expertiseString => _expertiseString;
  String? get activeStatus => _activeStatus;
  String? get avatarCdn => _avatarCdn;
  String? get holedoUrl => _holedoUrl;

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = _id;
    map['company_id'] = _companyId;
    map['role_id'] = _roleId;
    map['company_role_id'] = _companyRoleId;
    map['country_id'] = _countryId;
    map['user_title_types_id'] = _userTitleTypesId;
    map['currency_id'] = _currencyId;
    map['contact_number_types_id'] = _contactNumberTypesId;
    map['marital_status_id'] = _maritalStatusId;
    map['gender_id'] = _genderId;
    map['current_membership_grade_id'] = _currentMembershipGradeId;
    map['next_membership_grade_id'] = _nextMembershipGradeId;
    map['slug'] = _slug;
    map['first_name'] = _firstName;
    map['last_name'] = _lastName;
    map['email'] = _email;
    map['email_visibility'] = _emailVisibility;
    map['date_of_birth'] = _dateOfBirth;
    map['avatar'] = _avatar;
    map['banner'] = _banner;
    map['professional_title'] = _professionalTitle;
    map['area'] = _area;
    map['contact_number'] = _contactNumber;
    map['contact_number_visibility'] = _contactNumberVisibility;
    map['contactable_whatsapp'] = _contactableWhatsapp;
    map['contactable_sms'] = _contactableSms;
    map['website'] = _website;
    map['website_visibility'] = _websiteVisibility;
    map['skype'] = _skype;
    map['skype_visibility'] = _skypeVisibility;
    map['facebook'] = _facebook;
    map['facebook_visibility'] = _facebookVisibility;
    map['twitter'] = _twitter;
    map['twitter_visibility'] = _twitterVisibility;
    map['google'] = _google;
    map['google_visibility'] = _googleVisibility;
    map['xing'] = _xing;
    map['xing_visibility'] = _xingVisibility;
    map['linkedin'] = _linkedin;
    map['linkedin_visibility'] = _linkedinVisibility;
    map['proxycurl_whodis'] = _proxycurlWhodis;
    map['allow_recruiter_access'] = _allowRecruiterAccess;
    map['address_1'] = _address1;
    map['address_2'] = _address2;
    map['address_postal_code'] = _addressPostalCode;
    map['address_area'] = _addressArea;
    map['work_permits'] = _workPermits;
    map['relocate'] = _relocate;
    map['next_job'] = _nextJob;
    map['salary_expectation'] = _salaryExpectation;
    map['profile_summary'] = _profileSummary;
    map['active'] = _active;
    map['profile_video_title'] = _profileVideoTitle;
    map['profile_video_description'] = _profileVideoDescription;
    map['profile_video_url'] = _profileVideoUrl;
    map['membership_grade_leader_points'] = _membershipGradeLeaderPoints;
    map['membership_grade_needed_leader_points'] =
        _membershipGradeNeededLeaderPoints;
    map['membership_grade_percent_accomplished'] =
        _membershipGradePercentAccomplished;
    map['membership_grade_eligibility'] = _membershipGradeEligibility;
    map['matrix_uid'] = _matrixUid;
    map['matrix_room_sync'] = _matrixRoomSync;
    map['allow_api_login'] = _allowApiLogin;
    map['company'] = _company;
    map['token'] = _token;
    map['embed_src'] = _embedSrc;
    map['full_name'] = _fullName;
    map['expertise_string'] = _expertiseString;
    map['active_status'] = _activeStatus;
    map['avatar_cdn'] = _avatarCdn;
    map['holedo_url'] = _holedoUrl;
    return map;
  }
}
