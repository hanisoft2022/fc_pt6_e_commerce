import 'package:flutter_bloc/flutter_bloc.dart';

part 'mall_type_state.dart';

class MallTypeCubit extends Cubit<MallType> {
  MallTypeCubit() : super(MallType.market);
}
