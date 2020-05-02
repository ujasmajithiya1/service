import 'package:flutter/material.dart';
import '../item.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import '../bloc/cartlistBloc.dart';
import '../model/food_item.dart';
class WheelCareService extends StatefulWidget {
  @override
  _WheelCareServiceState createState() => _WheelCareServiceState();
}

class _WheelCareServiceState extends State<WheelCareService> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        leading: IconButton(
          icon:Icon(Icons.arrow_back_ios,color: Colors.black,),
          onPressed: (){Navigator.pop(context);},
        ),
        title: Text(
          'Wheel Care Service',
          style: TextStyle(fontWeight: FontWeight.bold,color: Colors.black),
        ),
      ),
      body: Container(
        margin: EdgeInsets.only(top: 10),
        child: ListView(
          scrollDirection: Axis.vertical,

          children: <Widget>[
            for (var foodItem in wheelCareService.foodItems)
              Builder(
                builder: (context) {
                  return ItemContainer(foodItem: foodItem);
                },
              )
          ],
        ),
      ),
    );
  }
}

class ItemContainer extends StatelessWidget {

  ItemContainer({
    @required this.foodItem,
  });

  final FoodItem foodItem;
  final CartListBloc bloc = BlocProvider.getBloc<CartListBloc>();


  addToCart(FoodItem foodItem) {
    bloc.addToList(foodItem);
  }

  removeFromList(FoodItem foodItem) {
    bloc.removeFromList(foodItem);
  }


  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        addToCart(foodItem);
        final snackBar = SnackBar(
          content: Text('${foodItem.title} added to Cart'),
          duration: Duration(milliseconds: 550),
        );

        Scaffold.of(context).showSnackBar(snackBar);
      },
      child: Items(
        itemName: foodItem.title,
        itemPrice: foodItem.price,
       
        leftAligned: (foodItem.id % 2) == 0 ? true : false,
      ),
    );
  }
}
