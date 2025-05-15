import 'package:flutter/material.dart';
import 'about.dart';
import 'projects.dart';
import 'skills.dart';
import 'contact.dart';

void main() {
  runApp(const MyPortfolioApp());
}

class MyPortfolioApp extends StatelessWidget {
  const MyPortfolioApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'My Portfolio',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MainPage(),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 4,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('My Portfolio'),
          bottom: const TabBar(
            tabs: [
              Tab(icon: Icon(Icons.person), text: 'About'),
              Tab(icon: Icon(Icons.work), text: 'Projects'),
              Tab(icon: Icon(Icons.code), text: 'Skills'),
              Tab(icon: Icon(Icons.mail), text: 'Contact'),
            ],
          ),
        ),
        body: const TabBarView(
          children: [
            AboutPage(),
            ProjectsPage(),
            SkillsPage(),
            ContactPage(),
          ],
        ),
      ),
    );
  }
}
