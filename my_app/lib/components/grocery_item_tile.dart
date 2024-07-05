import 'package:flutter/material.dart';

class GroceryItemTile extends StatelessWidget {
  final String itemName;
  final String itemPrice;
  final String imagePath;
  final color;
  void Function()? onPressed;

   GroceryItemTile({
    super.key,
    required this.itemName,
    required this.imagePath,
    required this.itemPrice,
    required this.color,
    required this.onPressed
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Container(
        padding: EdgeInsets.all(12),
        decoration: BoxDecoration(
            color: color,
            border: Border.all(
                color: const Color.fromARGB(255, 218, 216, 216), width: 1),
            borderRadius: BorderRadius.circular(10)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            //image

            Image.asset(
              imagePath,
              height: 64,
            ),

            //itemName
            Text(itemName,
            style: TextStyle(
              color: Colors.black,
              fontSize: 15,
              fontWeight: FontWeight.bold,
            ),
            ),

            //price + button
            MaterialButton(
              padding: EdgeInsets.all(18),
              onPressed: onPressed,
              color: Colors.green[100],
              child: Text(itemPrice,
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
                fontSize: 15
              ),
              ),
              )
          ],
        ),
      ),
    );
  }
}
