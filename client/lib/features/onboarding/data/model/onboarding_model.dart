import 'package:flutter/material.dart';

class Onboarding {
  final String title;
  final String description;
  final Image image;
  final Color color;

  Onboarding(
      {required this.title,
      required this.description,
      required this.image,
      required this.color});

  factory Onboarding.fromJson(Map<String, dynamic> json) {
    return Onboarding(
      title: json['title'],
      description: json['description'],
      image: json['image'],
      color: json['color'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'title': title,
      'description': description,
      'image': image,
      'color': color,
    };
  }
}
