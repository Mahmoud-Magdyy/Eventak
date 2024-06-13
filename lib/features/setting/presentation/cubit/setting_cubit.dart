
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/services/service_locator.dart';
import 'package:eventak/features/home/presenation/home_cubit/home_cubit.dart';
import 'package:eventak/features/setting/data/reposatiory/logout_repo.dart';
import 'package:eventak/features/setting/presentation/cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.logoutRepo) : super(SettingInitial());
  final LogOutReposatiry logoutRepo;

  void logout() async {
    emit(LogOutLoadingState());
    final result = await logoutRepo.logOut();
    result.fold(
      (l) => emit(LogOutErrorState(l)),
      (r) async {
        // Clear cached token and user ID
        await sl<CacheHelper>().clearAllData();
        await sl<CacheHelper>().clearData(key: Apikeys.id);
        await sl<CacheHelper>().clearData(key: Apikeys.token);
        resetCubit();
        emit(LogOutSuccessState(r));
      },
    );
  }
  void deleteAccount() async {
    emit(DeleteAccountLoadingState());
    final response = await logoutRepo.deleteAccount();
    response.fold((l) => emit(DeleteAccountErrorState(l)), (r) {
      emit(DeleteAccountSuccessState(r.status));
    });
  }
  void resetCubit() {
    emit(SettingInitial());
  }
}
