import 'package:injectable/injectable.dart';

import '../../../../core/network/api_client.dart';
import '../models/product_model.dart';
import '../models/topping_model.dart';
import '../models/side_option_model.dart';

/// Remote data source for products
abstract class ProductRemoteDataSource {
  Future<ProductModel> getProductDetails(String productId);
  Future<List<ProductModel>> getProductsByCategory(String category, {int page = 1, int limit = 20});
  Future<List<ProductModel>> searchProducts(String query, {int page = 1, int limit = 20});
}

/// Implementation of product remote data source
@LazySingleton(as: ProductRemoteDataSource)
class ProductRemoteDataSourceImpl implements ProductRemoteDataSource {
  final ApiClient _apiClient;

  ProductRemoteDataSourceImpl(this._apiClient);

  @override
  Future<ProductModel> getProductDetails(String productId) async {
    // TODO: Replace with actual API call when backend is ready
    // For now, return mock data
    return _getMockProduct(productId);
  }

  @override
  Future<List<ProductModel>> getProductsByCategory(
    String category, {
    int page = 1,
    int limit = 20,
  }) async {
    // TODO: Replace with actual API call
    // final response = await _apiClient.get(
    //   '/products',
    //   queryParameters: {'category': category, 'page': page, 'limit': limit},
    // );
    // return (response.data['data'] as List)
    //     .map((json) => ProductModel.fromJson(json))
    //     .toList();
    
    return _getMockProducts();
  }

  @override
  Future<List<ProductModel>> searchProducts(
    String query, {
    int page = 1,
    int limit = 20,
  }) async {
    // TODO: Replace with actual API call
    return _getMockProducts()
        .where((p) => p.name.toLowerCase().contains(query.toLowerCase()))
        .toList();
  }

  // Mock data methods
  ProductModel _getMockProduct(String productId) {
    return ProductModel(
      id: productId,
      name: 'Hamburger',
      description: 'Veggie Burger',
      basePrice: 8.19,
      imageUrl: 'https://example.com/burger.png',
      category: 'Burgers',
      availableToppings: [
        const ToppingModel(
          id: '1',
          name: 'Tomato',
          imageUrl: 'https://example.com/tomato.png',
          price: 0.5,
        ),
        const ToppingModel(
          id: '2',
          name: 'Lettuce',
          imageUrl: 'https://example.com/lettuce.png',
          price: 0.3,
        ),
        const ToppingModel(
          id: '3',
          name: 'Onions',
          imageUrl: 'https://example.com/onions.png',
          price: 0.4,
        ),
        const ToppingModel(
          id: '4',
          name: 'Pickles',
          imageUrl: 'https://example.com/pickles.png',
          price: 0.3,
        ),
      ],
      availableSideOptions: [
        const SideOptionModel(
          id: '1',
          name: 'Fries',
          imageUrl: 'https://example.com/fries.png',
          price: 2.5,
        ),
        const SideOptionModel(
          id: '2',
          name: 'Onion Rings',
          imageUrl: 'https://example.com/onion-rings.png',
          price: 3.0,
        ),
        const SideOptionModel(
          id: '3',
          name: 'Salad',
          imageUrl: 'https://example.com/salad.png',
          price: 2.0,
        ),
        const SideOptionModel(
          id: '4',
          name: 'Cola',
          imageUrl: 'https://example.com/cola.png',
          price: 1.5,
        ),
      ],
      spicyLevel: 0.3,
      rating: 4.5,
      reviewCount: 120,
    );
  }

  List<ProductModel> _getMockProducts() {
    return [
      _getMockProduct('1'),
      _getMockProduct('2'),
      _getMockProduct('3'),
    ];
  }
}
