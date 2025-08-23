import 'package:core/core.dart';
import 'package:domain/domain.dart';

class ChangeCartProductQtyUsecase
    implements FirestoreUsecase<DisplayRepository, Result<List<CartEntity>>> {
  final String productId;
  final int quantity;
  ChangeCartProductQtyUsecase({required this.productId, required this.quantity});

  @override
  Future<Result<List<CartEntity>>> call(DisplayRepository repository) async {
    final result = await repository.changeCartProductQty(productId, quantity);
    return result.status.isSuccess
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}
