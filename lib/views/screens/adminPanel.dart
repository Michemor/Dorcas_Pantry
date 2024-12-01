import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/views/widgets/nav.dart';

class Adminpanel extends StatefulWidget {
  const Adminpanel({super.key});

  @override
  State<Adminpanel> createState() => _AdminpanelState();
}

class _AdminpanelState extends State<Adminpanel> {
  final TextEditingController name = Get.put(TextEditingController());
  final TextEditingController description = Get.put(TextEditingController());
  final TextEditingController venue = Get.put(TextEditingController());
  final TextEditingController date = Get.put(TextEditingController());
  final TextEditingController start = Get.put(TextEditingController());
  final TextEditingController time = Get.put(TextEditingController());
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(navTitle: Text('Admin')),
      backgroundColor: white,
      body: Container(
        child: Column(
          children: [
            const Text('Create an Event'),
            Form(child: Column(
              children: [
                 TextFormField(
              controller: name,
              cursorColor: primary,
              onTap: () {
                
              },
              decoration: InputDecoration(
                // include text for user
                labelText: 'Event Name',
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(15.0),
                )
              ),
            ),
            const SizedBox(height: 20,),
                
              ],
            ))
          ],
        ),
      ),
    );
  }
}