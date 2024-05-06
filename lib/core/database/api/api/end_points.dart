class EndPoint {
  static const String baseUrl = 'https://eventak.onrender.com/';
  static const String userSignIn = 'auth/signin';
  static const String userSignUp = 'auth/signup';
  static const String userSendCode = 'auth/forgetcode';
  static const String userResetPassword= 'auth/resetPassword/';
  static const String createEvent= 'event/createEvent';
  static const String receviedCode= 'auth/compareCode/';
 

  static String recevedCodeEndPoints(id) {
    return '$receviedCode$id';
  }
  static String userResetPasswordEndPoints(id) {
    return '$userResetPassword$id';
  }

  
  // static String getAllChefMeals(id) {
  //   return 'chef/get-chef/$id/meals';
  // }
}

class Apikeys {
  static const String email = 'email';
  static const String id = 'id';
  static const String password = 'password';
  static const String confirmPassword = 'confirmPassword';
  static const String message = 'message';
  static const String token = 'token';
  static const String userName = 'userName';
  static const String forgetCode = 'forgetCode';
  static const String status = 'status';
  static const String data = 'data';
  static const String numberOfEvents = 'numberOfEvents';
  
  //!create event
  static const String nameOfEvent = 'nameOfEvent';
  static const String description = 'description';
  static const String startTime = 'startTime';
  static const String endTime = 'endTime';
  static const String date = 'date';
  static const String category = 'category';
  static const String priceInAdvance = 'priceInAdvance';
  static const String priceAtTheDoor = 'priceAtTheDoor';
  static const String whatIsIncludedInPrice = 'whatIsIncludedInPrice';
  static const String orgShortDesc = 'orgShortDesc';
  static const String location = 'location';
  static const String nameOfLocation = 'nameOfLocation';
  static const String street = 'street';
  static const String district = 'district';
  

  

}
