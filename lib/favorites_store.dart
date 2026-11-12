import 'package:flutter/foundation.dart';
import 'package:shared_preferences/shared_preferences.dart';

/// Stockage des favoris (persistant). Appeler `await FavoritesStore.instance.load();`
/// dans main() avant runApp().
class FavoritesStore extends ChangeNotifier {
  FavoritesStore._();
  static final FavoritesStore instance = FavoritesStore._();

  static const String _key = 'favoris_destinations';
  final Set<String> _ids = {};

  Set<String> get ids => Set.unmodifiable(_ids);
  int get count => _ids.length;
  bool isFavorite(String id) => _ids.contains(id);

  Future<void> load() async {
    try {
      final prefs = await SharedPreferences.getInstance();
      _ids
        ..clear()
        ..addAll(prefs.getStringList(_key) ?? const []);
      notifyListeners();
    } catch (_) {}
  }

  Future<void> toggle(String id) async {
    if (!_ids.remove(id)) _ids.add(id);
    notifyListeners();
    try {
      final prefs = await SharedPreferences.getInstance();
      await prefs.setStringList(_key, _ids.toList());
    } catch (_) {}
  }
}