import 'package:flipkart_clone/models/product.dart';
import 'package:flutter/material.dart';

class DealsWidget extends StatelessWidget {
  List<Product> deals = [];
  DealsWidget(this.deals);
  buildSingleDeal(int index) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: deviceSize.height / 8,
        // width: deviceSize.width/5,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Container(
              // padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
              height: deviceSize.height / 6,
              child: Image.network(
                deals[index].imagePath,
                // height: deviceSize.height/5,
                // width: deviceSize.width/5,
              ),
            ),
            Text(
              deals[index].name,
              style: TextStyle(fontWeight: FontWeight.bold),
            ),
            Text(deals[index].price ?? 900.toString()),
          ],
        ),
      ),
    );
  }

  Size deviceSize;
  @override
  Widget build(BuildContext context) {
    deviceSize = MediaQuery.of(context).size;
    return Container(
      child: Stack(
        children: [
          Container(
            color: Colors.pink[100],
            height: deviceSize.height / 1.5,
          ),
          Positioned(
            top: deviceSize.height / 50,
            child: Column(
              // mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 20),
                          child: Text(
                            'Deals Of The Day',
                            style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        ),
                        Row(
                          children: [
                            Icon(
                              Icons.access_time,
                              color: Colors.white,
                            ),
                            Text(
                              '19h 18m Remaining',
                              style: TextStyle(
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Container(
                      padding: EdgeInsets.only(top: 5),
                      width: deviceSize.width / 4,
                      height: deviceSize.height / 10,
                      // alignment: Alignment.topRight,
                      child: Image.network(
                          'https://freeiconshop.com/wp-content/uploads/edd/alarm-flat.png'),
                    ),
                    // SizedBox(
                    //   width: deviceSize.width/4,
                    // ),
                    Container(
                      // alignment: Alignment.topRight,
                      padding: EdgeInsets.only(top: 5),
                      child: RaisedButton(
                        onPressed: () {},
                        child: Text(
                          'View All',
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        ),
                        color: Colors.blueAccent,
                      ),
                    ),
                  ],
                ),
                Container(
                  color: Colors.white,
                  alignment: Alignment.center,
                  // padding: EdgeInsets.only(top: 10, right: 20, left: 20, bottom: 10),
                  height: deviceSize.height / 2,
                  width: deviceSize.width * .91,
                  child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    shrinkWrap: true,
                    itemCount: deals.length,
                    itemBuilder: (context, int index) {
                      return buildSingleDeal(index);
                    },
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        // crossAxisSpacing: 10,
                        mainAxisSpacing: 10),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
