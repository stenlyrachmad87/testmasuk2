// CLASS INI SEBAGAI BLUEPRINT DATA DARI PAGINATION DALAM CLASS META

class Pagination {
  int? _currentPage;
  int? _perPage;
  int? _totalPage;
  int? _totalData;

  Pagination({int? currentPage, int? perPage, int? totalPage, int? totalData}) {
    if (currentPage != null) {
      this._currentPage = currentPage;
    }
    if (perPage != null) {
      this._perPage = perPage;
    }
    if (totalPage != null) {
      this._totalPage = totalPage;
    }
    if (totalData != null) {
      this._totalData = totalData;
    }
  }

  int get currentPage => _currentPage ?? 1;

  int get perPage => _perPage ?? 1;

  int get totalPage => _totalPage ?? 1;

  int get totalData => _totalData ?? 1;

  Pagination.fromJson(Map<String, dynamic> json) {
    _currentPage = json['current_page'];
    _perPage = int.parse(json['per_page'].toString());
    _totalPage = json['total_page'];
    _totalData = json['total_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['current_page'] = this._currentPage;
    data['per_page'] = this._perPage;
    data['total_page'] = this._totalPage;
    data['total_data'] = this._totalData;
    return data;
  }
}
