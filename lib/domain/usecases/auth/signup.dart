import 'package:dartz/dartz.dart';
import 'package:spotify_clone/core/useCase/usecase.dart';
import 'package:spotify_clone/data/models/auth/create_user_req.dart';
import 'package:spotify_clone/domain/repository/auth/auth.dart';

import '../../../service_locator.dart';

class SignupUseCase implements UseCase<Either, CreateUserReq> {
  @override
  Future<Either> call({CreateUserReq? params}) async {
    return await sl<AuthRepository>().signup(params!);
  }
}
