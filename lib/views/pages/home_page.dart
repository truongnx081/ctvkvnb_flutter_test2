import 'package:flutter/material.dart';
import 'package:test_4/data/constants.dart';
import 'package:test_4/views/pages/course_page.dart';
import 'package:test_4/widgets/container_widget.dart';
import 'package:test_4/widgets/hero_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {

    List<String> list =[
      KValue.keyConcepts,
      KValue.cleanUi,
      KValue.basicLayout,
      KValue.fixBugs
    ];

    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'FLutter App',nextPage: CoursePage(),),
            ...List.generate(list.length, (index) => ContainerWidget(
              title: list.elementAt(index),
              description: 'This is Basic Layout',
            )),
            // ContainerWidget(title: 'Basic Layout',description: 'This is Basic Layout',),
            // ContainerWidget(title: 'Basic Layout',description: 'This is Basic Layout',),
            // ContainerWidget(title: 'Basic Layout',description: 'This is Basic Layout',)
          ],
        ),
      ),
    );
  }
}
