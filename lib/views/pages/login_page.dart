import 'package:flutter/material.dart';
import 'package:test_4/views/widget_tree.dart';
import 'package:test_4/widgets/hero_widget.dart';


class LoginPage extends StatefulWidget {
  const LoginPage({super.key,required this.title});
  final String title;
  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController controllerEmail =TextEditingController(text: '123');
  TextEditingController controllerPassword =TextEditingController(text: '123');
  String confirmEmail = '123';
  String confirmPassword ='123';
  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controllerEmail.dispose();
    controllerPassword.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double widthScreen=MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: AppBar(),
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(8.0),
          child: LayoutBuilder(builder: (context, BoxConstraints constraints) {
            return FractionallySizedBox(
                widthFactor: widthScreen>500?0.5:1.0,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    HeroWidget(title: widget.title,),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: controllerEmail,
                      decoration: InputDecoration(
                        hintText: 'Email',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                      ),
                      onEditingComplete: () {
                        setState(() {
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    TextField(
                      controller: controllerPassword,
                      decoration: InputDecoration(
                        hintText: 'Password',
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
                      ),
                      onEditingComplete: () {
                        setState(() {
                        });
                      },
                    ),
                    SizedBox(height: 20.0),
                    FilledButton(
                        onPressed: () {
                         onLoginPressed();
                        },
                        style: FilledButton.styleFrom(
                            minimumSize: Size(double.infinity, 40.0),
                        ),
                        child: Text(widget.title)
                    ),
                    SizedBox(height: 50.0,)
                  ],

                ),
              );
          },),
          // child: FractionallySizedBox(
          //   widthFactor: 0.7,
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       HeroWidget(title: widget.title,),
          //       SizedBox(height: 20.0),
          //       TextField(
          //         controller: controllerEmail,
          //         decoration: InputDecoration(
          //           hintText: 'Email',
          //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          //         ),
          //         onEditingComplete: () {
          //           setState(() {
          //           });
          //         },
          //       ),
          //       SizedBox(height: 20.0),
          //       TextField(
          //         controller: controllerPassword,
          //         decoration: InputDecoration(
          //           hintText: 'Password',
          //           border: OutlineInputBorder(borderRadius: BorderRadius.circular(15.0)),
          //         ),
          //         onEditingComplete: () {
          //           setState(() {
          //           });
          //         },
          //       ),
          //       SizedBox(height: 20.0),
          //       FilledButton(
          //           onPressed: () {
          //            onLoginPressed();
          //           },
          //           style: FilledButton.styleFrom(
          //               minimumSize: Size(double.infinity, 40.0),
          //           ),
          //           child: Text(widget.title)
          //       ),
          //       SizedBox(height: 50.0,)
          //     ],
          //
          //   ),
          // ),
        ),
      ),
    );
  }
  void onLoginPressed(){
    if(confirmEmail==controllerEmail.text&&confirmPassword==controllerPassword.text){

      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context) {
            return WidgetTree();
          },
      ),
      (route)=>false
      );
    }
  }
}
