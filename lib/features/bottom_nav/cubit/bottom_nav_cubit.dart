import 'package:e_commerce_app/core/theme/constant/app_icons.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'bottom_nav_state.dart';

class BottomNavCubit extends Cubit<BottomNavState> {
  BottomNavCubit() : super(BottomNavState(tab: Tab.home));

  void changeTab(int index) => emit(BottomNavState(tab: Tab.values[index]));
}
