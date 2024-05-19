

import 'package:eventak/features/setting/data/reposatiory/logout_repo.dart';
import 'package:eventak/features/setting/presentation/cubit/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingCubit extends Cubit<SettingState> {
  SettingCubit(this.logoutRepo) : super(SettingInitial());
  final LogOutReposatiry logoutRepo;

  void logout() async {
    emit(LogOutLoadingState());
    final result = await logoutRepo.logOut();
    result.fold((l) => emit(LogOutErrorState(l)),
        (r) => emit(LogOutSuccessState(r)));

}
}