import 'package:flutter/widgets.dart';

import 'package:new_bussiness_app/modules/login_screens/cubit/states.dart';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/login_screens/domain/login_repo.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class LogInCubit extends Cubit<LogInState> {
  LogInCubit() : super(LogInIntial());

  static LogInCubit get(context) => BlocProvider.of(context);

  logInMethode(
      {required BuildContext context,
      required Map<String, dynamic> body}) async {
    emit(LogInLoading());
    Myloading().show();
    var response = await LogInRepo.logInMethode(context: context, body: body);
    if (response != null) {
      Myloading().dimiss();

      emit(LogInLoadingSuccess());
    } else {
      emit(LogInLoadingFailure());
      return null;
    }
  }
}
