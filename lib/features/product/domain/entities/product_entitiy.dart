import 'package:equatable/equatable.dart';

class ProductEntity extends Equatable {
  final String? name;
  final String? description;
  final String? image;
  final int? price;
  final int? oldPrice;
  final int? id;
  final int? discount;

  const ProductEntity(
      {this.name,
      this.description,
      this.image,
      this.price,
      this.oldPrice,
      this.id,
      this.discount});

  @override
  List<Object?> get props =>
      [name, description, image, price, oldPrice, id, discount];
}
