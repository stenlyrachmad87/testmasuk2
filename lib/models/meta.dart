import 'package:testmasuk2/models/errors.dart';
import 'package:testmasuk2/models/pagination.dart';

class Meta {
  int? _code;
  String? _status;
  String? _message;
  List<Errors>? _errors;
  bool? _needRegister;
  Pagination? _pagination;

  Meta({
    int? code,
    String? status,
    String? message,
    List<Errors>? errors,
    Pagination? pagination,
  }) {
    _code = code;
    _status = status;
    _message = message;
    _errors = errors;
  }

  int get code => _code ?? 0;

  String get status => _status ?? "";

  String get message => _message ?? "";

  bool get needRegister => _needRegister ?? false;

  Pagination get pagination => _pagination ?? Pagination();

  List<Errors> get errors => _errors ?? [];

  Map<String, String> get errorField {
    Map<String, String> errorField = {};
    _errors!.forEach((element) {
      errorField[element.attribute!] = element.text!;
    });
    return errorField;
  }

  Meta.fromJson(Map<String, dynamic> json) {
    _code = json['code'];
    _status = json['status'];
    _message = json['message'];
    if (json['errors'] != null) {
      _errors = <Errors>[];
      json['errors'].forEach((v) {
        _errors!.add(new Errors.fromJson(v));
      });
    }

    if (json["need_register"] != null) {
      _needRegister = json["need_register"];
    }

    _pagination = json['pagination'] != null
        ? Pagination.fromJson(json['pagination'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['code'] = _code;
    data['status'] = _status;
    data['message'] = _message;
    data['errors'] = _errors;
    data["need_register"] = _needRegister;
    // data["pagination"] = _pagination;
    return data;
  }
}
