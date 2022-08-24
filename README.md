# Orion Meet Mobile App
Built with ❤️ and Flutter

To test the build with full functionality one must be signed in
You'd want to set the initialRoute in main.dart to do that

###Pages within the application with complete business logic for backend functionality;
  1. Login Page
    -The Login page takes username and password
    -Username accepts alphanumeric characters excluding the space character and validates on submit.The username
        is taking by a text form field.
    -Password accepts all characters including the space character and validates on submit. The password is taken
        by a custom password field.
    -Submit button is of elevated button type and validates the input fields as well as make and api post request that
        verifies if the user exists or the account is verified. It calls the LoginAPIService class
    -Forgot password link routes to Forgot Password page
    -Sign up link routes to Sign Up page
    -Picture icons link to other means of signing in

  2. Sign Up Pages
    -The signup pages consist of the
  3. Home Page
  4. Forgot Password Page
  5. Messaging Pages
  6. Chat Room Page
  7. Events Page
  8. Settings Pages
  9. Profile Pages

  
###Components and special classes implemented;
  1. LoginAPIService class and Login models
  2. SignUpAPIService class and Sign up models
  3. InterestAPIService class and Interest models
  4. LocationAPIService class and Interest models
  
😉
