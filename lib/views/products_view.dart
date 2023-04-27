import 'package:flutter/material.dart';
import 'package:stacked/stacked.dart';
import '../services/products_service.dart';
import '../viewmodels/products_viewmodel.dart';

class ProductsView extends StatelessWidget {
  const ProductsView({super.key});

  @override
  Widget build(BuildContext context) {
    return ViewModelBuilder<ProductsViewModel>.reactive(
        viewModelBuilder: () => ProductsViewModel(
              productsService: ProductService(),
            ),
        onViewModelReady: (model) => model.fetchProducts(),
        builder: (context, model, child) => Scaffold(
              appBar: AppBar(
                title: const Text('Products'),
              ),
              body: model.isBusy
                  ? const Center(
                      child: CircularProgressIndicator(),
                    )
                  : SizedBox(
                height: double.infinity,
                    width: double.infinity,
                    child: ListView.builder(
                        itemCount: model.products.length,
                        itemBuilder: (context, index) {
                          final product = model.products[index];
                          return ListTile(
                            title: Text(product.title),
                            subtitle: Text(product.description),
                            trailing: Text('\$${product.price}'),
                          );
                        },
                      ),
                  ),
            ));
  }
}
