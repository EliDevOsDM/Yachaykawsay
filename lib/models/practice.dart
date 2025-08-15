/// Modelo para representar prácticas ambientales (ancestrales y modernas)
class Practice {
  final String id;
  final String title;
  final String description;
  final String category;
  final String type; // 'ancestral' o 'modern'
  final String imageUrl;
  final List<String> benefits;
  final List<String> challenges;
  final String location;
  final String community;

  const Practice({
    required this.id,
    required this.title,
    required this.description,
    required this.category,
    required this.type,
    required this.imageUrl,
    required this.benefits,
    required this.challenges,
    required this.location,
    required this.community,
  });

  /// Crear práctica ancestral
  factory Practice.ancestral({
    required String id,
    required String title,
    required String description,
    required String category,
    required String imageUrl,
    required List<String> benefits,
    required List<String> challenges,
    required String location,
    required String community,
  }) {
    return Practice(
      id: id,
      title: title,
      description: description,
      category: category,
      type: 'ancestral',
      imageUrl: imageUrl,
      benefits: benefits,
      challenges: challenges,
      location: location,
      community: community,
    );
  }

  /// Crear práctica moderna
  factory Practice.modern({
    required String id,
    required String title,
    required String description,
    required String category,
    required String imageUrl,
    required List<String> benefits,
    required List<String> challenges,
    required String location,
    required String community,
  }) {
    return Practice(
      id: id,
      title: title,
      description: description,
      category: category,
      type: 'modern',
      imageUrl: imageUrl,
      benefits: benefits,
      challenges: challenges,
      location: location,
      community: community,
    );
  }

  /// Verificar si es práctica ancestral
  bool get isAncestral => type == 'ancestral';

  /// Verificar si es práctica moderna
  bool get isModern => type == 'modern';
} 