import 'package:shop_app_clean_arch/features/cart/domain/entities/user_entity.dart';

class UserModel extends UserEntity {
  const UserModel({
    final String? name,
    final String? email,
    final String? phone,
    final String? image,
    final String? token,
  }) : super(
            name: name, image: image, phone: phone, token: token, email: email);

  factory UserModel.fromJson(Map<String, dynamic> data) {

    return UserModel(
        name: data['name'],
        email: data['data'],
        phone: data['phone'],
        image: data["image"],
        token: data['token']);
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'token': token,
      'image': image,
    };
  }
}
