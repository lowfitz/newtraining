class EndPoints {
  static String cities = "cities";
  static String categories = "categories";
  static String categoriesDivider = "categories-divider";
  static String home = "home";
  static String login = "auth/login";
  static String register = "auth/signup";
  static String user = "auth/user";
  static String sendOTP = "auth/send-otp";
  static String forgetPass = "auth/forget-password";
  static String changePass = "auth/change-password";
  static String restPass = "auth/reset-password";
  static String updateUserData = "auth/update";
  static String vertfyOtp = "auth/verify-number";
  static String favourit = "favorite";
  static String vendor = "vendor";
  static String favouritToggel = "favorite/toggle";
  static String contactUs = "/customer-message";
  static String contactUsGetPhone = "/app-settings";
  static String booking = "booking";
  static String ads = "user/ad";
  static String logout = "auth/logout";
  static String notification = "notification";
  static String verifynumber = "auth/verify-number";
  static String uploadMultiple = "upload-multiple";
  static String addAd = "user/ad";
  static String adFees = "ad-fees";
  static String media = "media";
  static String setting = "settings";
  // static String deleteAd = "user/ad";
  static String cmsPage(slug) => "page/$slug";

  static String adsByCategory(categoryId, type, search) =>
      "ads?category=$categoryId&type=$type&search=$search";
  static String adsById(id) => "user/ad/$id";
  static String adsUserById(id) => "user/ad/$id";
  static String updateGalleryById(uid) => "user/ad/$uid/gallery";
  static String updateAdById(id) => "user/ad/$id/update";
  static String bookingByUid(uid) => "user/ad/?status=$uid";
  static String deleteAd(id) => "user/ad/$id";
  static String addFees(uid) => "user/ad/$uid/fee";
  static String services(uid) => "vendor/$uid/services";
  static String employees(uid) => "vendor/$uid/employee-slots";
  static String servicesDiscounts(uid) => "vendor/$uid/discounts";
  static String deleteNoification(uid) => "notification/$uid";
  static String getRate(uid) => "vendor/$uid/ratings";
  static String deleteMedia(String media) => "media/$media";
}
