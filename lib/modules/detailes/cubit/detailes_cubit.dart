import 'package:flutter/widgets.dart';
import 'package:new_bussiness_app/modules/detailes/cubit/detailes_state.dart';
import 'package:new_bussiness_app/modules/detailes/domain/detailes_repo.dart';
import 'package:new_bussiness_app/modules/home/domain/home_model.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DetailesCubit extends Cubit<DetailState> {
  DetailesCubit() : super(DetailesInitial());

  static DetailesCubit get(context) => BlocProvider.of(context);
  List<Categories> categories = [];
  List<Ads> ads = [];
  List<Slides> slides = [];

  getDetailesData({
    required BuildContext context,
  }) async {
    emit(DetailesPageLoading());
    var response = await DetailesRepo.getDetailesData(context: context);
    if (response != null) {
      categories = response.categories ?? [];
      ads = response.ads ?? [];

      slides = response.slides ?? [];

      emit(DetailesPageLoadingSuccess());
    } else {
      emit(DetailesPageLoadingFailure());
      return null;
    }
  }
}
