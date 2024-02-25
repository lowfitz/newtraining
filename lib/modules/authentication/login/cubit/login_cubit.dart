import 'package:new_bussiness_app/modules/authentication/login/cubit/login_states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/login/domain/login_repo.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInIntial());

  static LogInCubit get(context) => BlocProvider.of(context);

  logInMethode({required Map<String, dynamic> body}) async {
    emit(LogInLoading());
    Myloading().show();
    var response = await LogInRepo.logInMethode(body: body);
    if (response != null) {
      Myloading().dimiss();

      emit(LogInLoadingSuccess());
    } else {
      emit(LogInLoadingFailure());

      return null;
    }
  }
}
