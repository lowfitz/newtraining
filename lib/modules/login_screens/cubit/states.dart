abstract class LogInState {}

class LogInLoading extends LogInState {}

class LogInIntial extends LogInState {}

class LogInLoadingSuccess extends LogInState {}

class LogInLoadingFailure extends LogInState {}

abstract class UserStates {}

class UserLoading extends UserStates {}

class UserIntial extends UserStates {}

class UserLoadingSuccess extends UserStates {}

class UserLoadingFailure extends UserStates {}
