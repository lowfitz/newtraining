import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:new_bussiness_app/modules/authentication/otp/cubit/states.dart';
import 'package:new_bussiness_app/modules/authentication/otp/domain/otp_repo.dart';
import 'package:new_bussiness_app/widgets/reusable_widgets.dart';

class OTPCubit extends Cubit<OTPStates> {
  OTPCubit() : super(OTPIntial());

  static OTPCubit get(context) => BlocProvider.of(context);

  otpSend({required Map<String, dynamic> body}) async {
    emit(OTPLoading());
    Myloading().show();
    var response = await OTPSendRepo.otpsendMethode(body: body);
    if (response != null) {
      Myloading().dimiss();

      emit(OTPSendSuccess());
    } else {
      emit(OTPSendFailure());
      return response;
    }
  }

  otpVerify({required Map<String, dynamic> body}) async {
    emit(OTPVerifyLoading());
    Myloading().show();
    var response = await OTPVerifyRepo.otpverifyMethode(body: body);
    if (response != null) {
      Myloading().dimiss();

      emit(OTPVerifySuccess());
    } else {
      emit(OTPVerifyFailure());
      return response;
    }
  }
}
