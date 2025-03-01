import 'package:flutter/material.dart';
import 'package:test_4/data/class/activity_class.dart';
import 'package:test_4/widgets/hero_widget.dart';
import 'dart:convert' as convert;
import 'package:http/http.dart' as http;
import 'package:url_launcher/url_launcher.dart';

class CoursePage extends StatefulWidget {
  const CoursePage({super.key});

  @override
  State<CoursePage> createState() => _CoursePageState();
}

class _CoursePageState extends State<CoursePage> {
  Future<Activity>? activityFuture;

  @override
  void initState() {
    super.initState();
    activityFuture = getData();
  }

  Future<Activity> getData() async {
    try {
      var url = Uri.parse('https://bored.api.lewagon.com/api/activity/');
      print("Fetching data from: $url");

      var response = await http.get(url);
      print("Response status: ${response.statusCode}");

      if (response.statusCode == 200) {
        var jsonResponse = convert.jsonDecode(response.body) as Map<String, dynamic>;
        print("Response data: $jsonResponse");
        return Activity.fromJson(jsonResponse);
      } else {
        throw Exception('Failed to load activity, Status Code: ${response.statusCode}');
      }
    } catch (e) {
      print("Error fetching data: $e");
      throw Exception("Failed to load activity: $e");
    }
  }

  void launchUrl(String url) async {
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      print("Could not open the link");
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Course Page")),
      body: FutureBuilder<Activity>(
        future: activityFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text("Error: ${snapshot.error}"));
          } else if (snapshot.hasData) {
            Activity activity = snapshot.data!;
            return Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.0),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    HeroWidget(title: 'Course'),
                    SizedBox(height: 20),
                    Text("Activity: ${activity.activity}",
                        style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
                    SizedBox(height: 8),
                    Text("Type: ${activity.type}",
                        style: TextStyle(fontSize: 16, color: Colors.grey)),
                    SizedBox(height: 8),
                    Text("Participants: ${activity.participants}",
                        style: TextStyle(fontSize: 16)),
                    Text("Price: ${activity.price}",
                        style: TextStyle(fontSize: 16)),
                    Text("Accessibility: ${activity.accessibility}",
                        style: TextStyle(fontSize: 16)),
                  ],
                ),
              ),
            );

          } else {
            return Center(child: Text("No data available"));
          }
        },
      ),
    );
  }
}
