import 'package:core/core.dart';
import 'package:domain/domain.dart';

class GetCartListUsecase implements FirestoreUsecase<DisplayRepository, Result<List<CartEntity>>> {
  @override
  Future<Result<List<CartEntity>>> call(DisplayRepository repository) async {
    final result = await repository.getCartList();
    return result.status.isSuccess
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}
