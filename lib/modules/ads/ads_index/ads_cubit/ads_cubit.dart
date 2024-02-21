import 'dart:developer';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/ads/ads_cubit/ads_states.dart';
import 'package:new_bussiness_app/modules/ads/domain/ads_repo.dart';
import 'package:new_bussiness_app/modules/ads/domain/model.dart';
import 'package:new_bussiness_app/modules/edit_ads/cubit/show_states.dart';
import 'package:new_bussiness_app/modules/edit_ads/domain/edit_repo.dart';
import 'package:new_bussiness_app/modules/edit_ads/domain/model.dart';

class AdsCubit extends Cubit<AdsStates> {
  AdsCubit() : super(AdsInitial());

  static AdsCubit get(context) => BlocProvider.of(context);

  List<AdsData>? ads = [];

  getAdsData(
      {required BuildContext context,
      required Map<String, dynamic> query}) async {
    emit(AdsPageLoading());
    var response = await AdsRepo.getAdsData(
      context: context,
      query: query,
    );
    if (response != null) {
      ads = response.data;
      emit(AdsPageLoadingSuccess());
    } else {
      emit(AdsPageLoadingFailure());
      return null;
    }
  }
}

class ShowItemCubit extends Cubit<ShowItemStates> {
  ShowItemCubit() : super(ShowItemInitial());

  static ShowItemCubit get(context) => BlocProvider.of(context);
  Data? adItem;
  Future showAdsData({
    required BuildContext context,
    required String id,
  }) async {
    log(id);
    emit(ShowItemPageLoading());
    var response = await ShowAdRepo.showad(
      id: id,
    );
    if (response != null) {
      adItem = response.data;
      if (kDebugMode) {
        print(response.data);
      }
      emit(ShowItemPageLoadingSuccess());
    } else {
      emit(ShowItemPageLoadingFailure());
      return null;
    }
  }
}
