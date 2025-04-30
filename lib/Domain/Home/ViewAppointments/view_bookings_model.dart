
class ViewBookingsModel {
  List<Bookings>? bookings;

  ViewBookingsModel({this.bookings});

  ViewBookingsModel.fromJson(Map<String, dynamic> json) {
    if(json["BOOKINGS"] is List) {
      bookings = json["BOOKINGS"] == null ? null : (json["BOOKINGS"] as List).map((e) => Bookings.fromJson(e)).toList();
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if(bookings != null) {
      data["BOOKINGS"] = bookings?.map((e) => e.toJson()).toList();
    }
    return data;
  }
}

class Bookings {
  int? id;
  String? userName;
  String? datetime;
  String? bookdate;
  int? timesloat;
  dynamic rate;
  int? status;
  String? user;
  String? doctor;
  int? room;

  Bookings({this.id, this.userName, this.datetime, this.bookdate, this.timesloat, this.rate, this.status, this.user, this.doctor, this.room});

  Bookings.fromJson(Map<String, dynamic> json) {
    if(json["id"] is int) {
      id = json["id"];
    }
    if(json["user_name"] is String) {
      userName = json["user_name"];
    }
    if(json["datetime"] is String) {
      datetime = json["datetime"];
    }
    if(json["bookdate"] is String) {
      bookdate = json["bookdate"];
    }
    if(json["timesloat"] is int) {
      timesloat = json["timesloat"];
    }
    rate = json["rate"];
    if(json["status"] is int) {
      status = json["status"];
    }
    if(json["User"] is String) {
      user = json["User"];
    }
    if(json["doctor"] is String) {
      doctor = json["doctor"];
    }
    if(json["Room"] is int) {
      room = json["Room"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data["id"] = id;
    data["user_name"] = userName;
    data["datetime"] = datetime;
    data["bookdate"] = bookdate;
    data["timesloat"] = timesloat;
    data["rate"] = rate;
    data["status"] = status;
    data["User"] = user;
    data["doctor"] = doctor;
    data["Room"] = room;
    return data;
  }
}