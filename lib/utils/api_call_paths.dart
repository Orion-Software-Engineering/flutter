// uri data
const String scheme = "https";
const String host = "orion-meet-testing.herokuapp.com";

const Map<String, String> headers = {
  'Content-type': 'application/json',
  'Accept': 'application/json',
};

// login and signup
const String logInPath = "/api/auth/signin";
const String signUpPath = "/api/auth/signup";
const String interestPath = "/api/interest/";
const String forgotPasswordPath = "/api/resetPassword";
const String deleteAccountPath = "/api/account/delete";

// profile
const String profilePath = "/api/user/profile/";
const String updateBioPath = "/api/user/bio";

//location
const String locationPath = "/api/user/location";

//conversation
const String getConversationsPath = "/api/conversation/user/all/";
const String getUsersOfAllConversationsPath = "/api/conversation/users/all/";
const String createConversationPath = "/api/conversation/";
const String addUserToConversationPath = "/api/conversation/user";

//messages
const String getMessagesOfConversationPath = "/api/messages/";
const String eventsPath = "/api/events/";
const String sendMessagePath = "/api/message/";
const String deleteMessagePath = "/api/message";
const String getLastMessagePath = "/api/message/last/";

//matching
const String getInterestBasedMatchesPath = "/api/test/matches/";
const String getLocationBasedMatchesPath = "/api/test/match/location/";

//liking_events
const String likeEventPath = "/api/event/like";
const String getEventLikesPath = 'api/event/likes/';
const String unlikeEventPath = 'api/event/unlike/';
