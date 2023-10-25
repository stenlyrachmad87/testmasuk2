class Errors {
  String? attribute;
  String? text;

  Errors({this.attribute, this.text});

  Errors.fromJson(Map<String, dynamic> json) {
    attribute = json['attribute'];
    text = json['text'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['attribute'] = this.attribute;
    data['text'] = this.text;
    return data;
  }
}
