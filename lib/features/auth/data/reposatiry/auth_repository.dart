import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/features/auth/data/models/login_model.dart';
import 'package:eventak/features/auth/data/models/register_model.dart';

import '../../../../core/services/service_locator.dart';

class AuthRepository {
  Future<Either<String, LoginModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.userSignIn, data: {
        Apikeys.email: email,
        Apikeys.password: password,
      });
      return Right(LoginModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
//!sign up
  Future<Either<String, RegisterModel>> signUp({
    required String email,
    required String userName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(EndPoint.userSignUp, data: {
        Apikeys.email: email,
        Apikeys.password: password,
        Apikeys.confirmPassword: confirmPassword,
        Apikeys.userName: userName,
      },);
      return Right(RegisterModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  //!Forget Password (send code to email method)

Future<Either<String, RegisterModel>> sendCode({
    required String email,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(EndPoint.userSignUp, data: {
        Apikeys.email: email,
      },);
      return Right(RegisterModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
