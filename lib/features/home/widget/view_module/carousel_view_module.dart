import 'dart:async';

import 'package:domain/domain.dart';
import 'package:e_commerce_app/core/core.dart';
import 'package:flutter/widgets.dart';

import 'view_module_widget.dart';

class CarouselViewModule extends StatefulWidget with ViewModuleWidget {
  final ViewModule viewModule;

  const CarouselViewModule({super.key, required this.viewModule});

  @override
  State<CarouselViewModule> createState() => _CarouselViewModuleState();
}

class _CarouselViewModuleState extends State<CarouselViewModule> {
  final pageController = PageController();

  late Timer _timer;

  int currentPage = 1;

  Timer periodicTimer() {
    return Timer.periodic(const Duration(seconds: 3), (timer) {
      pageController.nextPage(duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  void initState() {
    super.initState();

    _timer = periodicTimer();
  }

  @override
  void dispose() {
    _timer.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<ProductInfo> products = widget.viewModule.products;

    return AspectRatio(
      aspectRatio: 375 / 340,
      child: Stack(
        children: [
          PageView.builder(
            onPageChanged: (page) => setState(() {
              currentPage = page % products.length + 1;
            }),
            controller: pageController,
            itemBuilder: (context, index) {
              String imageUrl = products[index % products.length].imageUrl;

              return Image.network(imageUrl, fit: BoxFit.cover);
            },
          ),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsetsGeometry.all(16),
              child: _PagecountWidget(currentPage: currentPage, totalPage: products.length),
            ),
          ),
        ],
      ),
    );
  }
}

class _PagecountWidget extends StatelessWidget {
  final int currentPage;
  final int totalPage;

  const _PagecountWidget({required this.currentPage, required this.totalPage});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: context.theme.colorScheme.inverseSurface.withAlpha(100),
        borderRadius: BorderRadius.circular(20),
      ),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
        child: Text(
          '$currentPage/$totalPage',
          style: context.textTheme.labelLarge!.copyWith(color: AppColors.white),
        ),
      ),
    );
  }
}
