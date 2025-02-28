import 'package:flutter/material.dart';

class ContainerWidget extends StatelessWidget {
  const ContainerWidget({
    super.key,
    required this.title,
    required this .description
  });


  final String title;

  final String description;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(vertical: 10.0),
      child: Card(
        child: Padding(
          padding: EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                  title,
                  style:
                  TextStyle(
                      color: Colors.teal,
                      fontSize: 18.0,
                      fontWeight: FontWeight.bold
                  )
              ),
              Text(
                  description
              )
            ],
          ),
        ),
      ),
    );
  }
}
