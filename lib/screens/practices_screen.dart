import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../utils/translations.dart';
import '../theme/app_theme.dart';
import '../data/sample_data.dart';
import '../models/practice.dart';

/// Pantalla comparadora de prácticas ancestrales y modernas
class PracticesScreen extends StatefulWidget {
  const PracticesScreen({super.key});

  @override
  State<PracticesScreen> createState() => _PracticesScreenState();
}

class _PracticesScreenState extends State<PracticesScreen>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  String _selectedCategory = 'Todas';

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 2, vsync: this);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final currentLanguage = languageProvider.currentLanguageCode;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('practices_title', currentLanguage)),
        bottom: TabBar(
          controller: _tabController,
          tabs: [
            Tab(
              text: Translations.get('ancestral_practices', currentLanguage),
            ),
            Tab(
              text: Translations.get('modern_practices', currentLanguage),
            ),
          ],
        ),
        actions: [
          PopupMenuButton<String>(
            onSelected: (String category) {
              setState(() {
                _selectedCategory = category;
              });
            },
            itemBuilder: (BuildContext context) => [
              const PopupMenuItem(
                value: 'Todas',
                child: Text('Todas las categorías'),
              ),
              const PopupMenuItem(
                value: 'Agricultura',
                child: Text('Agricultura'),
              ),
              const PopupMenuItem(
                value: 'Gestión del Agua',
                child: Text('Gestión del Agua'),
              ),
              const PopupMenuItem(
                value: 'Medicina Tradicional',
                child: Text('Medicina Tradicional'),
              ),
              const PopupMenuItem(
                value: 'Monitoreo Ambiental',
                child: Text('Monitoreo Ambiental'),
              ),
            ],
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(_selectedCategory),
                  const Icon(Icons.arrow_drop_down),
                ],
              ),
            ),
          ),
        ],
      ),
      body: TabBarView(
        controller: _tabController,
        children: [
          _buildPracticesList(true), // Prácticas ancestrales
          _buildPracticesList(false), // Prácticas modernas
        ],
      ),
    );
  }

  /// Construir lista de prácticas según el tipo
  Widget _buildPracticesList(bool isAncestral) {
    final practices = SampleData.practices
        .where((practice) => practice.isAncestral == isAncestral)
        .where((practice) => 
            _selectedCategory == 'Todas' || practice.category == _selectedCategory)
        .toList();

    if (practices.isEmpty) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              isAncestral ? Icons.history : Icons.science,
              size: 80,
              color: Colors.grey[400],
            ),
            const SizedBox(height: 16),
            Text(
              'No hay prácticas ${isAncestral ? 'ancestrales' : 'modernas'} en esta categoría',
              style: Theme.of(context).textTheme.titleMedium?.copyWith(
                color: Colors.grey[600],
              ),
              textAlign: TextAlign.center,
            ),
          ],
        ),
      );
    }

    return ListView.builder(
      padding: const EdgeInsets.all(16),
      itemCount: practices.length,
      itemBuilder: (context, index) {
        return _buildPracticeCard(practices[index]);
      },
    );
  }

  /// Construir tarjeta de práctica
  Widget _buildPracticeCard(Practice practice) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: InkWell(
        onTap: () {
          _showPracticeDetails(practice);
        },
        borderRadius: BorderRadius.circular(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            // Imagen de la práctica
            Container(
              height: 200,
              width: double.infinity,
              decoration: BoxDecoration(
                color: practice.isAncestral 
                    ? AppTheme.accentBrown.withOpacity(0.2)
                    : AppTheme.secondaryGreen.withOpacity(0.2),
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
              ),
              child: Icon(
                practice.isAncestral ? Icons.history : Icons.science,
                size: 80,
                color: practice.isAncestral 
                    ? AppTheme.accentBrown 
                    : AppTheme.secondaryGreen,
              ),
            ),
            
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Título y categoría
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          practice.title,
                          style: Theme.of(context).textTheme.titleLarge?.copyWith(
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Container(
                        padding: const EdgeInsets.symmetric(
                          horizontal: 8,
                          vertical: 4,
                        ),
                        decoration: BoxDecoration(
                          color: practice.isAncestral 
                              ? AppTheme.accentBrown 
                              : AppTheme.secondaryGreen,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Text(
                          practice.category,
                          style: const TextStyle(
                            color: Colors.white,
                            fontSize: 12,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  // Descripción
                  Text(
                    practice.description,
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                    maxLines: 3,
                    overflow: TextOverflow.ellipsis,
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Información adicional
                  Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          practice.location,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 8),
                  
                  Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 16,
                        color: Colors.grey[600],
                      ),
                      const SizedBox(width: 4),
                      Expanded(
                        child: Text(
                          practice.community,
                          style: Theme.of(context).textTheme.bodySmall?.copyWith(
                            color: Colors.grey[600],
                          ),
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    ],
                  ),
                  
                  const SizedBox(height: 16),
                  
                  // Botón para ver más
                  SizedBox(
                    width: double.infinity,
                    child: OutlinedButton(
                      onPressed: () {
                        _showPracticeDetails(practice);
                      },
                      child: const Text('Ver Detalles'),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  /// Mostrar detalles de la práctica
  void _showPracticeDetails(Practice practice) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => DraggableScrollableSheet(
        initialChildSize: 0.9,
        minChildSize: 0.5,
        maxChildSize: 0.95,
        builder: (context, scrollController) => Container(
          decoration: const BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
          ),
          child: Column(
            children: [
              // Barra de arrastre
              Container(
                margin: const EdgeInsets.only(top: 8),
                width: 40,
                height: 4,
                decoration: BoxDecoration(
                  color: Colors.grey[300],
                  borderRadius: BorderRadius.circular(2),
                ),
              ),
              
              Expanded(
                child: ListView(
                  controller: scrollController,
                  padding: const EdgeInsets.all(16),
                  children: [
                    // Título y categoría
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            practice.title,
                            style: Theme.of(context).textTheme.headlineMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        Container(
                          padding: const EdgeInsets.symmetric(
                            horizontal: 12,
                            vertical: 6,
                          ),
                          decoration: BoxDecoration(
                            color: practice.isAncestral 
                                ? AppTheme.accentBrown 
                                : AppTheme.secondaryGreen,
                            borderRadius: BorderRadius.circular(16),
                          ),
                          child: Text(
                            practice.category,
                            style: const TextStyle(
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ),
                      ],
                    ),
                    
                    const SizedBox(height: 16),
                    
                    // Descripción completa
                    Text(
                      practice.description,
                      style: Theme.of(context).textTheme.bodyLarge,
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Beneficios
                    Text(
                      'Beneficios:',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.primaryGreen,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...practice.benefits.map((benefit) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.check_circle,
                            color: AppTheme.primaryGreen,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Text(benefit)),
                        ],
                      ),
                    )),
                    
                    const SizedBox(height: 24),
                    
                    // Desafíos
                    Text(
                      'Desafíos:',
                      style: Theme.of(context).textTheme.titleLarge?.copyWith(
                        fontWeight: FontWeight.bold,
                        color: AppTheme.alertOrange,
                      ),
                    ),
                    const SizedBox(height: 8),
                    ...practice.challenges.map((challenge) => Padding(
                      padding: const EdgeInsets.only(bottom: 4),
                      child: Row(
                        children: [
                          Icon(
                            Icons.warning,
                            color: AppTheme.alertOrange,
                            size: 20,
                          ),
                          const SizedBox(width: 8),
                          Expanded(child: Text(challenge)),
                        ],
                      ),
                    )),
                    
                    const SizedBox(height: 24),
                    
                    // Información de ubicación y comunidad
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: AppTheme.lightBeige,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Información del Territorio',
                            style: Theme.of(context).textTheme.titleMedium?.copyWith(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Row(
                            children: [
                              Icon(
                                Icons.location_on,
                                color: AppTheme.primaryGreen,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  practice.location,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 8),
                          Row(
                            children: [
                              Icon(
                                Icons.people,
                                color: AppTheme.primaryGreen,
                              ),
                              const SizedBox(width: 8),
                              Expanded(
                                child: Text(
                                  practice.community,
                                  style: Theme.of(context).textTheme.bodyMedium,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    
                    const SizedBox(height: 24),
                    
                    // Botón de acción
                    SizedBox(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () {
                          // TODO: Implementar acción específica
                          Navigator.pop(context);
                          ScaffoldMessenger.of(context).showSnackBar(
                            const SnackBar(
                              content: Text('Funcionalidad en desarrollo'),
                            ),
                          );
                        },
                        icon: const Icon(Icons.share),
                        label: const Text('Compartir Práctica'),
                        style: ElevatedButton.styleFrom(
                          padding: const EdgeInsets.symmetric(vertical: 16),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
} 