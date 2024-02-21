import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/ads/add_ads/cubit/states.dart';
import 'package:new_bussiness_app/modules/ads/add_ads/domain/add_ad_repo.dart';

class AddAdCubit extends Cubit<AddAdStates> {
  AddAdCubit() : super(AddAdsInitial());

  static AddAdCubit get(context) => BlocProvider.of(context);

  postAdMethode({
    required BuildContext context,
    Map<String, dynamic>? body,
  }) async {
    emit(AddAdsPageLoading());
    var response = await AddAdsRepo.postAd(context: context, body: body);
    if (response != null) {
      emit(AddAdsPageLoadingSuccess());
    } else {
      emit(AddAdsPageLoadingFailure());
    }
  }
}
