abstract class OTPStates {}

class OTPLoading extends OTPStates {}

class OTPIntial extends OTPStates {}

class OTPSendSuccess extends OTPStates {}

class OTPSendFailure extends OTPStates {}

class OTPVerifyFailure extends OTPStates {}

class OTPVerifySuccess extends OTPStates {}

class OTPVerifyLoading extends OTPStates {}
