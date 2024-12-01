
 import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:pantry/configs/colors.dart';
import 'package:pantry/controllers/searchBarController.dart';
import 'package:pantry/views/widgets/customInputText.dart';
import 'package:pantry/views/widgets/eventsList.dart';
import 'package:pantry/views/widgets/nav.dart';
import 'package:table_calendar/table_calendar.dart';

class Event extends StatefulWidget {
  const Event({super.key});

  @override
  State<Event> createState() => _EventState();
}

class _EventState extends State<Event> {

  TextEditingController search = Get.put(TextEditingController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: navBar(navTitle: const Text('Events')),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20,),
            //
            Padding(
              padding: const EdgeInsets.all(10.0),
              child: SearchBar(
                controller: search,
                leading: const Icon(Icons.search,
                color: grey,),
                hintText: "Search",
                padding: const WidgetStatePropertyAll(
                  EdgeInsets.all(8.0)
                ),
                hintStyle: const WidgetStatePropertyAll(
                  TextStyle(
                    color: grey,
                  )),
                  onTap: (){
                    // query database for values
                  },
              ),
            ),
            TableCalendar(
              focusedDay: DateTime.now(), 
              firstDay: DateTime.utc(1900), 
              lastDay: DateTime(2030),
              ),
          Eventslist(),
             ],
        ),
      ),

    );
  }
}