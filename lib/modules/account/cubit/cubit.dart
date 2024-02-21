import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/account/cubit/states.dart';
import 'package:new_bussiness_app/modules/account/doamin/update_user_repo.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class UpdateUserCubit extends Cubit<UpdateUserStates> {
  UpdateUserCubit() : super(UpdateUserIntial());

  static UpdateUserCubit get(context) => BlocProvider.of(context);

  updateUserMethode({required Map<String, dynamic> body}) async {
    emit(UpdateUserLoading());
    Myloading().show();
    var response = await UpdateUserRepo.updateUserMethode(body: body);
    if (response != null) {
      Myloading().dimiss();

      emit(UpdateUserLoadingSuccess());
    } else {
      emit(UpdateUserLoadingFailure());
      return response;
    }
  }
}
