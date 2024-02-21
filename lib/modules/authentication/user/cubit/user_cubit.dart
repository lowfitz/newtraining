import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/General/utils.dart';
import 'package:new_bussiness_app/modules/login_screens/cubit/states.dart';
import 'package:new_bussiness_app/modules/login_screens/domain/user_model.dart';
import 'package:new_bussiness_app/modules/login_screens/domain/user_repo.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class UserCubit extends Cubit<UserStates> {
  UserCubit() : super(UserIntial());
  static UserCubit get(context) => BlocProvider.of(context);

  UserModel? user;

  getaccountDetiles(
    BuildContext context,
  ) async {
    emit(UserLoading());

    var response =
        await UserRepo.getUserData(context: context, token: Utils.token);
    if (response != null) {
      emit(UserLoadingSuccess());
      if (kDebugMode) {
        print(response.data?.avatar);
      }
      user = response;

      return response;
    } else {
      emit(UserLoadingFailure());
      Myloading().dimiss();
      return null;
    }
  }
}
