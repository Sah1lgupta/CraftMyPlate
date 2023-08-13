import 'package:flutter/material.dart';

import '../datamodels/menu_model.dart';


class MenuWidget extends StatelessWidget {
  MenuWidget({Key? key}) : super(key: key);
  final List<MenuModel> imageList = [
    MenuModel(image: 'assets/images/menu/menu.png', menu: ['3 starters','3 maincourse','3 desserts ','3 drinks'], quantity: 'Min 800', menuNumber: 'Default Menu 1', price: 'Starts at ₹ 777'),
    MenuModel(image: 'assets/images/menu/menu.png', menu: ['1 starters','1 Plain Rice','1 desserts ','1 drinks'], quantity: 'Min 1000', menuNumber: 'Default Menu 2', price: 'Starts at ₹ 350'),
    MenuModel(image: 'assets/images/menu/menu.png', menu: ['10 starters','10 Biryani','10 desserts ','10 drinks'], quantity: 'Min 200', menuNumber: 'Default Menu 3', price: 'Starts at ₹ 999'),

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
                Text('Menu ',style: TextStyle(fontFamily: 'Poppins',color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),
              //  Text('More Main Course ',style: TextStyle(fontFamily: 'Poppins',color: Color(0xFF600D8D), fontSize: 13,fontWeight: FontWeight.w500),),

              ],
            ),
          ),
          Container(
            width: 400,
            height: 190,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: imageList.length,
              itemBuilder: (context, index) {
                return   SizedBox(
                  width: 220,
                  height: 190,
                  child:  Container(
                      height: 220,
                      width: 190,
                      child: Stack(
                          children: [



                            Positioned(
                              left:20,
                              child: SizedBox(
                                width: 220,
                                height: 190,
                                child: ClipRRect(
                                    borderRadius: BorderRadius.circular(25.0),
                                    child: Card(
                                      elevation: 7,
                                      child: Column(
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [

                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Text('${imageList[index].menuNumber}',style: TextStyle(fontFamily: 'Poppins',fontWeight: FontWeight.bold,fontSize: 15)),
                                            ],
                                          ),

                                          SizedBox(height: 10,),
                                          Row(
                                            mainAxisAlignment: MainAxisAlignment.end,
                                            children: [
                                              Column(
                                                children: [
                                                  SizedBox(height: 5,),
                                                  Container(
                                                    height: 70,
                                                    width: 70,
                                                    child: ListView.builder(
                                                        itemCount: imageList[index].menu.length,
                                                        itemBuilder: (context, position){
                                                          return  Text('${imageList[index].menu[position]}',style: TextStyle(fontFamily: 'Poppins',fontSize: 10));

                                                        }),
                                                  ),

                                                ],
                                              ),
                                              SizedBox(width: 50,),
                                            ],
                                          ),


                                          SizedBox(height: 28,),



                                          Row(
                                            children: [
                                              Icon(Icons.person,size: 20,),
                                              Text('${imageList[index].quantity}',style: TextStyle(fontFamily: 'Poppins',fontSize: 12,fontWeight: FontWeight.w400)),
                                            ],
                                          ),

                                          Text('${imageList[index].price}',style: TextStyle(fontFamily: 'Poppins',color: Color(0xFF600D8D))),
                                        ],
                                      ),
                                    ),
                                  ),

                              ),
                            ),


                            Positioned(
                              right:80,
                              bottom: 55,

                              child: Image.asset(
                                '${imageList[index].image}',
                                fit: BoxFit.fill,scale: MediaQuery.of(context).size.aspectRatio *1.6,
                              ),
                            ),


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
