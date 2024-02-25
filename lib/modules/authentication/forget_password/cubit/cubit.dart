import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/forget_password/cubit/states.dart';
import 'package:new_bussiness_app/modules/authentication/forget_password/domain/forgerpass_repo.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class ForgetPasswordCubit extends Cubit<ForgetPasswordStates> {
  ForgetPasswordCubit() : super(ForgetPasswordIntial());

  static ForgetPasswordCubit get(context) => BlocProvider.of(context);

  forgetPasswordCubitMethode({required Map<String, dynamic> body}) async {
    emit(ForgetPasswordLoading());
    Myloading().show();
    var response = await ForgetPasswordRepo.forgetPasswordMethode(body: body);
    if (response != null) {
      Myloading().dimiss();

      emit(ForgetPasswordLoadingSuccess());
    } else {
      emit(ForgetPasswordLoadingFailure());
      return response;
    }
  }
}
