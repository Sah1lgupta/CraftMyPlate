import 'package:assignment_2/resources/custom_colors.dart';
import 'package:flutter/material.dart';
import 'package:sticky_headers/sticky_headers/widget.dart';

import '../datamodels/platters_model.dart';

class CraftingPlatter extends StatelessWidget {
   CraftingPlatter({Key? key}) : super(key: key);
  final List<platters> imageList = [
    platters(image: 'assets/images/craftingplate/craft_your_own_plate.png', text: 'Default Platter'),
    platters(image:'assets/images/craftingplate/default_plate.png', text: 'Craft your own'),


  ];

  @override
  Widget build(BuildContext context) {
    return  craftingPlatter();

  }

  Widget craftingPlatter(){

    return  Padding(
      padding: const EdgeInsets.all(7),
      child: Column(

        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SizedBox(width: 20,),
              Text('Start Crafting',style: TextStyle(fontFamily: 'Poppins',color: CustomColors.purple, fontSize: 20,fontWeight: FontWeight.w500),),
            ],
          ),
          Container(
            width: 340,
            height: 160,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return  Padding(
                  padding: const EdgeInsets.only(top: 8,bottom: 8,right: 15),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Card(
                      elevation: 7,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [

                          Image.asset(
                            '${imageList[index].image}',
                            fit: BoxFit.fitHeight,
                          ),
                          SizedBox(height: 15,),

                          Text('${imageList[index].text}',style: TextStyle(fontFamily: 'Poppins')),
                        ],
                      ),
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
