# Orion Meet Mobile App
Built with ❤ and Flutter


To test the build with full functionality one must be signed in.

You'd want to set the initialRoute in main.dart to do that.

## Pages within the application with complete business logic for backend functionality;
  1. Login Page
  2. Sign Up Pages
  3. Forgot Password Page 
  4. Home Page
  5. Chat Page
  6. Chat Room Page
  7. Events Pages
  8. Settings Pages
  9. Profile Page
  
### Login Page
  <img src="https://user-images.githubusercontent.com/80262558/186311100-b2880f07-2a2c-4949-a808-ca157b29f910.jpg" width="216" height="480">


    -The Login page takes username and password.

    -Username field accepts alphanumeric characters excluding the space character and validates on submit.The username
        is taken by a text form field.

    -Password field accepts all characters including the space character and validates on submit. The password is taken
        by a custom password field.

    -LOGIN button is of elevated button type and validates the input fields as well as make an api post request that
        verifies if the user exists or the account is verified and logs user in. It calls the LoginAPIService class.

    -Forgot password link routes to Forgot Password page.

    -Sign up link routes to Sign Up page.

    -Picture icons link to other means of signing in.

### Sign Up Pages
<p float="left">
  <img src="https://user-images.githubusercontent.com/80262558/186315587-035f9d74-d5af-4ac0-808f-e95cb49f0ebd.jpg" width="216" height="480" />
  <img src="https://user-images.githubusercontent.com/80262558/186313290-8b085912-5aa0-472d-86fc-2d091c2b7c35.jpg" width="216" height="480" /> 
  <img src="https://user-images.githubusercontent.com/80262558/186313320-21385c43-c130-41d4-8851-1e0373cd07d4.jpg" width="216" height="480" />
  <img src="https://user-images.githubusercontent.com/80262558/186313369-c697c452-c73f-4ab1-a359-46ea9aed1500.jpg" width="216" height="480" />
</p>

    -The signup pages consist of the personal details page and 3 interest pages.

    -The sign up page has the following fields: username,email,password,confirm password, date of birth and gender selection.

    -Username field accepts alphanumeric characters excluding the space character and validates on submit.The username
     is taken by a text form field.

    -Email field accepts only inputs in email format with no trailing spaces. Validates on submit.

    -Password field accepts all characters including the space character and must be at least 8 characters long and validates on submit. The password is taken
     by a custom password field.

    -Confirm password field accepts the same input as password field and must match password field. Validates on submit.

    -Date of birth field displays a date picker from which the user selects date of birth which must not result in an age less than 18. Validates on submit.

    -Gender selection field offers the option of male or female and passes a boolean value; true for male and false for female.

    -SIGN UP button is of type Elevated button and validates all input fields and makes an api post request that checks if the username or email is already in use and          registers a user.It calls the SignUpAPIService class.
    
    -Login link routes to the Sign In page.

    -The Interest pages have 5 options per screen with each option selection being toggleable.

    -Each page except the last has a "Next-->" link which routes to the next page and each page except the first has a link "<--Back" routing to the previous page.

    -The 3rd and final page has a "Done" link which checks if the user has selected at least 3 interests. Failure to do so results in a prompt and success calls
        the InterestAPIService class which makes an api post request to store the users interests. 

    -All 3 interest pages have a "Skip now-->" link at the bottom that allows the user to skip the other pages if 3 interests have been selected and 
        complete the sign up process.

### Forgot Password Page
  <p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/186320691-f76eb2ae-ba2f-4096-a20f-f184ac9f53d8.jpg" width="216" height="480">
</p>

    -Forgot password page has takes only an email as input.

    -Email field accepts only inputs in email format with no trailing spaces. Validates on submit.

    -The SUBMIT button is of Elevated button type and validates the input field as well as make and api post request that
      allows a reset password link to be sent to the provided email. It calls the ForgotPasswordAPIService.
      
### Home Page
  <p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/192906949-902eec77-7cd1-4b30-a7aa-2eaee5b629b9.jpg" width="216" height="480">
<img src="https://user-images.githubusercontent.com/80262558/192906956-6e4f8c67-ceaf-451f-9a02-f9e01f4f8307.jpg" width="216" height="480">
</p>

    -Home page has asks the user for location permission and if permission is granted, passes the information to an api using LocationAPIService class and Location models. 
    
    -Based on the permissions allowed the user is presented with matches based on common interests of based on location in order of increasing proximity.

    -A match is created by starting a conversation with the matched user. A matched user is taking out of the matches list.
    

### Chat Page
  <p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/192909631-4fd81439-d92d-410a-a6ad-bf0f1df7665b.jpg" width="216" height="480">
<img src="https://user-images.githubusercontent.com/80262558/192909643-dfb26db7-67d4-4042-a79f-bd5923456fb2.jpg" width="216" height="480">
</p>

    -The Chat page loads and displays the conversations a user has with another user by making use of the MessageAPIService. 
    
### Chat Room Page
  <p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/192906949-902eec77-7cd1-4b30-a7aa-2eaee5b629b9.jpg" width="216" height="480">
