import 'package:flutter/material.dart';

class ChangedScreen extends StatefulWidget {
  const ChangedScreen({super.key});

  @override
  State<ChangedScreen> createState() => _ChangedScreenState();
}

class _ChangedScreenState extends State<ChangedScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        centerTitle: true,
        title: Text("Changed",style: TextStyle(fontSize: 20,fontWeight: FontWeight.w600,color: Colors.white),),
      ),
    );
  }
}
