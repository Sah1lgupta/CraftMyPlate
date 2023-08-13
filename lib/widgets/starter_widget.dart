import 'package:assignment_2/datamodels/starters_model.dart';
import 'package:flutter/material.dart';


class Starters extends StatelessWidget {
  Starters({Key? key}) : super(key: key);
  final List<Starter> imageList = [
    Starter(image: 'assets/images/starters/grill_chicken.png', text: 'Grill Chicken '),
    Starter(image:'assets/images/starters/mashroom_fry.png', text: 'Mashroom Fry'),
    Starter(image:'assets/images/starters/vaggies_fry.png', text: 'Veggies Fry'),
    Starter(image: 'assets/images/starters/grill_chicken.png', text: 'Grill Chicken '),
    Starter(image:'assets/images/starters/mashroom_fry.png', text: 'Mashroom Fry'),
    Starter(image:'assets/images/starters/vaggies_fry.png', text: 'Veggies Fry'),


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
                Text('Starters ',style: TextStyle(fontFamily: 'Poppins',color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),
                Text('More Starters ',style: TextStyle(fontFamily: 'Poppins',color: Color(0xFF600D8D), fontSize: 13,fontWeight: FontWeight.w500),),

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
                  padding: const EdgeInsets.only(top: 0,bottom: 8,right: 5),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(25.0),
                    child: Card(
                      elevation: 7,
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
