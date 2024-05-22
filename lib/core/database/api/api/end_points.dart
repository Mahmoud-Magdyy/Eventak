class EndPoint {
  static const String baseUrl = 'https://eventak-1.onrender.com/';
  static const String userSignIn = 'auth/signin';
  static const String userSignUp = 'auth/signup';
  static const String userSendCode = 'auth/forgetcode';
  static const String userResetPassword = 'auth/resetPassword/';
  static const String createEvent = 'event/createEvent';
  static const String receviedCode = 'auth/compareCode/';
  static const String getAllEvents = 'event/getAllEvents?category=Music';
  static const String addToFavourite = 'event/favouriteEvent/';
  static const String removeFromFavourite = 'event/deleteFavourite/';
  static const String getTrendigEvents = 'event/trendingEvents';
  static const String sendPhotosOfEvent = 'event/photosOfPlace/';
  static const String getMyCreatedEvents = 'event/getAllCreated';
  static const String deleteEvent = 'event/deleteEvents/';
  static const String getProfile = 'auth/getUserData';
  static const String logOut = 'auth/signOut';
  static const String addRegister = 'event/register/';
  static const String model = 'event/model';
  static const String getRegisterEvents = 'register/getRegEvents';
  static const String getUsers = 'register/getRequestes/';
  static const String acceptRequest = 'register/acceptApproval/';
  static const String declineRequest = 'register/rejectApproval/';

  static String recevedCodeEndPoints(id) {
    return '$receviedCode$id';
  }

  static String acceptRequestEndPoints(id, nameOfEvent) {
    return '$acceptRequest$id/$nameOfEvent';
  }

  static String declineRequestEndPoints(id, nameOfEvent) {
    return '$declineRequest$id/$nameOfEvent';
  }

  static String addRegisterEndPoints(nameOfEvent) {
    return '$addRegister$nameOfEvent';
  }

  static String getUsersEndPoints(nameOfEvent) {
    return '$getUsers$nameOfEvent';
  }

  static String deleteEventEndPoints(id) {
    return '$deleteEvent$id';
  }

  static String removeFromFavouriteEndPoints(id) {
    return '$removeFromFavourite$id';
  }

  static String addToFavouriteEndPoints(id) {
    return '$addToFavourite$id';
  }

  static String userResetPasswordEndPoints(id) {
    return '$userResetPassword$id';
  }

  static String getAllEventsEndPoints(category) {
    return '$getAllEvents${'?category=$category'}';
  }

  // static String getAllChefMeals(id) {
  //   return 'chef/get-chef/$id/meals';
  // }
}

class Apikeys {
  static const String email = 'email';
  static const String craetorPic = 'craetorPic';
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
  static const String posterPicture = 'posterPicture';
  static const String photosOfPlace = 'photosOfPlace';
  static const String firstName = 'firstName';
  static const String lastName = 'lastName';
  static const String profilePic = 'profilePic';
}
