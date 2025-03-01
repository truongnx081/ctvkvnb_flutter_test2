import 'package:flutter/material.dart';

class ExpandedAndFlexibleTest extends StatelessWidget {
  const ExpandedAndFlexibleTest({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),
      body: Column(
        children: [
          Row(
            children: [
              Expanded(
                  child: Container(
                    color: Colors.teal,
                    height: 20,
                    child: Text("111111111"),
                 ),
              ),
              Flexible(
                  child: Container(
                    color: Colors.red,
                    height: 20,
                    child: Text("111111111"),
                  )
              ),
            ],
          ),
          Divider(),
          Row(
            children: [
              Expanded(
                child: Container(
                  color: Colors.teal,
                  height: 20,
                  child: Text("111111111"),
                ),
              ),
              Flexible(
                  child: Container(
                    color: Colors.red,
                    height: 20,
                    child: Text("111111111"),
                  )
              ),
            ],
          ),
        ],
      ),
    );
  }
}
