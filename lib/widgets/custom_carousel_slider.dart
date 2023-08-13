import 'package:carousel_slider/carousel_options.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class CustomCarouselSlider extends StatelessWidget {
   CustomCarouselSlider({Key? key}) : super(key: key);


 final List<String> imageUrls = [

    'assets/images/carouselimages/banner_1.png',
    'assets/images/carouselimages/banner_2.png',


  ];

  @override
  Widget build(BuildContext context) {
    return CarouselSlider.builder(
      itemCount: imageUrls.length,
      itemBuilder: (context, index, realIndex) {
        String imageUrl = imageUrls[index];


        // If you're using network images (non-SVG)
        return Container(
          width:  MediaQuery.of(context).size.width * 1,
          child:  Image.asset(
            imageUrl,
            fit: BoxFit.fitWidth,
          ),
        );

      },
      options: CarouselOptions(
        autoPlay: true, // Set to false if you don't want auto-rotation
        enlargeCenterPage: true,
        aspectRatio: 10 / 4,
        autoPlayInterval: Duration(seconds: 2),
        autoPlayAnimationDuration: Duration(milliseconds: 800),
        autoPlayCurve: Curves.fastOutSlowIn,



      ),
    );
  }
}
