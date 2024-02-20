import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:new_bussiness_app/modules/edit_ads/cubit/states.dart';
import 'package:new_bussiness_app/modules/edit_ads/domain/edit_repo.dart';

class EditAdCubit extends Cubit<EditAdStates> {
  EditAdCubit() : super(EditAdsInitial());

  static EditAdCubit get(context) => BlocProvider.of(context);

  editAdsData(
      {required BuildContext context,
      required int id,
      required Map<String, dynamic> body}) async {
    emit(EditAdsPageLoading());
    var response =
        await EditAdsRepo.editAdsData(context: context, id: id, body: body);
    if (response != null) {
      emit(EditAdsPageLoadingSuccess());
    } else {
      emit(EditAdsPageLoadingFailure());
      return null;
    }
  }
}
