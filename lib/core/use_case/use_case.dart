import 'package:dartz/dartz.dart';
import 'package:shop_app_clean_arch/core/error/failure.dart';

abstract class UseCase<Type, Param> {
  Future<Either<Failure, Type>> call([Param param]);
}
