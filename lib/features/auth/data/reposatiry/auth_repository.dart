import 'package:dartz/dartz.dart';
import 'package:eventak/core/database/api/api/api_consumer.dart';
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/error/exception.dart';
import 'package:eventak/features/auth/data/models/login_model.dart';
import 'package:eventak/features/auth/data/models/pass_verefication_mode.dart';
import 'package:eventak/features/auth/data/models/receved_code.dart';
import 'package:eventak/features/auth/data/models/register_model.dart';
import 'package:eventak/features/auth/data/models/send_code_model.dart';

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
    required String firstName,
    required String lastName,
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.userSignUp,
        data: {
          Apikeys.email: email,
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
          Apikeys.firstName: firstName,
          Apikeys.lastName: lastName,
        },
      );
      return Right(RegisterModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  //!Forget Password (send code to email method)

  Future<Either<String, SendCodeModel>> sendCode({
    required String email,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.userSendCode,
        data: {
          Apikeys.email: email,
        },
      );
      return Right(SendCodeModel.fromJson(response));
      
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
  //!send code (send code)
  Future<Either<String, RecevedCodeModel>> recevedCode({
    required String forgetCode,
  }) async {
    try {
      final response = await sl<ApiConsumer>().post(
        EndPoint.recevedCodeEndPoints(sl<CacheHelper>().getData(key: Apikeys.id)),
        data: {
          Apikeys.forgetCode: forgetCode,
        },
      );
      return Right(RecevedCodeModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }

  //!Reset Password verefy code
  Future<Either<String, PassVerificationModel>> resetPasswordCode({
    required String password,
    required String confirmPassword,
  }) async {
    try {
      final response = await sl<ApiConsumer>().patch(
        EndPoint.userResetPasswordEndPoints(sl<CacheHelper>().getData(key: Apikeys.id)),
        data: {
          Apikeys.password: password,
          Apikeys.confirmPassword: confirmPassword,
        },
      );
      return Right(PassVerificationModel.fromJson(response));
    } on ServerException catch (error) {
      return Left(error.errorModel.errorMessage);
    }
  }
}
