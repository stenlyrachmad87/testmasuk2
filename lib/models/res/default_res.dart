import 'package:testmasuk2/models/meta.dart';

class DefaultRes {
  Meta? _meta;

  DefaultRes({Meta? meta}) {
    if (meta != null) {
      _meta = meta;
    }
  }

  Meta get meta => _meta ?? Meta();

  DefaultRes.fromJson(Map<String, dynamic> json) {
    _meta = json['meta'] != null ? Meta.fromJson(json['meta']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (_meta != null) {
      data['meta'] = _meta!.toJson();
    }
    return data;
  }
}
