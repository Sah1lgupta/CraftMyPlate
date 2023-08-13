
import 'package:flutter/material.dart';

import '../datamodels/top_categories_model.dart';


class TopCategoriesWidget extends StatelessWidget {
  TopCategoriesWidget({Key? key}) : super(key: key);
  final List<TopCategoriesModel> imageList = [
    TopCategoriesModel(image: 'assets/images/topcategories/starters.png', text: 'Starters'),
    TopCategoriesModel(image:'assets/images/topcategories/drinks.png', text: 'drinks'),
    TopCategoriesModel(image:'assets/images/topcategories/rice.png', text: 'Rice'),
    TopCategoriesModel(image: 'assets/images/topcategories/curry.png', text: 'Curry'),
    TopCategoriesModel(image: 'assets/images/topcategories/desserts.png', text: 'Desserts'),
    TopCategoriesModel(image: 'assets/images/topcategories/starters.png', text: 'Starters'),
    TopCategoriesModel(image:'assets/images/topcategories/drinks.png', text: 'drinks'),
    TopCategoriesModel(image:'assets/images/topcategories/rice.png', text: 'Rice'),
    TopCategoriesModel(image: 'assets/images/topcategories/curry.png', text: 'Curry'),
    TopCategoriesModel(image: 'assets/images/topcategories/desserts.png', text: 'Desserts'),


  ];

  @override
  Widget build(BuildContext context) {
    return  craftingPlatter();

  }

  Widget craftingPlatter(){

    return  Padding(
      padding: const EdgeInsets.all(4),
      child: Column(

        children: [
          Padding(
            padding: const EdgeInsets.only(left: 10,right: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                // SizedBox(width: 20,),
                Text('Top Categories',style: TextStyle(fontFamily: 'Poppins',color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),


              ],
            ),
          ),
          Container(
            width: 380,
            height: 120,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 5,bottom: 8,right: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset(
                            '${imageList[index].image}',
                            fit: BoxFit.cover,
                          ),
                          SizedBox(height: 5,),

                          Text('${imageList[index].text}',style: TextStyle(fontFamily: 'Poppins')),
                        ],
                      ),

                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
