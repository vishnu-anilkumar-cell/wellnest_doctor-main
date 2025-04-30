
class StartChatModel {
  int? room;
  String? clintName;

  StartChatModel({this.room, this.clintName});

  StartChatModel.fromJson(Map<String, dynamic> json) {
    if(json["Room"] is int) {
      room = json["Room"];
    }
    if(json["Clint_name"] is String) {
      clintName = json["Clint_name"];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> _data = <String, dynamic>{};
    _data["Room"] = room;
    _data["Clint_name"] = clintName;
    return _data;
  }
}