import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/ads/delete_ads/cubit/states.dart';
import 'package:new_bussiness_app/modules/ads/delete_ads/domain/delete_ads_repo.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class DeleteADsCubit extends Cubit<DeleteADStates> {
  DeleteADsCubit() : super(DeleteADIntial());

  static DeleteADsCubit get(context) => BlocProvider.of(context);

  deleteADMethode({required String id}) async {
    emit(DeleteADLoading());
    Myloading().show();
    var response = await DeleteADsRepo.deleteADsMethode(id: id);
    if (response != null) {
      Myloading().dimiss();

      emit(DeleteADLoadingSuccess());
    } else {
      emit(DeleteADLoadingFailure());
      return response;
    }
  }
}
