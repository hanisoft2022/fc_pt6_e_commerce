import 'package:core/core.dart';
import 'package:domain/domain.dart';

class DeleteCartProductUsecase
    implements FirestoreUsecase<DisplayRepository, Result<List<CartEntity>>> {
  final List<String> productIds;
  DeleteCartProductUsecase({required this.productIds});

  @override
  Future<Result<List<CartEntity>>> call(DisplayRepository repository) async {
    final result = await repository.deleteCartProduct(productIds);
    return result.status.isSuccess
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}
