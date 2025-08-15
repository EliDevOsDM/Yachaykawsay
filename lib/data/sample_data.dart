import '../models/practice.dart';
import '../models/alert.dart';
import '../models/resource.dart';
import '../models/forum_thread.dart';

/// Datos de ejemplo para la aplicación YachayKawsay
class SampleData {
  /// Prácticas ambientales de ejemplo
  static List<Practice> get practices => [
    // Prácticas ancestrales
    Practice.ancestral(
      id: '1',
      title: 'Chakra Andina',
      description: 'Sistema tradicional de cultivo en terrazas que aprovecha la pendiente de las montañas para conservar el suelo y el agua.',
      category: 'Agricultura',
      imageUrl: 'assets/images/chakra_andina.jpg',
      benefits: [
        'Conservación del suelo',
        'Manejo eficiente del agua',
        'Biodiversidad agrícola',
        'Resistencia climática'
      ],
      challenges: [
        'Requiere conocimiento ancestral',
        'Mano de obra intensiva',
        'Necesita mantenimiento constante'
      ],
      location: 'Sierra ecuatoriana',
      community: 'Comunidades Kichwa'
    ),
    
    Practice.ancestral(
      id: '2',
      title: 'Sistema de Riego por Acequias',
      description: 'Red de canales de agua que distribuye el recurso hídrico de manera equitativa entre las comunidades.',
      category: 'Gestión del Agua',
      imageUrl: 'assets/images/acequias.jpg',
      benefits: [
        'Distribución equitativa del agua',
        'Mantenimiento comunitario',
        'Adaptación al terreno',
        'Sostenibilidad a largo plazo'
      ],
      challenges: [
        'Requiere organización comunitaria',
        'Mantenimiento regular',
        'Conflictos por distribución'
      ],
      location: 'Valles interandinos',
      community: 'Comunidades campesinas'
    ),
    
    Practice.ancestral(
      id: '3',
      title: 'Medicina de las Plantas',
      description: 'Conocimiento ancestral sobre las propiedades curativas de las plantas nativas de los Andes.',
      category: 'Medicina Tradicional',
      imageUrl: 'assets/images/medicina_plantas.jpg',
      benefits: [
        'Accesibilidad local',
        'Bajo costo',
        'Conocimiento validado por siglos',
        'Conexión cultural'
      ],
      challenges: [
        'Pérdida de conocimiento',
        'Escasez de plantas',
        'Necesita validación científica'
      ],
      location: 'Región Andina',
      community: 'Yachaks y curanderos'
    ),
    
    // Prácticas modernas
    Practice.modern(
      id: '4',
      title: 'Agricultura de Precisión',
      description: 'Uso de tecnología GPS y sensores para optimizar el uso de insumos agrícolas y mejorar la productividad.',
      category: 'Agricultura',
      imageUrl: 'assets/images/agricultura_precision.jpg',
      benefits: [
        'Mayor eficiencia',
        'Reducción de costos',
        'Monitoreo en tiempo real',
        'Datos precisos'
      ],
      challenges: [
        'Alto costo inicial',
        'Requiere capacitación',
        'Dependencia tecnológica'
      ],
      location: 'Zonas agrícolas modernas',
      community: 'Agricultores tecnificados'
    ),
    
    Practice.modern(
      id: '5',
      title: 'Sistemas de Riego por Goteo',
      description: 'Tecnología que suministra agua directamente a las raíces de las plantas de manera controlada.',
      category: 'Gestión del Agua',
      imageUrl: 'assets/images/riego_goteo.jpg',
      benefits: [
        'Ahorro significativo de agua',
        'Mayor productividad',
        'Control preciso',
        'Reducción de malezas'
      ],
      challenges: [
        'Costo de instalación',
        'Mantenimiento técnico',
        'Vulnerabilidad a daños'
      ],
      location: 'Zonas áridas y semiáridas',
      community: 'Agricultores comerciales'
    ),
    
    Practice.modern(
      id: '6',
      title: 'Monitoreo Satelital Ambiental',
      description: 'Uso de imágenes satelitales para monitorear cambios en la cobertura vegetal y detectar amenazas ambientales.',
      category: 'Monitoreo Ambiental',
      imageUrl: 'assets/images/monitoreo_satelital.jpg',
      benefits: [
        'Cobertura amplia',
        'Datos actualizados',
        'Detección temprana',
        'Análisis histórico'
      ],
      challenges: [
        'Costo de acceso',
        'Interpretación técnica',
        'Dependencia de satélites'
      ],
      location: 'Nivel nacional',
      community: 'Instituciones ambientales'
    ),
  ];

