import'package:flutter/material.dart';
import 'package:mavazi/model/cart_item.dart';

class CartCard extends StatelessWidget{
  final CartItem cartItem;
  final VoidCallback increment;
  final VoidCallback decrement;

  const CartCard({super.key, required this.cartItem, required this.increment, required this.decrement});

  @override
  Widget build(BuildContext context){
    return Card(
    margin: EdgeInsets.only(left:16,right:16,top:8,bottom:8), 
    child: Padding(
      padding: EdgeInsets.all(16),
        child:Row(
         children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child:  Image.network(cartItem.product.imageUrl,width:150,height:150,),
          ),
      

       SizedBox(width: 16,),
        Expanded(child: 
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children:[
            Text(cartItem.product.name),
            SizedBox(height: 8,),
            Text(cartItem.product.price.toString()),
            SizedBox(height: 8,),
            Row(children: [
              IconButton(
                onPressed: decrement,
                icon: Icon(Icons.remove),
              ),
              Text('${cartItem.quantity}'),
              IconButton(
                onPressed: increment,
                icon: Icon(Icons.add),
              ),
              //  con(Icons.add_shopping_cart_outlined))

            ],)
           
          ],
        ),
        )

      ],
    ),
  )
    
  );
}
}
    
 