

abstract class SocialLoginStates {}

class SocialLoginInitialState extends SocialLoginStates {}

class SocialLoadingLoginState extends SocialLoginStates {}



class SocialLoginSuccessState extends SocialLoginStates {
  final String uId;

  SocialLoginSuccessState(this.uId);
  
}

class SocialLoginErrorState extends SocialLoginStates {
  final String error;

  SocialLoginErrorState(this.error);
}

class changePasswordVisibilityState extends SocialLoginStates {}
