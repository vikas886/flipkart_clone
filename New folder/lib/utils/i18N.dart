import 'package:easy_localization/easy_localization.dart';
import 'package:flipkart_clone/screens/homescreen.dart';
import 'package:flipkart_clone/utils/constants.dart';
import 'package:flutter/material.dart';

class I18N extends StatefulWidget {
  // I18N({Key key}) : super(key: key);
  int value;
  I18N(this.value);

  @override
  _I18NState createState() => _I18NState();
}

class _I18NState extends State<I18N> {
  int _selected;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _selected=0;
  }
  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    if(widget.value==2){
      EasyLocalization.of(context).locale=Locale('en','US'); 
    }else{
      EasyLocalization.of(context).locale=Locale('hi','IN');
    }
  }
  selectRadioBtn(val){
    setState(() {
      _selected=val;
    });
  }
  @override
  Widget build(BuildContext context) {
    Size device=MediaQuery.of(context).size;
    return Scaffold(
        appBar: AppBar(
          title: Text(tr("Choose Language")),
          backgroundColor: Color(Constants.FLIPKART_BLUE),
        ),
        body: Column(
          children: [
            Card(
              child: RadioListTile(
                value: 1,
                groupValue: _selected,
                title: Text("हिन्दी"),
                subtitle: Text("Hindi"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  print("Value $val");
                  selectRadioBtn(val);
                },
                secondary: Image.network(Constants.TAJ_LOGO),
              ),
            ),
            SizedBox(
              height: 10,
            ),
            Card(
              child: RadioListTile(
                value: 2,
                groupValue: _selected,
                title: Text("English"),
                subtitle: Text("English"),
                activeColor: Colors.blue,
                onChanged: (val) {
                  print("Value $val");
                  selectRadioBtn(val);
                },
                secondary: Image.network('https://cdn.iconscout.com/icon/premium/png-256-thumb/bridge-1876990-1589775.png'),
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Card(
              color: Colors.white,
              child: Padding(
                padding: const EdgeInsets.only(left: 12,right: 12),
                child: FlatButton(
                  onPressed:(){
                    Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>HomeScreen(_selected)));
                  }, 
                  child:Text('Continue',style: TextStyle(color: Colors.white),),
                  color: Colors.orange[800],
                  minWidth: device.width ,
                  height: device.height/20,
                  ),
              ) ,
            ),
          ],
        ));
  }
}
