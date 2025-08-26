import 'package:e_commerce_app/core/core.dart';
import 'package:e_commerce_app/features/cart_list/cart_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import 'widgets/add_cart_button.dart';
import 'widgets/cart_price_info.dart';
import 'widgets/cart_product_info.dart';

Future<bool?> showCartBottomSheet(BuildContext context) {
  return showModalBottomSheet(
    context: context,
    builder: (_) {
      return BlocListener<CartListBloc, CartListState>(
        listener: (context, state) {
          if (state.status.isFailure) {
            CommonSnackBar.errorSnackBar(context, error: state.error);
          }
          if (context.canPop()) {
            context.pop(!state.status.isFailure);
          }
        },
        listenWhen: (previous, current) =>
            previous.status != current.status && !current.status.isLoading,
        child: SafeArea(
          child: const SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CartProductInfo(),
                Divider(thickness: 1),
                CartPriceInfo(),
                AddCartButton(),
              ],
            ),
          ),
        ),
      );
    },
    shape: RoundedRectangleBorder(
      borderRadius: const BorderRadius.vertical(top: Radius.circular(12.0)),
    ),
    showDragHandle: true,
  );
}
