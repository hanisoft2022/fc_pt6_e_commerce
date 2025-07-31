import 'package:e_commerce_app/core/theme/custom/custom_app_bar.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'mall_type_state.dart';

class MallTypeCubit extends Cubit<MallType> {
  MallTypeCubit() : super(MallType.market);

  void changeMallType(MallType mallType) => emit(mallType);
}
