class Menu{
  String _name;
  String _url;
  String _iconValue;
  String _status;
  String get url=>_url;
  String get name=>_name;
  String get iconValue=>_iconValue;
  String get status=>_status;

  set url(String value){
    _url=value;
  }
  set name(String value){
    _name=value;
  }
  set iconValue(String value){
    _iconValue=value;
  }
  set status(String value){
    _status=value;
  }
}