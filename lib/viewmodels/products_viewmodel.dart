import 'package:stacked/stacked.dart';
import '../models/model.dart';
import '../services/products_service.dart';

class ProductsViewModel extends BaseViewModel {
  final ProductService _productsService;

  ProductsViewModel({required ProductService productsService})
      : _productsService = productsService;

  List<Product> _products = [];
  List<Product> get products => _products;

  Future<void> fetchProducts() async {
    setBusy(true);
    try {
      final products = await _productsService.getProducts();
      _products = products.products;
      notifyListeners();
    } catch (e) {
      print(e);
    }
    setBusy(false);
  }
}
