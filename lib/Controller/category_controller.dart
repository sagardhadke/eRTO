import 'package:rto/Exports/myExports.dart';
import 'package:rto/Model/categoryList.dart';
import 'package:rto/Services/api_service.dart';

class CategoryController with ChangeNotifier {
  final ApiService apiService;
  List<CategoryList> categories = [];
  bool isLoading = true;
  bool isConnected = false;

  CategoryController(this.apiService);

  Future<void> loadCategories() async {
    isLoading = true;
    notifyListeners();
    try {
      categories = await apiService.fetchCategories();
    } catch (error) {
      print(error);
    } finally {
      isLoading = false;
      notifyListeners();
    }
  }

  void updateConnectionStatus(bool status) {
    isConnected = status;
    notifyListeners();
  }
}