
import 'package:eventak/core/database/api/api/end_points.dart';
import 'package:eventak/core/database/cache/cache_helper.dart';
import 'package:eventak/core/services/service_locator.dart';
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
        await sl<CacheHelper>().clearData(key: Apikeys.token);
        await sl<CacheHelper>().clearData(key: Apikeys.id);
        
        emit(LogOutSuccessState(r));
      },
    );
  }
}
