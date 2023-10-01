import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:x_app/data/repositories/jobs_repository/jobs_repo.dart';

part 'history_state.dart';

class HistoryCubit extends Cubit<HistoryState> {
  HistoryCubit(this.historyRepo) : super(HistoryInitial());

  final JobsRepo historyRepo;

// GetJobsHistory? getJobsHistory;
//
// static HistoryCubit get(BuildContext context) => BlocProvider.of(context);
//
// Future<void> getHistoryJobs() async {
//   emit(GetHistoryJobsListLoadingState());
//   historyRepo.getJobsHistoryList().then((value) => value.fold((l) {
//         if (kDebugMode) {
//           print(l.message);
//         }
//         emit(GetHistoryJobsListFailureState(message: l.message));
//       }, (r) {
//         getJobsHistory = r;
//         emit(GetHistoryJobsListSuccessState());
//       }));
// }
}
