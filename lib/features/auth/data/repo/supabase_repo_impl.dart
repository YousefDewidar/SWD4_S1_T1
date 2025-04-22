import 'package:dartz/dartz.dart';
import 'package:habitect/core/errors/custom_exception.dart';
import 'package:habitect/core/supabase/database_services.dart';
import 'package:habitect/core/supabase/supabase_auth_services.dart';
import 'package:habitect/core/helpers/user_data.dart';
import 'package:habitect/features/auth/domain/entities/user_entity.dart';
import 'package:habitect/features/auth/domain/repo/auth_repo.dart';
import 'package:supabase_flutter/supabase_flutter.dart';

class SupabaseRepoImpl implements AuthRepo {
  final SupabaseAuthServices services;
  final DatabaseServices databaseServices;
  SupabaseRepoImpl(this.services, this.databaseServices);

  @override
  Future<Either<Failuer, UserEntity>> signupWithEmailAndPassword(
      {required String email,
      required String password,
      required String name}) async {
    try {
      UserEntity user = await services.signUpWithEmailAndPassword(
        email: email,
        password: password,
        name: name,
      );
      await addUserToDatabase(user);
      return right(user);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'An error occurred, please try again.'));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> signInWithEmailAndPassword(
      {required String email, required String password}) async {
    try {
      UserEntity user = await services.signInWithEmailAndPassword(
        email: email,
        password: password,
      );
      await UserLocaldata.setUserData(user);
      return right(user);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'An error occurred, please try again.'));
    }
  }

  @override
  Future<Either<Failuer, void>> signOut() async {
    try {
      await services.signOut();
      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'An error occurred, please try again.'));
    }
  }

  @override
  Future<Either<Failuer, void>> verifyEmail(
      {required String code, required String email}) async {
    try {
      await services.verifyEmail(
        code: code,
        email: email,
      );
      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'An error occurred, please try again.'));
    }
  }

  @override
  Future<Either<Failuer, void>> resendOtp({required String email}) async {
    try {
      await services.resendOtp(email: email);

      return right(null);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'An error occurred, please try again.'));
    }
  }

  @override
  Future<Either<Failuer, void>> signInWithGoogle() async {
    try {
      User user = await services.signInWithGoogle();
      await addUserToDatabase(UserEntity.fromSupabaseUser(user));
      return right(null);
    } catch (e) {
      return left(Failuer(message: 'An error occurred, please try again.'));
    }
  }

  @override
  Future<Either<Failuer, UserEntity>> getUser() async {
    try {
      UserEntity user = await services.getUser();
      return right(user);
    } catch (e) {
      if (e is AuthException) {
        return left(Failuer(message: e.message));
      }
      return left(Failuer(message: 'An error occurred, please try again.'));
    }
  }

  Future<void> addUserToDatabase(UserEntity user) async {
    await databaseServices.setRecord(tableName: 'users', data: user.toMap());
    await UserLocaldata.setUserData(user);
  }
}
