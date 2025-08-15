import 'package:flutter/material.dart';

/// Modelo para representar recursos multimedia del repositorio
class Resource {
  final String id;
  final String title;
  final String description;
  final ResourceType type;
  final String url;
  final String thumbnailUrl;
  final String author;
  final DateTime date;
  final List<String> tags;
  final String language;
  final int duration; // en segundos, solo para audio/video
  final String fileSize; // tamaño del archivo
  final bool isDownloadable;

  const Resource({
    required this.id,
    required this.title,
    required this.description,
    required this.type,
    required this.url,
    required this.thumbnailUrl,
    required this.author,
    required this.date,
    required this.tags,
    required this.language,
    required this.duration,
    required this.fileSize,
    required this.isDownloadable,
  });

  /// Obtener icono del tipo de recurso
  IconData get typeIcon {
    switch (type) {
      case ResourceType.video:
        return Icons.video_library;
      case ResourceType.audio:
        return Icons.audio_file;
      case ResourceType.text:
        return Icons.article;
      case ResourceType.image:
        return Icons.image;
      case ResourceType.document:
        return Icons.description;
    }
  }

  /// Obtener color del tipo de recurso
  Color get typeColor {
    switch (type) {
      case ResourceType.video:
        return Colors.red;
      case ResourceType.audio:
        return Colors.blue;
      case ResourceType.text:
        return Colors.green;
      case ResourceType.image:
        return Colors.purple;
      case ResourceType.document:
        return Colors.orange;
    }
  }

  /// Obtener texto del tipo de recurso
  String get typeText {
    switch (type) {
      case ResourceType.video:
        return 'Video';
      case ResourceType.audio:
        return 'Audio';
      case ResourceType.text:
        return 'Texto';
      case ResourceType.image:
        return 'Imagen';
      case ResourceType.document:
        return 'Documento';
    }
  }

  /// Formatear duración en formato legible
  String get formattedDuration {
    if (duration == 0) return 'N/A';
    
    final hours = duration ~/ 3600;
    final minutes = (duration % 3600) ~/ 60;
    final seconds = duration % 60;
    
    if (hours > 0) {
      return '${hours}h ${minutes}m';
    } else if (minutes > 0) {
      return '${minutes}m ${seconds}s';
    } else {
      return '${seconds}s';
    }
  }

  /// Formatear fecha en formato legible
  String get formattedDate {
    final now = DateTime.now();
    final difference = now.difference(date);
    
    if (difference.inDays == 0) {
      return 'Hoy';
    } else if (difference.inDays == 1) {
      return 'Ayer';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} días';
    } else {
      return '${date.day}/${date.month}/${date.year}';
    }
  }
}

/// Tipos de recursos multimedia
enum ResourceType {
  video,      // Video
  audio,      // Audio
  text,       // Texto
  image,      // Imagen
  document,   // Documento
} 