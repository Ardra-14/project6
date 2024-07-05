import 'package:flutter/material.dart';
import 'package:my_app/models/cart_model_tile_provider.dart';
import 'package:provider/provider.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        foregroundColor: Colors.white,
        centerTitle: true,
        title: Text("My Cart",
        style: TextStyle(
          color: Colors.white,
          fontWeight: FontWeight.bold
          ),
        ),
        backgroundColor: Colors.black,
      ),

      body: Consumer<CartModel>(builder: (context, value, child) {
        return Column(
        children: [
          Expanded(
            child: ListView.builder(
              padding: EdgeInsets.all(12),
              itemCount: value.cartItems.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(12),
                  child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey[100],
                      borderRadius: BorderRadius.circular(12)
                    ),
                    child: ListTile(
                      leading: Image.asset(value.cartItems[index][2],
                      height: 36,
                      ),
                      title: Text(value.cartItems[index][0],
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      subtitle: Text(value.cartItems[index][1],
                      style: TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.bold
                        ),
                      ),
                      trailing: IconButton(
                        icon: Icon(Icons.cancel),
                        onPressed: () {
                         return  Provider.of<CartModel>(context, listen: false).removeItemsFromCart(index);
                        },
                        ),
                    ),
                  ),
                );
              },
              ),
            ),

            //totalprice + paynow

            Padding(
              padding: const EdgeInsets.all(36),
              child: Container(
               decoration: BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.circular(8),
               ),
              padding: EdgeInsets.all(24),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children : [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Total Price ",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                        ),
                        SizedBox(height: 4,),
                        Text("Rs."+value.calculateTotal(),
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                        ),
                      ],
                    ),

                    //paynow

                    Container(
                      decoration: BoxDecoration(
                        border: Border.all(color: Colors.white),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: EdgeInsets.all(12),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children:[
                          Text("Pay Now",
                          style: TextStyle(
                          fontSize: 15,
                          color: Colors.white,
                        ),
                          ),
                          Icon(Icons.arrow_forward,
                          size: 16,
                          color: Colors.white,
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            )
      ],
      );
      },)
    );
  }
}