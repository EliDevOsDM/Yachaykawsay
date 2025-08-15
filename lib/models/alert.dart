import 'package:flutter/material.dart';

/// Modelo para representar alertas ambientales
class Alert {
  final String id;
  final String title;
  final String description;
  final AlertType type;
  final AlertSeverity severity;
  final String location;
  final DateTime date;
  final String reportedBy;
  final String imageUrl;
  final bool isActive;
  final List<String> actions;

  const Alert({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.severity,
    required this.location,
    required this.date,
    required this.reportedBy,
    required this.imageUrl,
    required this.isActive,
    required this.actions,
  });

  /// Obtener color del tipo de alerta
  Color get typeColor {
    switch (type) {
      case AlertType.mining:
        return const Color(0xFFFF9800); // Naranja
      case AlertType.logging:
        return const Color(0xFFFFEB3B); // Amarillo
      case AlertType.fire:
        return const Color(0xFFD32F2F); // Rojo
      case AlertType.water:
        return const Color(0xFF2196F3); // Azul
      case AlertType.soil:
        return const Color(0xFF795548); // Marrón
    }
  }

  /// Obtener icono del tipo de alerta
  IconData get typeIcon {
    switch (type) {
      case AlertType.mining:
        return Icons.construction;
      case AlertType.logging:
        return Icons.forest;
      case AlertType.fire:
        return Icons.local_fire_department;
      case AlertType.water:
        return Icons.water_drop;
      case AlertType.soil:
        return Icons.landscape;
    }
  }

  /// Obtener texto del tipo de alerta
  String get typeText {
    switch (type) {
      case AlertType.mining:
        return 'Minería';
      case AlertType.logging:
        return 'Tala';
      case AlertType.fire:
        return 'Incendio';
      case AlertType.water:
        return 'Agua';
      case AlertType.soil:
        return 'Suelo';
    }
  }

  /// Obtener color de la severidad
  Color get severityColor {
    switch (severity) {
      case AlertSeverity.low:
        return Colors.green;
      case AlertSeverity.medium:
        return Colors.orange;
      case AlertSeverity.high:
        return Colors.red;
      case AlertSeverity.critical:
        return const Color(0xFF8B0000); // Rojo oscuro
    }
  }

  /// Obtener texto de la severidad
  String get severityText {
    switch (severity) {
      case AlertSeverity.low:
        return 'Baja';
      case AlertSeverity.medium:
        return 'Media';
      case AlertSeverity.high:
        return 'Alta';
      case AlertSeverity.critical:
        return 'Crítica';
    }
  }
}

/// Tipos de alertas ambientales
enum AlertType {
  mining,    // Minería
  logging,   // Tala
  fire,      // Incendio
  water,     // Contaminación del agua
  soil,      // Degradación del suelo
}

/// Niveles de severidad de las alertas
enum AlertSeverity {
  low,       // Baja
  medium,    // Media
  high,      // Alta
  critical,  // Crítica
} 