<img src="https://user-images.githubusercontent.com/80262558/192906956-6e4f8c67-ceaf-451f-9a02-f9e01f4f8307.jpg" width="216" height="480">
</p>

    -The Chat Room Page loads and displays all conversations of a user by making use of APIServiceConversation class and Conversation models. 
    
    -An absence of any conversations implies no matches. The sending and receiving of a message is recorded as a match and the math is taken out of the matches list.

### Events Pages
<p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/192985680-8ab8a9cf-e1d0-41e0-afe7-3b3a3f6c32d4.jpg" width="216" height="480">
<img src="https://user-images.githubusercontent.com/80262558/192985804-1ebec70d-32f3-40e4-9660-a5796d1511fc.jpg" width="216" height="480">
  <img src="https://user-images.githubusercontent.com/80262558/192985856-f1b24cd8-c477-4303-82ff-136b0851063b.jpg" width="216" height="480">
<img src="https://user-images.githubusercontent.com/80262558/192986042-4257bc4b-9496-4ccd-b6ee-6e29c5e8325a.jpg" width="216" height="480">
</p>
 
    -The Events List Page shows to a user the events happening around them. Events are categorized in sync with interests. A user is more likely to see events that match their active interests on this page.

    -The Events details page displays the details of events which includes the event name, date & time, venue, ticketing, age restrictions, description, organizers, MCs and special guests.

    -Events list keep updating and a user might not see an event they had interest in anymore. Events can be saved to mitigate this situation from a user's experience with the events feature.
  
    -On click of the 'save' button an event is saved onto this page to be accessed anytime by the user until application cache is wiped.


### Settings Pages
  <p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/192990700-fdf58d83-3688-4058-b126-34841ad6262b.jpg" width="216" height="480">
  <img src="https://user-images.githubusercontent.com/80262558/192990792-194dfca0-ff7f-43be-9a98-cc7028eadbea.jpg" width="216" height="480">
  <img src="https://user-images.githubusercontent.com/80262558/192990901-df227273-12b8-472c-95fc-8155439f4212.jpg" width="216" height="480">
  <img src="https://user-images.githubusercontent.com/80262558/192990996-2f7c7dd7-3159-4baf-aa91-a440ec7593bf.jpg" width="216" height="480">
</p>

    -The settings page allows a user to change preferences inside the app.
    
    -Account allows the user to include and edit bio and also exclude and include interests. Excluding all interests results in no matches.

    -Privacy gives the user the ability to enable and disable location based matching and also view the Privacy Policy of Orion Meet.

    -Theme allows the user to vary the app theme by choosing among the options, Light, Dark and System.  
    
    -About routes the user to the About page of Orion Meet.
    
    -Contact Support routes the user to the contact page of Orion Meet.
    
    -Logout allows the user to logout of the app but maintain the account
    
    -Delete Account allows the user to delete account and clear all preferences and credentials.
    
 ### Profile Page
  <p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/192991432-2bcbd6cf-5964-48ea-8ca8-a8a0e9440db0.jpg" width="216" height="480">
</p>

    -The profile page allows the user to view his or her account details and a limited amount of the account details of other users .
    
    -A user may include and edit bio on the profile page and also edit interests.
    
    -A user cannot edit the profile of another user.

  

## Components and special classes implemented;
  1. Custom password field
  2. Progress popup
  3. LoginAPIService class and Login models
  4. SignUpAPIService class and Sign up models
  5. InterestAPIService class and Interest models
  6. LocationAPIService class and Location models
  7. ForgotPasswordAPIService class Password models
  8. MessageAPIService class and Message models
  9. ProfileAPIService class and Profile models
  10. APIServiceConversation class and Conversation models

### Custom Password Field
    -The custom password field extends the stateful widget and has the following required parameteres: hint text and validation function.
    
    -It makes use of a TextFormField widget. The text form field has osbcureText set to true on default. It also has a suffix Icon button for the toggling the visibility of the field text.
    
### Progress popup

    -Progress popup contains a Progress class which has a child widget.
    
    -The widget returns a stack which contains an Opacity widget containing a ModalBarrier. It also contains a CircularProgressIndicator.
    
    -The ModalBarrier blocks user interaction until it is dismissed. The opacity of 0.3 puts the current user oage in the background of the ModalBarrier letting the user know they cannot interact with the app and that some processing is being done.
    
    -The CircularProgressIndicator is an indication of a loading process.
    
    -The widget has a boolean value. When set to true by a usage of the widget then the ModalBarrier and CircularProgressIndicator pops up on the screen.
     
