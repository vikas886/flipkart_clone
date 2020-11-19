class Product {
  String _name;
  String _url;
  String _imagePath;
  double _price;
  String _status;
  String get name => _name;

  double get price => _price;

  set price(double value) {
    _price = value;
  }

  set name(String value) {
    _name = value;
  }

  String get url => _url;

  String get imagePath => _imagePath;

  set imagePath(String value) {
    _imagePath = value;
  }

  set url(String value) {
    _url = value;
  }

  String get status => _status;

  set status(String value) {
    _status = value;
  }

  @override
  String toString() {
    return 'Product{_name: $_name, _url: $_url, _imagePath: $_imagePath, _price: $_price, _status: $_status}';
  }
}
