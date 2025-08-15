import 'package:flutter/material.dart';

/// Provider para manejar el cambio de idioma entre Español y Kichwa
class LanguageProvider extends ChangeNotifier {
  Locale _currentLocale = const Locale('es', 'ES');
  
  /// Idioma actual de la aplicación
  Locale get currentLocale => _currentLocale;
  
  /// Cambiar el idioma de la aplicación
  void changeLanguage(String languageCode) {
    if (languageCode == 'es') {
      _currentLocale = const Locale('es', 'ES');
    } else if (languageCode == 'qu') {
      _currentLocale = const Locale('qu', 'EC');
    }
    notifyListeners();
  }
  
  /// Obtener el idioma actual como string
  String get currentLanguageCode => _currentLocale.languageCode;
  
  /// Verificar si el idioma actual es español
  bool get isSpanish => _currentLocale.languageCode == 'es';
  
  /// Verificar si el idioma actual es kichwa
  bool get isKichwa => _currentLocale.languageCode == 'qu';
} 