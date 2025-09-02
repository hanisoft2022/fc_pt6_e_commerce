import 'package:core/core.dart';
import 'package:domain/domain.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';

import 'package:kakao_flutter_sdk_user/kakao_flutter_sdk_user.dart' as kakao;

import '../../../core/core.dart';

part 'kakao_user_event.dart';

part 'kakao_user_state.dart';

part 'kakao_user_bloc.freezed.dart';

@injectable
class KakaoUserBloc extends Bloc<KakaoUserEvent, KakaoUserState> {
  final KakaoUserUsecase _userUsecase;

  KakaoUserBloc(this._userUsecase) : super(KakaoUserState()) {
    on<KakaoUserLogin>(_onUserLogin);
    on<KakaoUserLoginWithToken>(_onUserLoginWithToken);
    on<KakaoUserLogout>(_onUserLogout);
  }

  Future<void> _onUserLogin(KakaoUserLogin event, Emitter<KakaoUserState> emit) async {
    try {
      emit(state.copyWith(status: Status.loading));

      final Result<kakao.User?> response = await _userUsecase.execute<Result<kakao.User?>>(
        usecase: LoginUsecase(),
      );

      response.when(
        failure: (_) {
          emit(state.copyWith(status: Status.initial));
        },
        success: (user) {
          emit(state.copyWith(status: Status.success, user: user));
        },
      );
    } on ErrorResponse catch (error) {
      emit(state.copyWith(status: Status.failure, error: error));
    } catch (error) {
      CustomLogger.logger.e(error);
      emit(state.copyWith(status: Status.failure, error: CommonException.setError(error)));
    }
  }

  Future<void> _onUserLoginWithToken(
    KakaoUserLoginWithToken event,
    Emitter<KakaoUserState> emit,
  ) async {
    emit(state.copyWith(status: Status.loading));
    try {
      final response = await _userUsecase.execute<Result<kakao.User?>>(
        usecase: LoginWithTokenUsecase(),
      );

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

  Future<void> _onUserLogout(KakaoUserLogout event, Emitter<KakaoUserState> emit) async {
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
