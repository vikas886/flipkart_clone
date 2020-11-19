
import 'package:easy_localization/easy_localization.dart';
import 'package:flipkart_clone/models/menu.dart';
import 'package:flipkart_clone/utils/constants.dart';
import 'package:flipkart_clone/utils/i18N.dart';
import 'package:flutter/material.dart';

class MenuWidget extends StatefulWidget {
  List<Menu> menus = [];
  String loc;
  int val;
  MenuWidget(List<Menu> menus, String loc,int val) {
    this.menus = menus;
    this.loc = loc;
    this.val=val;
  }

  @override
  _MenuWidgetState createState() => _MenuWidgetState();
}

class _MenuWidgetState extends State<MenuWidget> {
  Size deviceSize;
  bool flag=false;
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(widget.val==2){
      EasyLocalization.of(context).locale=Locale('en','US');
    }else{
      EasyLocalization.of(context).locale=Locale('hi','IN');
    } 
  }
 

  _actionToMenus(index){
    if(index==1){
      Navigator.of(context).push(MaterialPageRoute(builder: (context)=>I18N(widget.val)));
    }else{

    }
  }
  Container _makeheader() {
    return Container(
      color: Color(Constants.FLIPKART_BLUE),
      height: deviceSize.height / 10,
      child: Center(
        child: ListTile(
          onTap: (){
            
          },
          leading: Icon(Icons.home, color: Colors.white),
          title: Row(
            children: [
              Text(
                tr("Home"),
                style: TextStyle(color: Colors.white),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                  child: Text(
                '${widget.loc}',
                style: TextStyle(color: Colors.white),
              )),
            ],
          ),
          trailing: Image.asset(Constants.FLIPKART_SPLASH_LOGO),
        ),
      ),
    );
  }

  Container _makeSingleMenu(int index) {
    int iconData = int.parse(widget.menus[index].iconValue);
    return Container(
      child: ListTile(
        onTap: (){
          _actionToMenus(index);
        },
        leading: Icon(IconData(iconData, fontFamily: 'MaterialIcons')),
        title: Text(tr(widget.menus[index].name)),
      ),
    );
  }

  _makeBody() {
    return ListView.builder(
      shrinkWrap: true,
      itemCount: widget.menus.length,
      itemBuilder: (BuildContext context, int index) {
        return _makeSingleMenu(index);
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return this.widget.menus != null && this.widget.menus.length > 0
        ? ListView(
            children: [
              _makeheader(),
              _makeBody(),
            ],
          )
        : Container(
            child: Text('Waiting to load a Menu.'),
          );
  }
}
