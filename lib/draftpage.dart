import 'package:flutter/material.dart';

class Draftpage extends StatefulWidget {
  const Draftpage({super.key});

  @override
  State<Draftpage> createState() => _DraftpageState();
}

class _DraftpageState extends State<Draftpage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Text("data"),
    ));
  }
}
