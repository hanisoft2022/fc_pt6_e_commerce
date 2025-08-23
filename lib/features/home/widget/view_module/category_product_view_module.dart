import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:gap/gap.dart';

import 'view_module.dart';
import 'widget/widget.dart';

class CategoryProductViewModule extends StatefulWidget with ViewModuleWidget {
  final ViewModuleEntity viewModule;

  const CategoryProductViewModule({super.key, required this.viewModule});

  @override
  State<CategoryProductViewModule> createState() => _CategoryProductViewModuleState();
}

class _CategoryProductViewModuleState extends State<CategoryProductViewModule>
    with TickerProviderStateMixin {
  late TabController _tabController;

  @override
  void initState() {
    super.initState();

    _tabController = TabController(length: widget.viewModule.tabs.length, vsync: this)
      ..addListener(() => setState(() {}));
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final colorScheme = context.colorScheme;
    final viewmodule = widget.viewModule;

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        ViewModulePadding(child: ViewModuleTitle(title: viewmodule.title)),
        Gap(12),
        TabBar(
          tabAlignment: TabAlignment.start,
          tabs: List.generate(viewmodule.tabs.length, (index) => Tab(text: viewmodule.tabs[index])),
          controller: _tabController,
          isScrollable: true,
        ),
        Gap(12),
        Padding(
          padding: PaddingConstants.horizontalPadding,
          child: AspectRatio(
            aspectRatio: 343 / 452,
            child: TabBarView(
              controller: _tabController,
              children: List.generate(
                viewmodule.tabs.length,
                (index) => GridView.builder(
                  physics: NeverScrollableScrollPhysics(),
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 3,
                    mainAxisSpacing: 12,
                    crossAxisSpacing: 8,
                    childAspectRatio: ((343 - 16) / 3) / ((452 - 12) / 2),
                  ),
                  itemBuilder: (context, index) {
                    final productInfo = viewmodule.products[index];

                    return SmallProductCard(context: context, productInfo: productInfo);
                  },
                  itemCount: viewmodule.products.length,
                ),
              ),
            ),
          ),
        ),
        Gap(12),
        Padding(
          padding: PaddingConstants.horizontalPadding,
          child: Container(
            decoration: BoxDecoration(
              color: Colors.grey[200],
              borderRadius: BorderRadius.circular(10),
            ),
            child: Padding(
              padding: EdgeInsets.symmetric(vertical: 12),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '${viewmodule.tabs[_tabController.index]} 전체보기',
                    style: context.textTheme.titleSmall
                        ?.copyWith(color: colorScheme.contentPrimary)
                        .regular,
                  ),
                  SvgPicture.asset(
                    AppIcons.chevronRight,
                    width: 16,
                    height: 16,
                    colorFilter: ColorFilter.mode(colorScheme.contentPrimary, BlendMode.srcIn),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
