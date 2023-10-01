import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:x_app/presentation/resources/color_manager.dart';
import 'package:x_app/presentation/resources/styles_manager.dart';
import 'package:x_app/presentation/wallet/bloc/wallet_cubit.dart';

class WalletScreen extends StatefulWidget {
  const WalletScreen({Key? key}) : super(key: key);

  @override
  State<WalletScreen> createState() => _WalletScreenState();
}

class _WalletScreenState extends State<WalletScreen> {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => WalletCubit(),
      child: BlocConsumer<WalletCubit, WalletState>(
        // listenWhen: (oldState, newState) =>// oldState.submissionStatus != newState.submissionStatus,
        listener: (context, state) {},
        builder: (context, state) {
          return SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 40.0.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    padding:
                        EdgeInsets.symmetric(horizontal: 15.w, vertical: 7.h),
                    // height: MediaQuery.of(context).size.height /8,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.r)),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,

                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('You have totally',
                                style: getBoldStyle(
                                  fontSize: 15.sp,
                                  color: ColorManager.dark,
                                )),
                            Icon(
                              Icons.account_balance_wallet,
                              color: ColorManager.primary,
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text('144',
                                style: getBoldStyle(
                                  fontSize: 38.sp,
                                  color: ColorManager.primary,
                                )),
                            SizedBox(width: 4.w,),
                            Text('\$',
                                style: getBoldStyle(
                                  fontSize: 38.sp,
                                  color: ColorManager.dark,
                                )),
                          ],
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Text('The amount you can withdraw now is 100 \$',
                            style: getRegularStyle(
                              fontSize: 10.sp,
                              color: ColorManager.hintText,
                            )),
                      ],
                    ),
                  )
                ],
              ),
            ),
          );
          // state.getScreenWidget(context, buildContentBody(context, cubit, state), () {});

          // return buildContentBody(context, cubit, state);
        },
      ),
    );
  }
}
