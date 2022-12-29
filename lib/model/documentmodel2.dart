class UserFields {
  static const String bidderNumber = "bidderNumber";
  static const String id = "\$id";
}

class DocModel2 {
  String? bidderNumber;
  String? id;

  DocModel2({
    required this.bidderNumber,
    required this.id,
  });

  factory DocModel2.fromJson(Map<dynamic, dynamic> json) {
    return DocModel2(
        id: json[UserFields.id], bidderNumber: json[UserFields.bidderNumber]);
  }

  Map<dynamic, dynamic> toJson() {
    return {'bidderNumber': bidderNumber, 'id': id};
  }
}
