import 'package:flutter/material.dart';
import '../datamodels/services_model.dart';


class ServicesWidget extends StatelessWidget {
  ServicesWidget({Key? key}) : super(key: key);
  final List<ServicesModel> imageList = [
    ServicesModel(image: 'assets/images/services/Signature.png', text: 'Know More'),
    ServicesModel(image:'assets/images/services/Value.png', text: 'Know More'),
    ServicesModel(image:'assets/images/services/Luxury.png', text: 'Know More'),



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
                Text('Services',style: TextStyle(fontFamily: 'Poppins',color: Colors.black, fontSize: 20,fontWeight: FontWeight.w500),),

              ],
            ),
          ),
          Container(
            width: 380,
            height: 360,
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

                          Text('${imageList[index].text}',style: TextStyle(fontFamily: 'Poppins',color: Color(0xFF600D8D))),
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
