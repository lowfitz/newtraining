import 'package:flutter/widgets.dart';
import 'package:new_bussiness_app/modules/home/domain/home_model.dart';
import 'package:new_bussiness_app/modules/home/domain/home_repo.dart';

import '/modules/home/cubit/states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomeCubit extends Cubit<HomeStates> {
  HomeCubit() : super(HomeInitial());

  static HomeCubit get(context) => BlocProvider.of(context);
  List<Categories> categories = [];
  List<Ads> ads = [];
  List<Slides> slides = [];

  getHomeData({
    required BuildContext context,
  }) async {
    emit(HomePageLoading());
    var response = await HomeRepo.getHomeData(context: context);
    if (response != null) {
      categories = response.categories ?? [];
      ads = response.ads ?? [];
      slides = response.slides ?? [];
      emit(HomePageLoadingSuccess());
    } else {
      emit(HomePageLoadingFailure());
      return null;
    }
  }
}
