import 'package:flipkart_clone/db/dboperations.dart';
import 'package:flipkart_clone/models/menu.dart';
import 'package:flipkart_clone/models/product.dart';
import 'package:flipkart_clone/utils/constants.dart';
import 'package:flipkart_clone/utils/gps.dart';
import 'package:flipkart_clone/widgets/category_widget.dart';
import 'package:flipkart_clone/widgets/deals_widget.dart';
import 'package:flipkart_clone/widgets/menu_widget.dart';
import 'package:flipkart_clone/widgets/slider_widget.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatefulWidget {
  int val;
  HomeScreen(this.val);
  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool pressbtn=false;
  Color _color=Colors.grey[700];
  List<Menu> menus = [];
  List<Product> ads = [];
  List<Product> categories = [];
  List<Product> deals = [];
  String loc = "";
  _moveToHome(){
    Navigator.pushReplacementNamed(context,Constants.HOME_ROUTE);
  }
  AppBar _getAppBar() {
    return AppBar(
      title: Image.asset(
        Constants.FLIPKART_LOGO,
        height: device.height / 3,
        width: device.width / 4,
      ),
      //backgroundColor: Color(Constants.FLIPKART_BLUE),
      actions: [
        IconButton(icon: Icon(Icons.notifications), onPressed: () {}),
        Padding(
          padding: EdgeInsets.only(left: 5, right: 10),
          child: IconButton(icon: Icon(Icons.shopping_cart), onPressed: () {}),
        ),
      ],
      bottom: PreferredSize(
        preferredSize: Size.fromHeight(device.height / 10),
        child: Container(
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Container(
              color: Colors.white,
              alignment: Alignment.center,
              child: TextField(
                decoration: InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    hintText: 'Search for Products, Brands and More.',
                    hintStyle: TextStyle(fontSize: 14)),
              ),
            ),
          ),
        ),
      ),
    );
  }

  _loadMenus() async {
    loc = await getLocation();
    menus = await DbOperations.fetchMenus();
    ads = await DbOperations.fetchAds();
    categories = await DbOperations.fetchCategories();
    deals = await DbOperations.fetchDeals();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    _loadMenus();
  }

  Size device;
  @override
  Widget build(BuildContext context) {
    device = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: _getAppBar(),
      drawer: Drawer(
        child: MenuWidget(menus, loc,widget.val),
      ),
      body: ListView(children: [
        SliderWidget(ads),
        CategoryWidget(categories),
        DealsWidget(deals),
      ]),
      bottomNavigationBar: Container(
        color: Colors.white,
        height: 50.0,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            IconButton(
                
                icon: Icon(
                  Icons.home,
                  color:  pressbtn? Colors.blue:Colors.grey[700],
                ),
                onPressed: () {
                  _moveToHome();
                }),
            IconButton(
                icon: Icon(
                  Icons.data_usage_sharp,
                  color: _color,
                ),
                onPressed: () {
                  
                }),
            IconButton(
                icon: Icon(
                  Icons.mic,
                  color:_color,
                ),
                onPressed: () {
                  
                }),
            IconButton(
                icon: Icon(
                  Icons.favorite,
                  color: Colors.grey[700],
                ),
                onPressed: () {}),
            IconButton(
                icon: Icon(
                  Icons.account_box,
                  color: Colors.grey[700],
                ),
                onPressed: () {}),
          ],
        ),
      ),
    );
  }
}
