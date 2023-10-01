part of 'wallet_cubit.dart';

abstract class WalletState {
  const WalletState();
}

class WalletInitial extends WalletState {}

class BottomNavigationToState extends WalletState {}