  /// Alertas ambientales de ejemplo
  static List<Alert> get alerts => [
    Alert(
      id: '1',
      title: 'Actividad Minera Ilegal en Reserva',
      description: 'Se ha detectado actividad minera no autorizada en la Reserva Ecológica Los Ilinizas, afectando el ecosistema local.',
      type: AlertType.mining,
      severity: AlertSeverity.high,
      location: 'Reserva Los Ilinizas, Cotopaxi',
      date: DateTime.now().subtract(const Duration(hours: 2)),
      reportedBy: 'Guardaparque Local',
      imageUrl: 'assets/images/alerta_mineria.jpg',
      isActive: true,
      actions: [
        'Reportar a autoridades',
        'Documentar evidencia',
        'Alertar a comunidad'
      ],
    ),
    
    Alert(
      id: '2',
      title: 'Incendio Forestal en Bosque Nublado',
      description: 'Incendio de gran magnitud afectando el bosque nublado de Mindo, amenazando la biodiversidad local.',
      type: AlertType.fire,
      severity: AlertSeverity.critical,
      location: 'Bosque Nublado de Mindo, Pichincha',
      date: DateTime.now().subtract(const Duration(hours: 6)),
      reportedBy: 'Bomberos de Mindo',
      imageUrl: 'assets/images/alerta_incendio.jpg',
      isActive: true,
      actions: [
        'Evacuar área',
        'Llamar bomberos',
        'Evitar propagación'
      ],
    ),
    
    Alert(
      id: '3',
      title: 'Tala Selectiva en Bosque Primario',
      description: 'Se observa tala selectiva de árboles centenarios en el bosque primario de la Amazonía ecuatoriana.',
      type: AlertType.logging,
      severity: AlertSeverity.medium,
      location: 'Bosque Amazónico, Napo',
      date: DateTime.now().subtract(const Duration(days: 1)),
      reportedBy: 'Comunidad Kichwa',
      imageUrl: 'assets/images/alerta_tala.jpg',
      isActive: true,
      actions: [
        'Reportar a Ministerio',
        'Documentar especies',
        'Proteger área'
      ],
    ),
    
    Alert(
      id: '4',
      title: 'Contaminación del Río Napo',
      description: 'Vertimiento de aguas residuales industriales en el río Napo, afectando la calidad del agua.',
      type: AlertType.water,
      severity: AlertSeverity.high,
      location: 'Río Napo, Francisco de Orellana',
      date: DateTime.now().subtract(const Duration(days: 2)),
      reportedBy: 'ONG Ambiental',
      imageUrl: 'assets/images/alerta_agua.jpg',
      isActive: true,
      actions: [
        'Tomar muestras',
        'Reportar a autoridades',
        'Alertar a comunidades'
      ],
    ),
  ];

  /// Recursos del repositorio de ejemplo
  static List<Resource> get resources => [
    Resource(
      id: '1',
      title: 'Técnicas de Conservación del Suelo',
      description: 'Video documental sobre métodos ancestrales y modernos para conservar la fertilidad del suelo en los Andes.',
      type: ResourceType.video,
      url: 'https://example.com/video_conservacion_suelo.mp4',
      thumbnailUrl: 'assets/images/thumbnail_conservacion_suelo.jpg',
      author: 'Dr. María González',
      date: DateTime.now().subtract(const Duration(days: 5)),
      tags: ['suelo', 'conservación', 'Andes', 'agricultura'],
      language: 'es',
      duration: 1800, // 30 minutos
      fileSize: '150 MB',
      isDownloadable: true,
    ),
    
    Resource(
      id: '2',
      title: 'Cantos Tradicionales de la Naturaleza',
      description: 'Colección de cantos y melodías tradicionales que celebran la conexión con la naturaleza.',
      type: ResourceType.audio,
      url: 'https://example.com/audio_cantos_tradicionales.mp3',
      thumbnailUrl: 'assets/images/thumbnail_cantos.jpg',
      author: 'Comunidad Kichwa de Otavalo',
      date: DateTime.now().subtract(const Duration(days: 10)),
      tags: ['música', 'tradicional', 'Kichwa', 'naturaleza'],
      language: 'qu',
      duration: 3600, // 1 hora
      fileSize: '45 MB',
      isDownloadable: true,
    ),
    
    Resource(
      id: '3',
      title: 'Guía de Plantas Medicinales Andinas',
      description: 'Manual completo con descripciones, usos y preparaciones de plantas medicinales de la región andina.',
      type: ResourceType.document,
      url: 'https://example.com/documento_plantas_medicinales.pdf',
      thumbnailUrl: 'assets/images/thumbnail_plantas_medicinales.jpg',
      author: 'Instituto de Medicina Tradicional',
      date: DateTime.now().subtract(const Duration(days: 15)),
      tags: ['medicina', 'plantas', 'tradicional', 'Andes'],
      language: 'es',
      duration: 0,
      fileSize: '8 MB',
      isDownloadable: true,
    ),
    
    Resource(
      id: '4',
      title: 'Fotografías de Ecosistemas Andinos',
      description: 'Colección de imágenes que documentan la biodiversidad y belleza de los ecosistemas andinos.',
      type: ResourceType.image,
      url: 'https://example.com/galeria_ecosistemas_andinos.zip',
      thumbnailUrl: 'assets/images/thumbnail_ecosistemas.jpg',
      author: 'Fotógrafos Conservacionistas',
      date: DateTime.now().subtract(const Duration(days: 20)),
      tags: ['fotografía', 'biodiversidad', 'Andes', 'conservación'],
      language: 'es',
      duration: 0,
      fileSize: '250 MB',
      isDownloadable: false,
    ),
  ];

