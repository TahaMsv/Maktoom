import 'package:dartz/dartz.dart';
import 'package:negarestan/screens/login/usecases/logout_usecase.dart';
import 'package:negarestan/screens/login/usecases/sign_up_usecase.dart';
import '../../core/classes/user.dart';
import '../../core/error/exception.dart';
import '../../core/error/failures.dart';
import '../../core/platform/network_info.dart';
import '../../screens/login/interfaces/login_repository_interface.dart';
import 'data_sources/login_local_ds.dart';
import 'data_sources/login_remote_ds.dart';
import 'usecases/login_usecase.dart';

class LoginRepository implements LoginRepositoryInterface {
  final LoginRemoteDataSource loginRemoteDataSource;
  final LoginLocalDataSource loginLocalDataSource;
  final NetworkInfo? networkInfo;
  LoginRepository({required this.loginRemoteDataSource, required this.loginLocalDataSource,
     this.networkInfo
  });

  @override
  Future<Either<Failure, String>> login(LoginRequest loginRequest) async {
    if (await networkInfo!.isConnected) {
      try {
        String token = await loginRemoteDataSource.login(loginRequest);
        return Right(token);
      } on AppException catch (e) {
        return Left(ServerFailure.fromAppException(e));
      }
    } else {
      return Left(
        ConnectionFailure.fromAppException(
          ConnectionException(
            message: "You are not connected to internet!",
            trace: StackTrace.fromString("Login repository: login"),
          ),
        ),
      );
      // }
    }
  }
  @override
  Future<Either<Failure, User>> signUp(SignUpRequest signUpRequest) async {
    if (await networkInfo!.isConnected) {
      try {
        User user = await loginRemoteDataSource.signUp(signUpRequest);
        return Right(user);
      } on AppException catch (e) {
        return Left(ServerFailure.fromAppException(e));
      }
    } else {
      return Left(
        ConnectionFailure.fromAppException(
          ConnectionException(
            message: "You are not connected to internet!",
            trace: StackTrace.fromString("Login repository: login"),
          ),
        ),
      );
      // }
    }
  }


  @override
  Future<Either<Failure, bool>> logOut(LogOutRequest loginRequest) async {
    if (await networkInfo!.isConnected) {
      try {
        bool success = await loginRemoteDataSource.logOut(loginRequest);
        return Right(success);
      } on AppException catch (e) {
        return Left(ServerFailure.fromAppException(e));
      }
    } else {
      return Left(
        ConnectionFailure.fromAppException(
          ConnectionException(
            message: "You are not connected to internet!",
            trace: StackTrace.fromString("Login repository: login"),
          ),
        ),
      );
      // }
    }
  }


}
