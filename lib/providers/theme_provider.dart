import 'package:flutter/material.dart';

/// Provider para manejar el cambio de tema entre claro y oscuro
class ThemeProvider extends ChangeNotifier {
  bool _isDarkMode = false;
  
  /// Verificar si el tema actual es oscuro
  bool get isDarkMode => _isDarkMode;
  
  /// Cambiar entre tema claro y oscuro
  void toggleTheme() {
    _isDarkMode = !_isDarkMode;
    notifyListeners();
  }
  
  /// Establecer tema específico
  void setTheme(bool isDark) {
    _isDarkMode = isDark;
    notifyListeners();
  }
} 