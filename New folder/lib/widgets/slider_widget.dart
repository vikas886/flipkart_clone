import 'package:carousel_pro/carousel_pro.dart';
import 'package:flipkart_clone/models/product.dart';
import 'package:flutter/material.dart';

class SliderWidget extends StatelessWidget {
  List<Product> ads = [];
  SliderWidget(this.ads);

  @override
  Widget build(BuildContext context) {
    Size deviceSize = MediaQuery.of(context).size;
    return Container(
      height: deviceSize.height / 3,
      width: deviceSize.width,
      child: Carousel(
        dotSize: 5.0,
        // dotBgColor: Colors.blueAccent[200],
        animationDuration: Duration(seconds: 1),
        autoplay: true,
        borderRadius: true,
        onImageTap: (int currentSliderNumber) {
          print("Current slider number $currentSliderNumber");
        },
        images: ads != null && ads.length > 0
            ? ads.map((currentAd) => NetworkImage(currentAd.imagePath)).toList()
            : [
                // NetworkImage(
                //     'https://codemyui.com/wp-content/uploads/2017/09/rotate-pulsating-loading-animation.gif'),
                NetworkImage(
                    'https://media3.giphy.com/media/3oEjI6SIIHBdRxXI40/giphy.gif'),
              ],
        // images: [
        //   // ExactAssetImage()
        //   NetworkImage(
        //       'https://www.france-hotel-guide.com/en/blog/wp-content/uploads/2017/02/paris-shopping.jpg'),
        //   NetworkImage(
        //       'https://i0.wp.com/www.paisawapas.com/blog/wp-content/uploads/2017/08/shoes-offers-snapdeal-below-499.jpg'),
        //   NetworkImage(
        //       'https://review.chinabrands.com/chinabrands/seo/image/20190219/dubaionlineshoppingsites,.png'),
        //   NetworkImage(
        //       'https://li0.rightinthebox.com/images/dfp/202010/LITB_13080_thxgus5_en.gif')
        // ],
      ),
    );
  }
}
