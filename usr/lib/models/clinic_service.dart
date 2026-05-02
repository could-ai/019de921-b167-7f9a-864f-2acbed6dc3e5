import 'package:flutter/material.dart';

class ClinicService {
  final String id;
  final String name;
  final IconData icon;
  final Color color;

  ClinicService({
    required this.id,
    required this.name,
    required this.icon,
    required this.color,
  });
}

final List<ClinicService> mockServices = [
  ClinicService(id: 's1', name: 'Cardiology', icon: Icons.favorite, color: Colors.redAccent),
  ClinicService(id: 's2', name: 'Neurology', icon: Icons.psychology, color: Colors.purple),
  ClinicService(id: 's3', name: 'Pediatrics', icon: Icons.child_care, color: Colors.orange),
  ClinicService(id: 's4', name: 'Dental', icon: Icons.health_and_safety, color: Colors.teal),
  ClinicService(id: 's5', name: 'Eye Care', icon: Icons.remove_red_eye, color: Colors.blue),
  ClinicService(id: 's6', name: 'Orthopedics', icon: Icons.accessible_forward, color: Colors.brown),
];
