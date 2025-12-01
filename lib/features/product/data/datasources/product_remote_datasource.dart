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
    // Map of product data based on productId
    final productData = {
      'product_1': {
        'name': 'Cheeseburger',
        'description': "Wendy's Burger",
        'image': 'assets/images/products/11.png',
        'thumbnail': 'assets/images/products/1.png',
        'price': 8.99,
        'rating': 4.9,
      },
      'product_2': {
        'name': 'Hamburger',
        'description': 'Veggie Burger',
        'image': 'assets/images/products/22.png',
        'thumbnail': 'assets/images/products/2.png',
        'price': 7.99,
        'rating': 4.8,
      },
      'product_3': {
        'name': 'Hamburger',
        'description': 'Chicken Burger',
        'image': 'assets/images/products/33.png',
        'thumbnail': 'assets/images/products/3.png',
        'price': 9.49,
        'rating': 4.6,
      },
      'product_4': {
        'name': 'Hamburger',
        'description': 'Fried Chicken Burger',
        'image': 'assets/images/products/44.png',
        'thumbnail': 'assets/images/products/4.png',
        'price': 10.99,
        'rating': 4.5,
      },
    };

    final data = productData[productId] ?? productData['product_1']!;

    return ProductModel(
      id: productId,
      name: data['name'] as String,
      description: data['description'] as String,
      basePrice: data['price'] as double,
      imageUrl: data['image'] as String,
      thumbnailUrl: data['thumbnail'] as String,
      category: 'Burgers',
      availableToppings: [
        const ToppingModel(
          id: '1',
          name: 'Tomatos',
          imageUrl: 'assets/images/toppings and side options/tomato.png',
          price: 0.5,
        ),
        const ToppingModel(
          id: '2',
          name: 'Lemons',
          imageUrl: 'assets/images/toppings and side options/lemon.png',
          price: 0.3,
        ),
        const ToppingModel(
          id: '3',
          name: 'Onions',
          imageUrl: 'assets/images/toppings and side options/onions.png',
          price: 0.4,
        ),
        const ToppingModel(
          id: '4',
          name: 'Cheese',
          imageUrl: 'assets/images/toppings and side options/cheese.png',
          price: 0.3,
        ),
      ],
      availableSideOptions: [
        const SideOptionModel(
          id: '1',
          name: 'Fries',
          imageUrl: 'assets/images/toppings and side options/fries.png',
          price: 2.5,
        ),
        const SideOptionModel(
          id: '2',
          name: 'Cucumber',
          imageUrl: 'assets/images/toppings and side options/cucumber.png',
          price: 3.0,
        ),
        const SideOptionModel(
          id: '3',
          name: 'Coleslaw',
          imageUrl: 'assets/images/toppings and side options/coleslaw.png',
          price: 2.0,
        ),
        const SideOptionModel(
          id: '4',
          name: 'Salad',
          imageUrl: 'assets/images/toppings and side options/salad.png',
          price: 1.5,
        ),
      ],
      spicyLevel: 0.3,
      rating: data['rating'] as double,
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
