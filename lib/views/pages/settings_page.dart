import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({
    super.key,
    required this.title,
  });

  final String title;
  @override
  State<SettingsPage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<SettingsPage> {
  TextEditingController controller =TextEditingController();
  bool isChecked =false;
  bool isSwitch =false;
  double sliderValue=0.0;
  String? menuItem='e1';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
        // leading: BackButton(
        //   onPressed: () {
        //     Navigator.pop(context);
        //   },
        // ),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () {
                ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                  duration: Duration(seconds: 5),
                  content: Text('SnackBar'),
                  // behavior: SnackBarBehavior.floating,
                ));
              },
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text("Open SnackBar"),
            ),
            ElevatedButton(
              onPressed: () {
                showDialog(context: context, builder: (context) {
                  return AlertDialog.adaptive(
                    title:Text("Alert Title"),
                    content: Text("Alert Content"),
                    actions: [
                      FilledButton(onPressed: () {
                        Navigator.pop(context);
                      }, child: Text("CLose"))
                    ],
                  );
                });
              },
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text("Open Dialog"),
            ),
            Divider(
              color: Colors.teal,
              thickness: 5.0,
              endIndent: 200.0,
            ),

            DropdownButton(
              value: menuItem,
              items: [
                DropdownMenuItem(value: 'e1',child: Text("element 1")),
                DropdownMenuItem(value: 'e2',child: Text("element 2")),
                DropdownMenuItem(value: 'e3',child: Text("element 3")),
              ],
              onChanged: (String? value) {
                setState(() {
                  menuItem = value;
                });
              },
            ),
            TextField(
              controller: controller,
              decoration: InputDecoration(border: OutlineInputBorder()),
              onEditingComplete: () {
                setState(() {
                });
              },
            ),
            Text(controller.text),
            Checkbox.adaptive(
                value: isChecked,
                onChanged: (bool ? value){
                  setState(() {
                    isChecked = value ?? false;
                  });
                }
            ),
            CheckboxListTile.adaptive(
                title: Text("Check here"),
                value: isChecked,
                onChanged: (bool ? value){
                  setState(() {
                    isChecked = value ?? false;
                  });
                }
            ),
            Switch.adaptive(
              value: isSwitch,
              onChanged: (bool value) {
                isSwitch=value;
              },
            ),
            SwitchListTile.adaptive(
              title: Text("Switch"),
              value: isSwitch,
              onChanged: (bool value) {
                setState(() {
                  isSwitch = value;
                });
              },
            ),
            Slider(
              value: sliderValue,
              onChanged: (double value) {
                setState(() {
                  sliderValue=value;
                });
              },
            ),
            InkWell(
                onTap: () {
                },
                child: Container(
                  height: 200,
                  width: double.infinity,
                  color: Colors.white38,
                )
            ),
            ElevatedButton(
              onPressed: () {
              },
              style:ElevatedButton.styleFrom(
                backgroundColor: Colors.teal,
                foregroundColor: Colors.white,
              ),
              child: Text("CLick ElevatedButton"),
            ),

            FilledButton(
                onPressed: () {},
                child: Text("CLick FilledButton")
            ),
            TextButton(
                onPressed: () {},
                child: Text("CLick TextButton")
            ),
            CloseButton(),
            BackButton(),
          ],
        ),
      ),
    );
  }
}