### LoginAPIService class and Login models

    -There are two login model classes; LoginResponseModel and LoginRequestModel.
    -The LoginResponseModel returns an object of type LoginResponseModel which contains the response body as a token.
    -The LoginRequestModel has 2 string fields,username and password.
    -It creates and returns a json map of the fields.
    -The LoginAPIService class is an asynchronous class which send a post request body of type LoginRequestModel and returns a response of type LoginResponseModel if there was no error in making the request. The response body has the following status codes and associated meanings.
      -200: "Login Successful"
      -403: "Your account is not verified. Please check your email"
      -404: "Incorrect username or password"
    -Any other response throws an exception.
    -The user's Id is saved after login using the class's saveUserIdAfterLogin method which saves the user's Id to SharedPreferences.
    
 ### SignUpAPIService class and Sign up models
 
    -There are two sign up model classes; SignupResponseModel and SignupRequestModel.
    -The SignupResponseModel returns an object of type SignupResponseModel which contains the response body as a token
    -The SignupRequestModel has 4 string fields;username,email,password and dob.
    -It creates and returns a json map of the fields.
    -The SignUpAPIService class is an asynchronous class which send a post request body of type SignupRequestModel and returns a response of type SignupResponseModel if there was no error in making the request. The response body has the following status codes and associated meanings.
      -201: "User registered successfully"
      -400: This status code may result in one of 2 messages.
          "Email already in use" or "Username already in use"
    -Any other response throws an exception.
    
### InterestAPIService class and Interest models

    -There are two interest model classes; InterestResponseModel and InterestResponseModel.
    -The InterestResponseModel returns an object of type InterestResponseModel which contains the response body as a token.
    -It creates and returns a json map of the field.
    -The InterestAPIService class is an asynchronous class which send a post request body of type InterestRequestModel and returns a response of type InterestResponseModel if there was no error in making the request. The response body has the following status codes and associated meanings.
      -200: shows that post request was successful
    -Any other response throws an exception.
   

### LocationAPIService class and Location models

    -There are two location model classes; LocationResponseModel and LocationPostModel.
    -The LocationResponseModel returns an object of type LocationResponseModel which contains the response body as a token.
    -The LocationPostModel has 3 string fields,userID,latitude and longitude.
    -It creates and returns a json map of the fields.
    -The LocationAPIService class is an asynchronous class which send a post request body of type LocationPostModel and returns a response of type LocationResponseModel if there was no error in making the request. The response body has the following status codes and associated meanings.
      -200: shows that post request was successful
    -Any other response throws an exception.
    
### ForgotPasswordAPIService class Password models

    -There are two forgot password model classes; ForgotPasswordResponseModel and ForgotPasswordRequestModel.
    -The ForgotPasswordResponseModel returns an object of type ForgotPasswordResponseModel which contains the response body as a token.
    -The ForgotPasswordRequestModel has a single string field,email.
    -It creates and returns a json map of the field.
    -The ForgotPasswordAPIService class is an asynchronous class which send a post request body of type ForgotPasswordRequestModel and returns a response of type ForgotPasswordResponseModel if there was no error in making the request. The response body has the following status codes and associated meanings.
      -200: shows that post request was successful
    -Any other response throws an exception.
    
### MessageAPIService class and Message models

    -There are three Message models.  
    -The 'Message' class has four string fields messageId,userId,text and createdAt.It also has a boolean field messageIsFromMe.
    -The 'MessageToBeSent' class has three strings,messageText,userId and conversationId.
    -The 'MessageToBeDeleted' class has a single string field,messageId.
    -The MessageAPIService class is an asynchronous class which sends a get request. It can get messages of a conversation using its Future getMessagesOfConversation(String conversationId) function, send a message using Future sendMessage(MessageToBeSent messageToBeSent, String userId) function and delete messages using Future deleteMessage(MessageToBeDeleted messageToBeDeleted).
      -200: shows that get request was successful
    -Any other response throws an exception.

### ProfileAPIService class and Profile models

    -There are two Profile models.  
    -The 'ProfileResponseModel' class has six string fields id, email, isEmailVerified, username, dateOfBirth and bio.It also has a boolean field gender. It has a list string field called interests.
    -The 'UpdateBioRequestModel' class has two strings,userId and bio. It aslo returns a json map of strings.
    -The ProfileApiService class is an asynchronous class which sends a get request. It can get profile of a user using its Future<void> getProfile(String userId) function, update the user bio using Future<void> updateBio(String text) function,add interests using Future<void> addInterests(List<String> interestsToAdd) and delete interests using Future<void> deleteInterests(List<String> interestsToDelete).
      -200: shows that get request was successful
    -Any other response throws an exception.
    
### APIServiceConversation class and Conversation models

    -There are three Conversation models.  
    -The 'ConversationInfo' class has six string fields conversationId, receiverUsername, receiverUserId, senderUserId, senderUsername and lastMessage.It also has a boolean field lastMessageIsMine. It has a list string field called conversationUsers.
    -The 'CreateConversationInfo' class has a single string, userId. It aslo returns a json map of strings to dynamic.
    -The 'AddUserToConversationRequest' class has a single string, userId. It aslo returns a json map of strings.
    -The APIServiceConversation class is an asynchronous class which sends a get request. It can get conversation of a user using its Future getConversationsOfUser(), create a conversation using Future<void> createConversation(
      String userIdOfMatch, String usernameOfMatch),add a user to a conversation using Future<void> addUserToConversation(
      String userId, String conversationId).
      -200: shows that get request was successful
    -Any other response throws an exception.
😉

