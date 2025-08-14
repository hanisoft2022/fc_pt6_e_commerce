import 'package:domain/domain.dart';
import 'package:flutter/widgets.dart';

import 'view_module_widget.dart';

class CarouselViewModule extends StatefulWidget with ViewModuleWidget {
  final ViewModule viewModule;

  const CarouselViewModule({super.key, required this.viewModule});

  @override
  State<CarouselViewModule> createState() => _CarouselViewModuleState();
}

class _CarouselViewModuleState extends State<CarouselViewModule> {
  @override
  Widget build(BuildContext context) {
    List<ProductInfo> products = widget.viewModule.products;

    return AspectRatio(
      aspectRatio: 375 / 340,
      child: PageView.builder(
        itemBuilder: (context, index) {
          String url = products[index % products.length].imageUrl;

          return Image.network(url, fit: BoxFit.cover);
        },
      ),
    );
  }
}
