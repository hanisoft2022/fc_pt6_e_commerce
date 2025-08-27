// import 'package:core/core.dart';
import 'package:core/core.dart';
import 'package:domain/domain.dart';
import 'package:e_commerce_app/features/cart_list/bloc/cart_list_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../core/core.dart';
import '../payment_bloc/payment_bloc.dart';

class PaymentButton extends StatelessWidget {
  final List<CartEntity> selectedCartProducts;
  final int totalPrice;

  const PaymentButton({super.key, required this.selectedCartProducts, required this.totalPrice});

  @override
  Widget build(BuildContext context) {
    return BlocListener<PaymentBloc, PaymentState>(
      listener: (context, state) {
        if (state.status == PaymentStatus.success) {
          context.read<CartListBloc>().add(CartProductDeleted(productIds: state.productIds ?? []));
          CommonSnackBar.successSnackBar(context, msg: '결제가 성공적으로 진행됐습니다.');
        } else if (state.status == PaymentStatus.failure) {
          CommonSnackBar.errorSnackBar(context, error: ErrorResponse(message: state.message));
        }
      },
      child: Padding(
        padding: PaddingConstants.horizontalPadding,
        child: SizedBox(
          height: 48,
          child: TextButton(
            onPressed: selectedCartProducts.isNotEmpty
                ? () {
                    context.read<PaymentBloc>().add(
                      PaymentRequested(cartProducts: selectedCartProducts, context: context),
                    );
                  }
                : null,
            style: TextButton.styleFrom(
              backgroundColor: selectedCartProducts.isNotEmpty
                  ? context.colorScheme.primary
                  : Colors.grey[400] ?? Colors.grey,
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0)),
            ),
            child: Center(
              // child: BlocListener<PaymentBloc, PaymentState>(
              //   listener: (context, state) {
              //     if (state.status == PaymentStatus.success) {
              //       context.read<CartListBloc>().add(
              //         CartListDeleted(productIds: state.productIds ?? []),
              //       );
              //       CommonSnackBar.successSnackBar(context, msg: '결제가 성공적으로 진행됐습니다.');
              //     } else if (state.status == PaymentStatus.error) {
              //       CommonSnackBar.errorSnackBar(
              //         context,
              //         error: ErrorResponse(message: state.message),
              //       );
              //     }
              //   },
              child: Text(
                selectedCartProducts.isNotEmpty ? '${totalPrice.toWon} 결제하기' : '상품을 선택해주세요',
                style: context.textTheme.titleSmall?.copyWith(color: context.colorScheme.onPrimary),
              ),
              // ),
            ),
          ),
        ),
      ),
    );
  }
}
