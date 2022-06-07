import 'package:flutter/material.dart';
import 'package:test_task_2/helpers/firebase_database.dart';

class DialogBox extends StatefulWidget {

   const DialogBox({Key? key, }) : super(key: key);

  @override
  State<DialogBox> createState() => _DialogBoxState();
}

class _DialogBoxState extends State<DialogBox> {
  String dropDownValue = 'Damage';

  // List of items in our dropdown menu
  var items = [
    'Damage',
    'Missing Parts',
    'Others',
  ];

  final nameController = TextEditingController();
  final numberController = TextEditingController();
  final descriptionController = TextEditingController();



  @override
  Widget build(BuildContext context) {

    return AlertDialog(
      title: SizedBox(
        width: 200,
        child: Center(
          child: DropdownButton(
            // Initial Value
            value: dropDownValue,
            // Down Arrow Icon
            icon: const Icon(Icons.keyboard_arrow_down),
            // Array list of items
            items: items.map((String items) {
              return DropdownMenuItem(
                value: items,
                child: Text(items),
              );
            }).toList(),
            onChanged: (String? newValue) {
              setState(() {
                dropDownValue = newValue!;
              });
            },
          ),
        ),
      ),
      content: SingleChildScrollView(
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            TextField(
              controller: nameController,
              decoration: InputDecoration(
                  hintText: 'Enter Name',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              keyboardType: TextInputType.phone,
              controller: numberController,
              decoration: InputDecoration(
                  hintText: 'Enter Phone Number',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextField(
              maxLines: 10,
              controller: descriptionController,
              decoration: InputDecoration(
                  hintText: 'Enter Description',
                  contentPadding: const EdgeInsets.all(15),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(30))),
            ),
          ],
        ),
      ),
      actions: [
        MaterialButton(
          textColor: Colors.black,
          onPressed: () {
            Navigator.pop(context);
          },
          child: const Text('CANCEL'),
        ),
        MaterialButton(
          textColor: Colors.black,
          onPressed: () {
            if (nameController.text != '' &&
                numberController.text != '' &&
                descriptionController.text != '' &&
                dropDownValue != '') {
              Map<String, String> userInfoMap = {
                "name": nameController.text,
                "number": numberController.text,
                "description": descriptionController.text,
                "problem": dropDownValue,
                "status": "Not Started"
              };
              FireBaseMethods().uploadUserInfo(userInfoMap);
                Navigator.pop(context);
            }
          },
          child: const Text('SEND'),
        ),
      ],
    );
  }
}
