import 'dart:io';

import 'package:flutter/material.dart';

class ViewStudentScreen extends StatelessWidget {
  final String name;
  final String age;
  final String place;
  final String phone;
  final String imagePath;

  const ViewStudentScreen({super.key, 
    required this.name,
    required this.age,
    required this.place,
    required this.phone,
    required this.imagePath,
  });

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 158, 158, 167),
      appBar: AppBar(
        backgroundColor: Colors.brown,
        title: const Text("STUDENT PROFILE"),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                width: 140,
                height: 140,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Color.fromARGB(255, 3, 3, 3),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.4),
                      blurRadius: 15,
                      offset: const Offset(0, 8),
                    ),
                  ],
                ),
                child: CircleAvatar(
                  radius: 60,
                  backgroundColor: Colors.transparent,
                  backgroundImage: FileImage(File(imagePath)),
                ),
              ),
              const SizedBox(height: 15),
              CardItem(
                title: 'Name',
                content: name,
              ),
              const SizedBox(
                height: 20,
              ),
              CardItem(
                title: 'Age',
                content: age,
              ),
              const SizedBox(
                height: 20,
              ),
              CardItem(
                title: 'Place',
                content: place,
              ),
              const SizedBox(
                height: 20,
              ),
              CardItem(
                title: 'Phone',
                content: phone,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final String content;

  const CardItem({
    required this.title,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 5,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      color: Color.fromARGB(255, 9, 8, 9),
      child: Container(
        padding: const EdgeInsets.all(20),
        width: double.infinity,
        height: 100,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: const TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            const SizedBox(height: 8),
            Text(
              content,
              style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.white),
            ),
          ],
        ),
      ),
    );
  }
}