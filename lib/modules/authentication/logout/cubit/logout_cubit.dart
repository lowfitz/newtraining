import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/logout/cubit/states.dart';
import 'package:new_bussiness_app/modules/authentication/logout/repo/logout_repo.dart';

class LogOutCubit extends Cubit<LogOutStates> {
  LogOutCubit() : super(LogOutIntial());

  static LogOutCubit get(context) => BlocProvider.of(context);

  logoutMethode() async {
    emit(LogOutLoading());
    final response = await LogoutRepo.logoutrepo();

    emit(LogOutSuccess());

    return response;
  }
}
