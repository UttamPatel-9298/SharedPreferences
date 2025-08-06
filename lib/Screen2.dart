import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Screen2 extends StatelessWidget {
  const Screen2({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Screen2Page(),
    );
  }
}

class Screen2Page extends StatefulWidget {
  const Screen2Page({super.key});

  @override
  State<Screen2Page> createState() => _Screen2PageState();
}

class _Screen2PageState extends State<Screen2Page> {
  String _savedName = "";

  @override
  void initState() {
    super.initState();
    _loadName();
  }

  Future<void> _loadName() async {
    final prefs = await SharedPreferences.getInstance();
    setState(() {
      _savedName = prefs.getString('name') ?? '';
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Shared Preference"),
        backgroundColor: Colors.deepOrange,
      ),
      body: Center(
        child: Text(
          _savedName.isNotEmpty ? "Hello, $_savedName!" : "No name found.",
          style: const TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