  /// Hilos del foro de ejemplo
  static List<ForumThread> get forumThreads => [
    ForumThread(
      id: '1',
      title: '¿Cómo implementar agricultura sostenible en la sierra?',
      content: 'Estoy interesado en implementar técnicas de agricultura sostenible en mi comunidad de la sierra ecuatoriana. ¿Alguien tiene experiencia con la rotación de cultivos o el uso de abonos orgánicos? Me gustaría conocer tanto técnicas ancestrales como modernas que sean efectivas en nuestro clima.',
      authorId: 'user1',
      authorName: 'Carlos Mendez',
      authorAvatar: 'assets/images/avatar_carlos.jpg',
      createdAt: DateTime.now().subtract(const Duration(hours: 3)),
      lastUpdated: DateTime.now().subtract(const Duration(hours: 1)),
      tags: ['agricultura', 'sostenible', 'sierra', 'técnicas'],
      replyCount: 8,
      likeCount: 15,
      viewCount: 127,
      isPinned: false,
      isLocked: false,
      category: 'Agricultura',
      replies: [
        ForumReply(
          id: 'reply1',
          threadId: '1',
          content: 'Te recomiendo empezar con la técnica de la chakra andina. En mi comunidad la hemos usado por generaciones y es muy efectiva para conservar el suelo.',
          authorId: 'user2',
          authorName: 'María Quishpe',
          authorAvatar: 'assets/images/avatar_maria.jpg',
          createdAt: DateTime.now().subtract(const Duration(hours: 2)),
          lastUpdated: DateTime.now().subtract(const Duration(hours: 2)),
          likeCount: 7,
          likedBy: ['user1', 'user3', 'user4'],
          parentReplyId: null,
          nestedReplies: [],
        ),
        ForumReply(
          id: 'reply2',
          threadId: '1',
          content: 'También puedes combinar con técnicas modernas como el compostaje y la rotación de cultivos. Lo importante es adaptar a tu terreno específico.',
          authorId: 'user3',
          authorName: 'Ing. Pedro López',
          authorAvatar: 'assets/images/avatar_pedro.jpg',
          createdAt: DateTime.now().subtract(const Duration(hours: 1)),
          lastUpdated: DateTime.now().subtract(const Duration(hours: 1)),
          likeCount: 5,
          likedBy: ['user1', 'user2'],
          parentReplyId: null,
          nestedReplies: [],
        ),
      ],
    ),
    
    ForumThread(
      id: '2',
      title: 'Alertas de incendios forestales - Coordinación comunitaria',
      content: 'Con la temporada seca acercándose, necesitamos organizar un sistema de alertas tempranas para incendios forestales en nuestra región. ¿Alguien tiene experiencia con sistemas de monitoreo comunitario o tecnologías de detección temprana?',
      authorId: 'user4',
      authorName: 'Guardaparque Ana',
      authorAvatar: 'assets/images/avatar_ana.jpg',
      createdAt: DateTime.now().subtract(const Duration(days: 1)),
      lastUpdated: DateTime.now().subtract(const Duration(hours: 6)),
      tags: ['incendios', 'monitoreo', 'comunidad', 'prevención'],
      replyCount: 12,
      likeCount: 23,
      viewCount: 89,
      isPinned: true,
      isLocked: false,
      category: 'Monitoreo Ambiental',
      replies: [],
    ),
    
    ForumThread(
      id: '3',
      title: 'Recuperación de saberes ancestrales sobre plantas medicinales',
      content: 'En mi comunidad estamos trabajando en recuperar el conocimiento ancestral sobre plantas medicinales que se está perdiendo. ¿Alguien conoce iniciativas similares o tiene recursos para compartir sobre este tema?',
      authorId: 'user5',
      authorName: 'Yachak Manuel',
      authorAvatar: 'assets/images/avatar_manuel.jpg',
      createdAt: DateTime.now().subtract(const Duration(days: 2)),
      lastUpdated: DateTime.now().subtract(const Duration(days: 1)),
      tags: ['medicina', 'tradicional', 'plantas', 'recuperación'],
      replyCount: 6,
      likeCount: 18,
      viewCount: 156,
      isPinned: false,
      isLocked: false,
      category: 'Medicina Tradicional',
      replies: [],
    ),
  ];
} 