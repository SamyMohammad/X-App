import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app/presentation/home/screen/home_screen.dart';
import 'package:x_app/presentation/jobs/screen/jobs_screen.dart';
import 'package:x_app/presentation/profile/screen/profile_screen.dart';
import 'package:x_app/presentation/wallet/screen/wallet_screen.dart';

part 'main_state.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(MainInitial());
  static MainCubit get(BuildContext context) => BlocProvider.of(context);

  int currentIndex = 0;
  final List pages = const [
    HomeScreen(),
    ProfileScreen(),
    JobsScreen(),
    WalletScreen(),
  ];

  bottomNavigationTo(int index) {
    currentIndex = index;
    emit(BottomNavigationToState());
  }
}
