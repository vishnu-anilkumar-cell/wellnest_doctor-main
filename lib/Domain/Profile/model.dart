
class Model {
  String? email;
  String? password;
  dynamic name;
  dynamic age;
  int? patents;
  dynamic experence;
  int? rating;
  dynamic specialization;
  dynamic education;
  dynamic about;
  int? profileUpdated;
  int? status;

  Model({this.email, this.password, this.name, this.age, this.patents, this.experence, this.rating, this.specialization, this.education, this.about, this.profileUpdated, this.status});

  Model.fromJson(Map<String, dynamic> json) {
    if(json["email"] is String) {
      email = json["email"];
    }
    if(json["password"] is String) {
      password = json["password"];
    }
    name = json["name"];
    age = json["age"];
    if(json["patents"] is int) {
      patents = json["patents"];
    }
    experence = json["experence"];
    if(json["rating"] is int) {
      rating = json["rating"];
    }
    specialization = json["specialization"];
    education = json["education"];
    about = json["about"];
    if(json["ProfileUpdated"] is int) {
      profileUpdated = json["ProfileUpdated"];
    }
    if(json["status"] is int) {
      status = json["status"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["email"] = email;
    data["password"] = password;
    data["name"] = name;
    data["age"] = age;
    data["patents"] = patents;
    data["experence"] = experence;
    data["rating"] = rating;
    data["specialization"] = specialization;
    data["education"] = education;
    data["about"] = about;
    data["ProfileUpdated"] = profileUpdated;
    data["status"] = status;
    return data;
  }
}