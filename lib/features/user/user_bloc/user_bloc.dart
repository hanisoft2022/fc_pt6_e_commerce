import 'package:bootpay/model/user.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import '../../../core/core.dart';
part 'user_event.dart';

part 'user_state.dart';

part 'user_bloc.freezed.dart';

@injectable
class UserBloc extends Bloc<UserEvent, UserState> {
  final UserUsecase _userUsecase;

  UserBloc(this._userUsecase) : super(UserState()) {
    on<UserLogin>(_onUserLogin);
    on<UserLoginWithToken>(_onUserLoginWithToken);
    on<UserLogout>(_onUserLogout);
  }

  Future<void> _onUserLogin(UserLogin event, Emitter<UserState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final response = await _userUsecase.execute<Result<User>>(usecase: LoginUsecase());

      response.when(
        success: (user) {
          emit(state.copyWith(status: Status.success, user: user));
        },
        failure: (_) {
          emit(state.copyWith(status: Status.initial));
        },
      );
    } on ErrorResponse catch (error) {
      emit(state.copyWith(status: Status.failure, error: error));
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<void> _onUserLoginWithToken(UserLoginWithToken event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await _userUsecase.execute<Result<User>>(usecase: LoginWithTokenUsecase());

      response.when(
        success: (user) {
          emit(state.copyWith(status: Status.success, user: user));
        },
        failure: (_) {
          emit(state.copyWith(status: Status.initial));
        },
      );
    } on ErrorResponse catch (error) {
      emit(state.copyWith(status: Status.failure, error: error));
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<void> _onUserLogout(UserLogout event, Emitter<UserState> emit) async {
    emit(state.copyWith(status: Status.loading));
    try {
      await _userUsecase.execute(usecase: LogoutUsecase());
      emit(state.copyWith(status: Status.initial, user: null));
    } on ErrorResponse catch (error) {
      emit(state.copyWith(status: Status.failure, error: error));
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }
}
