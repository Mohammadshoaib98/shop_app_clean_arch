import 'package:shop_app_clean_arch/features/product/domain/entities/product_entitiy.dart';

class ProductModel extends ProductEntity {
  const ProductModel({
    final String? name,
    final String? description,
    final String? image,
    final int? price,
    final int? oldPrice,
    final int? id,
    final int? discount,
  }) : super(
            name: name,
            id: id,
            description: description,
            discount: discount,
            oldPrice: oldPrice,
            image: image,
            price: price);


            
  factory ProductModel.fromJson(Map<String, dynamic> data) {
    List<ProductModel> product = [];
    if (data['name'] != null) {}
    return ProductModel(
      id: data['id'].toInt(),
      description: data['description'].toString(),
      name: data['name'].toString(),
      image: data['image'].toString(),
      price: data['price'].toInt(),
      oldPrice: data['old_price'].toInt(),
      discount: data['discount'].toInt(),
    );
  }
}
