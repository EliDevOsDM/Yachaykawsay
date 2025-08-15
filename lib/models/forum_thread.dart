import 'package:flutter/material.dart';

/// Modelo para representar hilos del foro de colaboración
class ForumThread {
  final String id;
  final String title;
  final String content;
  final String authorId;
  final String authorName;
  final String authorAvatar;
  final DateTime createdAt;
  final DateTime lastUpdated;
  final List<String> tags;
  final int replyCount;
  final int likeCount;
  final int viewCount;
  final bool isPinned;
  final bool isLocked;
  final String category;
  final List<ForumReply> replies;

  const ForumThread({
    required this.id,
    required this.title,
    required this.content,
    required this.authorId,
    required this.authorName,
    required this.authorAvatar,
    required this.createdAt,
    required this.lastUpdated,
    required this.tags,
    required this.replyCount,
    required this.likeCount,
    required this.viewCount,
    required this.isPinned,
    required this.isLocked,
    required this.category,
    required this.replies,
  });

  /// Obtener preview del contenido (primeros 100 caracteres)
  String get contentPreview {
    if (content.length <= 100) {
      return content;
    }
    return '${content.substring(0, 100)}...';
  }

  /// Formatear fecha de creación
  String get formattedCreatedAt {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Ahora';
        }
        return 'Hace ${difference.inMinutes} min';
      }
      return 'Hace ${difference.inHours} h';
    } else if (difference.inDays == 1) {
      return 'Ayer';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} días';
    } else {
      return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
    }
  }

  /// Formatear fecha de última actualización
  String get formattedLastUpdated {
    final now = DateTime.now();
    final difference = now.difference(lastUpdated);
    
    if (difference.inDays == 0) {
      return 'Hoy';
    } else if (difference.inDays == 1) {
      return 'Ayer';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} días';
    } else {
      return '${lastUpdated.day}/${lastUpdated.month}/${lastUpdated.year}';
    }
  }

  /// Verificar si es un hilo reciente (menos de 24 horas)
  bool get isRecent => DateTime.now().difference(createdAt).inDays < 1;

  /// Verificar si es un hilo popular (más de 10 respuestas o 50 likes)
  bool get isPopular => replyCount > 10 || likeCount > 50;
}

/// Modelo para representar respuestas en el foro
class ForumReply {
  final String id;
  final String threadId;
  final String content;
  final String authorId;
  final String authorName;
  final String authorAvatar;
  final DateTime createdAt;
  final DateTime lastUpdated;
  final int likeCount;
  final List<String> likedBy;
  final String? parentReplyId; // Para respuestas anidadas
  final List<ForumReply> nestedReplies;

  const ForumReply({
    required this.id,
    required this.threadId,
    required this.content,
    required this.authorId,
    required this.authorName,
    required this.authorAvatar,
    required this.createdAt,
    required this.lastUpdated,
    required this.likeCount,
    required this.likedBy,
    this.parentReplyId,
    required this.nestedReplies,
  });

  /// Formatear fecha de creación
  String get formattedCreatedAt {
    final now = DateTime.now();
    final difference = now.difference(createdAt);
    
    if (difference.inDays == 0) {
      if (difference.inHours == 0) {
        if (difference.inMinutes == 0) {
          return 'Ahora';
        }
        return 'Hace ${difference.inMinutes} min';
      }
      return 'Hace ${difference.inHours} h';
    } else if (difference.inDays == 1) {
      return 'Ayer';
    } else if (difference.inDays < 7) {
      return 'Hace ${difference.inDays} días';
    } else {
      return '${createdAt.day}/${createdAt.month}/${createdAt.year}';
    }
  }

  /// Verificar si es una respuesta reciente
  bool get isRecent => DateTime.now().difference(createdAt).inHours < 1;

  /// Verificar si es una respuesta popular
  bool get isPopular => likeCount > 5;
} 