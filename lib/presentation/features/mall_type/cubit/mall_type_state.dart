part of 'mall_type_cubit.dart';

extension MallTypeXX on MallType {
  CustomAppBarTheme get theme {
    switch (this) {
      case MallType.market:
        return CustomAppBarTheme.market;
      case MallType.beauty:
        return CustomAppBarTheme.beauty;
    }
  }
}
