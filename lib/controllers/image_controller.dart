import 'package:get/get.dart';
import '../services/pixabay_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ImageController extends GetxController {
  final _service = PixabayService();

  var images = <String>[].obs;
  var isLoading = false.obs;
  var searchHistory = <String>[].obs;

  final String _prefsKey = 'search_history';

  @override
  void onInit() {
    super.onInit();
    _loadHistory();
  }

  Future<void> _addToHistory(String query) async {
    if (query.isEmpty) return;

    searchHistory.remove(query.trim());
    searchHistory.insert(0, query.trim());

    final prefs = await SharedPreferences.getInstance();
    await prefs.setStringList(_prefsKey, searchHistory);
  }

  void fetchImages(String query) async {
    await _addToHistory(query);
    isLoading.value = true;
    try {
      final result = await _service.fetchImages(query);
      images.assignAll(result);
    } catch (_) {
      Get.snackbar("Error", "Failed to load images");
    } finally {
      isLoading.value = false;
    }
  }

  void fetchHistoryImages(String query) async {
    isLoading.value = true;
    try {
      final result = await _service.fetchImages(query);
      images.assignAll(result);
    } catch (_) {
      Get.snackbar("Error", "Failed to load images");
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> _loadHistory() async {
    final prefs = await SharedPreferences.getInstance();
    final stored = prefs.getStringList(_prefsKey) ?? [];
    searchHistory.assignAll(stored);
  }

  Future<void> clearHistory() async {
    searchHistory.clear();
    final prefs = await SharedPreferences.getInstance();
    await prefs.remove(_prefsKey);
  }
}
