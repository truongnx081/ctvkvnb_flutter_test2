import 'package:flutter/material.dart';
import 'package:test_4/widgets/container_widget.dart';
import 'package:test_4/widgets/hero_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(20.0),
      child: SingleChildScrollView(
        child: Column(
          children: [
            HeroWidget(title: 'FLutter App',),
            ContainerWidget(title: 'Basic Layout',description: 'This is Basic Layout',),
            ContainerWidget(title: 'Basic Layout',description: 'This is Basic Layout',),
            ContainerWidget(title: 'Basic Layout',description: 'This is Basic Layout',)
          ],
        ),
      ),
    );
  }
}
