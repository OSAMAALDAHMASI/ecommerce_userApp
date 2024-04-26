class AppApiLink {
  // static const String serverLink ="https://schizogenous-compre.000webhostapp.com/ecommerce";
  // static const String serverLink ="https://osamaqahtann.helioho.st/ecommerce";
  static const String serverLink = "https://osamaecommerce.helioho.st/ecommerce";

  //----
  static const String test = "$serverLink/test.php";

  //--- images Api---------
  static const String imagePathLink = "$serverLink/upload";
  static const String imagesCategories = "$imagePathLink/categories";
  static const String imagesItems = "$imagePathLink/items";

  //--- Auth Api---------
  static const String signUp = "$serverLink/auth/signUp.php";
  static const String verfiyCodeSignUp = "$serverLink/auth/verifyCodeSignUp.php";
  static const String login = "$serverLink/auth/login.php";

  //--- forget password---------
  static const String verifyCodeForgetPassword = "$serverLink/auth/forgetPassword/verifyCodeForgetPassword.php";
  static const String checkEmail = "$serverLink/auth/forgetPassword/checkEmail.php";
  static const String resetPassword = "$serverLink/auth/forgetPassword/resetPassword.php";

  //--- Home Page---------
  static const String homePage = "$serverLink/homePage.php";
//--- Items Page---------
  static const String items = "$serverLink/items/items.php";
  static const String search = "$serverLink/items/search.php";
  //--- Favorite---------
  static const String favoriteAdd = "$serverLink/favorite/add.php";
  static const String favoriteDelete = "$serverLink/favorite/delete.php";
  static const String favoriteView = "$serverLink/favorite/view.php";
  static const String deleteFromFavoritePage = "$serverLink/favorite/deleteFromFavoritePage.php";
  //--- Cart---------
  static const String cartDelete = "$serverLink/cart/delete.php";
  static const String cartAdd = "$serverLink/cart/add.php";
  static const String cartView = "$serverLink/cart/view.php";
  static const String itemsCounter = "$serverLink/cart/itemsCounter.php";
  //--- coupon---------
  static const String checkCoupon = "$serverLink/coupons/checkCoupon.php";

//--- address---------
  static const String addressDelete = "$serverLink/address/delete.php";
  static const String addressAdd = "$serverLink/address/add.php";
  static const String addressView = "$serverLink/address/view.php";
  static const String addressEdite = "$serverLink/address/edite.php";

//--- order---------
  static const String checkout = "$serverLink/order/checkout.php";
  static const String pendingOrder = "$serverLink/order/pending.php";
  static const String detailsOrder = "$serverLink/order/detailsView.php";
  static const String deleteOrder = "$serverLink/order/delete.php";
  static const String archive = "$serverLink/order/archive.php";


//--- Notifications---------
  static const String notificationView = "$serverLink/notification.php";
  //--- offers---------
  static const String offers = "$serverLink/offers.php";
}

