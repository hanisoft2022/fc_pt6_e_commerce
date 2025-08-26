import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gap/gap.dart';
import 'package:go_router/go_router.dart';

import '../../../core/core.dart';
import '../cart_list.dart';

class CartListView extends StatefulWidget {
  const CartListView({super.key});

  @override
  State<CartListView> createState() => _CartListViewState();
}

class _CartListViewState extends State<CartListView> {
  @override
  void initState() {
    super.initState();
    context.read<CartListBloc>().add(CartListStarted());
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final textTheme = context.textTheme;

    return Scaffold(
      appBar: AppBar(
        leading: Center(
          child: SVGIconButton(
            iconPath: AppIcons.close,
            color: colorScheme.contentPrimary,
            onPressed: () {
              if (context.canPop()) {
                context.pop();
              }
            },
          ),
        ),
        title: Text(
          '장바구니',
          style: textTheme.titleMedium.semiBold?.copyWith(color: colorScheme.contentPrimary),
        ),
        bottom: PreferredSize(
          preferredSize: Size.fromHeight(48),
          child: Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            decoration: BoxDecoration(
              border: Border(top: BorderSide(color: colorScheme.outline)),
            ),
            child: BlocBuilder<CartListBloc, CartListState>(
              builder: (context, state) {
                final bool isAllSelected =
                    (state.selectedProductsIds.length == state.cartProducts.length) &&
                    state.cartProducts.isNotEmpty;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        SVGIconButton(
                          iconPath: isAllSelected
                              ? AppIcons.checkMarkCircleFill
                              : AppIcons.checkMarkCircle,
                          color: isAllSelected ? colorScheme.primary : colorScheme.contentFourth,
                          onPressed: () =>
                              context.read<CartListBloc>().add(CartAllProductsSelected()),
                        ),
                        Gap(8),
                        Text(
                          '전체 선택 (${state.selectedProductsIds.length}/${state.cartProducts.length})',
                          style: textTheme.titleSmall?.copyWith(color: colorScheme.contentPrimary),
                        ),
                      ],
                    ),
                    GestureDetector(
                      child: Text(
                        '선택 삭제',
                        style: textTheme.titleSmall.semiBold?.copyWith(
                          color: colorScheme.contentSecondary,
                        ),
                      ),
                      onTap: () => context.read<CartListBloc>().add(
                        CartProductDeleted(productIds: state.selectedProductsIds),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
        ),
        backgroundColor: colorScheme.surface,
        centerTitle: true,
      ),
      body: BlocBuilder<CartListBloc, CartListState>(
        builder: (_, state) {
          switch (state.status) {
            case Status.initial:
            case Status.loading:
            case Status.failure:
              return const Center(child: CircularProgressIndicator());
            case Status.success:
              return ListView(
                children: [
                  Divider(height: 8, thickness: 8, color: colorScheme.surface),
                  Column(
                    children: List.generate(
                      state.cartProducts.length,
                      (index) => CartProductCard(cartEntity: state.cartProducts[index]),
                    ),
                  ),
                  CartTotalPrice(isEmpty: state.cartProducts.isEmpty),
                ],
              );
          }
        },
      ),
    );
  }
}
