import 'package:flutter/material.dart';
import 'package:my_app/components/grocery_item_tile.dart';
import 'package:my_app/models/cart_model_tile_provider.dart';
import 'package:my_app/pages/cart_page.dart';
import 'package:my_app/pages/intro_page.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        leading: IconButton(
          icon: Icon(Icons.arrow_back,
          color: Colors.black,
          ),
          onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (context)=>IntroPage())),
          ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.black,
        onPressed: ()=>Navigator.push(context, MaterialPageRoute(builder: (context)=>CartPage())),
        child: Icon(Icons.shopping_cart,
        color: Colors.white,
        ),
        ),
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40,
            ),
            //first line text
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text(
                "Good Morning!",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18,
                ),
              ),
            ),
            SizedBox(
              height: 4,
            ),
            //second line text

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24.0),
              child: Text(
                "Let's order fresh items for you",
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 36,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),

            //divider
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Divider(),
            ),
            SizedBox(
              height: 24,
            ),

            //fresh items+ grid

            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Text("Fresh Items",
              style: TextStyle(
                fontSize:20,
                color: Colors.black,
              ),
              ),
            ),

            Expanded(
                child: Consumer<CartModel>(
                  builder: (context, value, child) {
                    return GridView.builder(
                      padding: EdgeInsets.all(12),
                      itemCount: value.shopItems.length,
                      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2,
                      childAspectRatio: 1 / 1.3,
                      ),
                      
                      itemBuilder: (context, index) {
                        return GroceryItemTile(
                          itemName: value.shopItems[index][0],
                          itemPrice: "Rs. "+value.shopItems[index][1],
                          imagePath: value.shopItems[index][2],
                          color: value.shopItems[index][3],
                          onPressed: (){
                            Provider.of<CartModel>(context, listen: false).addItemsToCart(index);
                          },
                        );
                      });
                  },
                )),
          ],
        ),
      ),
    );
  }
}
