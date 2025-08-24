import 'package:core/core.dart';
import 'package:domain/domain.dart';

class ChangeCartProductQtyUsecase
    implements FirestoreUsecase<DisplayRepository, Result<List<CartEntity>>> {
  final String productId;
  final int changedQuantity;
  ChangeCartProductQtyUsecase({required this.productId, required this.changedQuantity});

  @override
  Future<Result<List<CartEntity>>> call(DisplayRepository repository) async {
    final result = await repository.changeCartProductQty(productId, changedQuantity);
    return result.status.isSuccess
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}
