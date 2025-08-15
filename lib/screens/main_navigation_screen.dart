import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/language_provider.dart';
import '../providers/theme_provider.dart';
import '../utils/translations.dart';
import '../theme/app_theme.dart';
import 'map_screen.dart';
import 'practices_screen.dart';
import 'alerts_screen.dart';
import 'repository_screen.dart';
import 'forum_screen.dart';
import 'settings_screen.dart';

/// Pantalla principal con navegación inferior
class MainNavigationScreen extends StatefulWidget {
  const MainNavigationScreen({super.key});

  @override
  State<MainNavigationScreen> createState() => _MainNavigationScreenState();
}

class _MainNavigationScreenState extends State<MainNavigationScreen> {
  int _currentIndex = 0;
  
  // Lista de pantallas principales
  final List<Widget> _screens = [
    const MapScreen(),
    const PracticesScreen(),
    const AlertsScreen(),
    const RepositoryScreen(),
    const ForumScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    final languageProvider = Provider.of<LanguageProvider>(context);
    final themeProvider = Provider.of<ThemeProvider>(context);
    final currentLanguage = languageProvider.currentLanguageCode;
    
    return Scaffold(
      body: _screens[_currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        type: BottomNavigationBarType.fixed,
        selectedItemColor: AppTheme.primaryGreen,
        unselectedItemColor: Colors.grey,
        backgroundColor: Theme.of(context).bottomNavigationBarTheme.backgroundColor,
        elevation: 8,
        items: [
          BottomNavigationBarItem(
            icon: const Icon(Icons.map),
            label: Translations.get('nav_map', currentLanguage),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.compare_arrows),
            label: Translations.get('nav_practices', currentLanguage),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.warning),
            label: Translations.get('nav_alerts', currentLanguage),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.library_books),
            label: Translations.get('nav_repository', currentLanguage),
          ),
          BottomNavigationBarItem(
            icon: const Icon(Icons.forum),
            label: Translations.get('nav_forum', currentLanguage),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // Navegar a configuración
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => const SettingsScreen(),
            ),
          );
        },
        backgroundColor: AppTheme.accentBrown,
        child: const Icon(
          Icons.settings,
          color: Colors.white,
        ),
      ),
    );
  }
} 