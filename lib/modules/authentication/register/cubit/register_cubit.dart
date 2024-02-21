import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/register/cubit/register_states.dart';
import 'package:new_bussiness_app/modules/authentication/register/domain/regiser_repo.dart';

import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class RegisterCubit extends Cubit<RegisterStates> {
  RegisterCubit() : super(RegisterIntial());

  static RegisterCubit get(context) => BlocProvider.of(context);

  registerMethode({required Map<String, dynamic> body}) async {
    emit(RegisterLoading());
    Myloading().show();
    var response = await RegisterRepo.registerMethode(body: body);
    if (response != null) {
      Myloading().dimiss();

      emit(RegisterLoadingSuccess());
    } else {
      emit(RegisterLoadingFailure());
      return response;
    }
  }
}
