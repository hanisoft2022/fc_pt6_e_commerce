import 'package:core/core.dart';
import 'package:domain/domain.dart';

class AddToCartUsecase implements FirestoreUsecase<DisplayRepository, Result<List<CartEntity>>> {
  final CartEntity cartEntity;

  AddToCartUsecase({required this.cartEntity});

  @override
  Future<Result<List<CartEntity>>> call(DisplayRepository repository) async {
    final result = await repository.addToCart(cartEntity);

    return result.status.isSuccess
        ? Result.success(result.data ?? [])
        : Result.failure(
            ErrorResponse(status: result.status, code: result.code, message: result.message),
          );
  }
}
