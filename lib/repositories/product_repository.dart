import 'package:mobile_shop/repositories/product_response.dart';

abstract class ProductRepository {
  Future<ProductResponse> getBestSoldProducts({required int page,required int pageSize, String searchedText = ''});
}
