class ApiUrl {

  static const baseUrl = "http://10.0.60.118:6001";
  // static const netWorkUrl = "https://api.ansbackstage.com";

  ///================================= User Authentication url==========================
  static const register = "/auth/register";
  static const activateAccount = "/auth/activate-user";
  static const login = "/auth/login";
  static const forgotPassword = "/auth/forgot-password";
  static const forgotVerifyOtp = "/auth/verify-otp";
  static String resetPassword({required String email}) {
    return "/auth/reset-password?email=$email";
  }




  //================Home Section===============
  static const banner = "/dashboard/all-adds";
  // static const category = "/dashboard/get_all_recipe?category=breakfast";
  // static const goalSetting = "/dashboard/get_all_recipe?weight_and_muscle=weight_loss";


  //================Profile Section===============
  static const changePassword = "/auth/change-password";
  static const getProfile = "/auth/profile";
  static const profileEdit = "/auth/edit-profile";
  static const faq = "/dashboard/get-faqs";
  static const terms = "/dashboard/get-rules";
  static const privacyPolicy = "/dashboard/get-privacy-policy";
  static const contact = "/dashboard/send-message-support";
  static String deleteAccount({required String id}) {
    return "/auth/delete-account?authId=$id";
  }



}
