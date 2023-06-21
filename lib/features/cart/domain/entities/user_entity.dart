import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? name;
  final String? email;
  final String? phone;
  final String? image;
  final String? token;

  const UserEntity({this.name, this.email, this.phone, this.image, this.token});
  @override
  List<Object?> get props => [name, email, phone, image, token];
}
