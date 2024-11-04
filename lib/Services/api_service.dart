import 'package:http/http.dart' as http;
import 'package:rto/Exports/myExports.dart';

class ApiService {
  final String baseUrl = dotenv.env['BASE_URL'] ?? '';

  Future<List<CategoryList>> fetchCategories() async {
    try {
      final response = await http.get(Uri.parse('$baseUrl/category_list'));

      if (response.statusCode == 200) {
        List<dynamic> jsonData = json.decode(response.body);
        Uihelper.logger.d("Category List API Response $response");
        return CategoryList.ofCategoryList(jsonData) ?? [];
        
      } else {
        Uihelper.logger.e("Failed to Load Category API, Please Try Again Later");
        throw Exception('Failed to load categories');
      }
    } catch (e) {
      Uihelper.logger.e("${e.toString()}");
      throw Exception('Failed to load categories');
    }
  }

}
