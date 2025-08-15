import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../utils/translations.dart';
import '../theme/app_theme.dart';

/// Pantalla del mapa ambiental intercultural
class MapScreen extends StatelessWidget {
  const MapScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final currentLanguage = languageProvider.currentLanguageCode;
    
    return Scaffold(
      appBar: AppBar(
        title: Text(Translations.get('map_title', currentLanguage)),
        actions: [
          IconButton(
            icon: const Icon(Icons.search),
            onPressed: () {
              // TODO: Implementar búsqueda en el mapa
            },
          ),
          IconButton(
            icon: const Icon(Icons.filter_list),
            onPressed: () {
              // TODO: Implementar filtros del mapa
            },
          ),
        ],
      ),
      body: Column(
        children: [
          // Información del territorio
          Container(
            width: double.infinity,
            padding: const EdgeInsets.all(16),
            color: AppTheme.lightBeige,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  Translations.get('map_subtitle', currentLanguage),
                  style: Theme.of(context).textTheme.titleMedium?.copyWith(
                    color: AppTheme.darkBrown,
                  ),
                ),
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.location_on,
                      color: AppTheme.primaryGreen,
                      size: 16,
                    ),
                    const SizedBox(width: 8),
                    Text(
                      'Territorio: Sierra Ecuatoriana',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: AppTheme.darkBrown,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          
          // Mapa placeholder
          Expanded(
            child: Container(
              margin: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: Colors.grey[200],
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: Colors.grey[300]!),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.map,
                    size: 80,
                    color: Colors.grey[400],
                  ),
                  const SizedBox(height: 16),
                  Text(
                    Translations.get('map_placeholder', currentLanguage),
                    style: Theme.of(context).textTheme.titleMedium?.copyWith(
                      color: Colors.grey[600],
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    'Mapa ambiental intercultural\nen desarrollo',
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: Colors.grey[500],
                    ),
                    textAlign: TextAlign.center,
                  ),
                  const SizedBox(height: 24),
                  ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implementar funcionalidad del mapa
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Funcionalidad del mapa en desarrollo'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.explore),
                    label: const Text('Explorar Territorio'),
                  ),
                ],
              ),
            ),
          ),
          
          // Información adicional
          Container(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                // Estadísticas del territorio
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    _buildStatItem(
                      context,
                      Icons.eco,
                      'Biodiversidad',
                      'Alta',
                      AppTheme.primaryGreen,
                    ),
                    _buildStatItem(
                      context,
                      Icons.water_drop,
                      'Recursos Hídricos',
                      'Abundantes',
                      AppTheme.secondaryGreen,
                    ),
                    _buildStatItem(
                      context,
                      Icons.forest,
                      'Cobertura Forestal',
                      '75%',
                      AppTheme.accentBrown,
                    ),
                  ],
                ),
                
                const SizedBox(height: 16),
                
                // Botón para reportar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    onPressed: () {
                      // TODO: Implementar reporte de territorio
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(
                          content: Text('Sistema de reportes en desarrollo'),
                        ),
                      );
                    },
                    icon: const Icon(Icons.add_location),
                    label: const Text('Reportar Ubicación'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppTheme.secondaryGreen,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  /// Construir elemento de estadística
  Widget _buildStatItem(
    BuildContext context,
    IconData icon,
    String label,
    String value,
    Color color,
  ) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.all(12),
          decoration: BoxDecoration(
            color: color.withOpacity(0.1),
            shape: BoxShape.circle,
          ),
          child: Icon(
            icon,
            color: color,
            size: 24,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          label,
          style: Theme.of(context).textTheme.bodySmall?.copyWith(
            color: Colors.grey[600],
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 4),
        Text(
          value,
          style: Theme.of(context).textTheme.titleMedium?.copyWith(
            color: color,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
} 