import 'package:flutter/material.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/widgets/bottomNav.dart';
import 'package:pantry/views/widgets/nav.dart';

final List donations = ['Clothing', 'Shoes', 'FoodStuffs', 'Monetary\nDonations', 'Volunteer'];
final List donationIcons = [
  Icons.accessibility_new_outlined,
  Icons.snowshoeing_rounded,
  Icons.food_bank_rounded,
  Icons.monetization_on_sharp,
  Icons.add_reaction_rounded,
];

final List quantity = [
  "12", '5', '56', '30000', '5'
];


class Donate extends StatelessWidget {
  const Donate({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(navTitle: const Text("Donate")),
      body: Expanded(
              child: GridView.builder(
                padding: const EdgeInsets.all(10.0),
                itemCount: 5,
                shrinkWrap: true,
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    decoration: const BoxDecoration(
                      color: secondary,
                      borderRadius: BorderRadius.all(Radius.circular(10.0))
                    ),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                       Icon(
                        donationIcons[index],
                        color: primary,
                       ),
                       Text(
                        donations[index],
                        style: const TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w500,
                        ),
                       ),
                      Text(
                        quantity[index],
                      ),
                      ],
                    ),
                  ),
                );
              }),
            )
,
    );
  }
}