import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';
import 'package:x_app/data/remote/models/responses/get_all_jobs_response.dart';
import 'package:x_app/data/remote/models/responses/get_profile_complilation_response.dart';
import 'package:x_app/data/remote/models/responses/user_profile.dart';
import 'package:x_app/data/repositories/home_repository/home_repo.dart';
import 'package:x_app/data/repositories/profile_repository/profile_repo.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit(this.profileRepo, this.homeRepo) : super(HomeInitial());
  final HomeRepo homeRepo;
  final ProfileRepo profileRepo;

  JobsListData? data;
  UserProfile? userProfile;
  GetProfileCompilationResponse? compilationResponse;

  static HomeCubit get(BuildContext context) => BlocProvider.of(context);

  Future<void> getAllJobs(
      {required int page,
      required PagingController<int, JobData> pagingController}) async {
    emit(GetAllJobsListLoadingState());
    homeRepo.getAllJobs(page: page).then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }
          pagingController.error = l;
          emit(GetAllJobsListFailureState(message: l.message));
        }, (r) {
          final newItems = r.data?.data ?? [];

          data = r.data;
          // final previouslyFetchedItemsCount =
          // // 2
          // pagingController.itemList?.length ?? 0;

          // final isLastPage = newPage?.currentPage==newPage?.lastPage;
          bool isLastPage = newItems.length < 10;

          if (isLastPage) {
            // 3
            pagingController.appendLastPage(newItems);
          } else {
            final nextPageKey = page + newItems.length;
            pagingController.appendPage(newItems, nextPageKey);
          }
        }));
  }

  // Future<void> fetchPage(int pageKey) async {
  //   try {
  //     final newPage = await homeRepo.getAllJobs(
  //       page: pageKey,
  //     );
  //
  //     final previouslyFetchedItemsCount =
  //     // 2
  //     pagingController.itemList?.length ?? 0;
  //
  //     final isLastPage = newPage.isLastPage(previouslyFetchedItemsCount);
  //     final newItems = newPage.itemList;
  //
  //     if (isLastPage) {
  //       // 3
  //       pagingController.appendLastPage(newItems);
  //     } else {
  //       final nextPageKey = pageKey + 1;
  //       pagingController.appendPage(newItems, nextPageKey);
  //     }
  //   } catch (error) {
  //     // 4
  //     pagingController.error = error;
  //   }
  // }

  Future<void> getUserProfile() async {
    emit(const GetUserProfileLoadingState());
    await profileRepo.getUserProfile().then((value) => value.fold((l) {

            print('message : ${l.message}');
            print('staus : ${l.statusCode}');


            emit(const GetUserProfileErrorState());
        }, (r) {
          userProfile = r;

          // specialization=r.data?.userData?.specialization;

          emit(GetUserProfileSuccessState(data: r.data ?? []));
        }));
  }

  Future<void> getProfileCompilation() async {
    emit(const GetProfileCompilationLoadingState());
    await homeRepo.getProfileCompilation().then((value) => value.fold((l) {
          if (kDebugMode) {
            print(l.message);
          }

          emit(const GetProfileCompilationErrorState());
        }, (r) {
          compilationResponse = r;

          // specialization=r.data?.userData?.specialization;

          emit(GetProfileCompilationSuccessState(data: r.data ?? []));
        }));
  }
}
