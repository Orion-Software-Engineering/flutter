# Orion Meet Mobile App
Built with ❤️ and Flutter

To test the build with full functionality one must be signed in
You'd want to set the initialRoute in main.dart to do that

###Pages within the application with complete business logic for backend functionality;
  1. Login Page

    -The Login page takes username and password

    -Username field accepts alphanumeric characters excluding the space character and validates on submit.The username
        is taking by a text form field.

    -Password field accepts all characters including the space character and validates on submit. The password is taken
        by a custom password field.

    -LOGIN button is of elevated button type and validates the input fields as well as make and api post request that
        verifies if the user exists or the account is verified and logs user in. It calls the LoginAPIService class

    -Forgot password link routes to Forgot Password page

    -Sign up link routes to Sign Up page

    -Picture icons link to other means of signing in

  2. Sign Up Pages

    -The signup pages consist of the personal details page and 3 interest pages

    -The sign up page has the following fields: username,email,password,confirm password, date of birth and gender selection

    -Username field accepts alphanumeric characters excluding the space character and validates on submit.The username
     is taking by a text form field.

    -Email field accepts only inputs in email format with no trailing spaces. Validates on submit.

    -Password field accepts all characters including the space character and must be at least 8 characters long and validates on submit. The password is taken
     by a custom password field.

    -Confirm password field accepts the same input as password field and must match password field. Validates on submit.

    -Date of birth field displays a date picker from which the user selects date of birth which must not result in an age less than 18. Validates on submit

    -Gender selection field offers the option of male or female and passes a boolean value, true for male and false for female.

    -SIGN UP button validates all input fields and makes an api post request that checks if the username or email is already in use and register a user.
        It calls the SignUpAPIService class

    -Login link routes to the Sign In page

  3. Home Page
  4. Forgot Password Page
  5. Messaging Pages
  6. Chat Room Page
  7. Events Page
  8. Settings Pages
  9. Profile Pages

  
###Components and special classes implemented;
  1. Chat tile class
  2. Custom password field
  3. Progress popup
  4. LoginAPIService class and Login models
  5. SignUpAPIService class and Sign up models
  6. InterestAPIService class and Interest models
  7. LocationAPIService class and Location models
  8. ForgotPasswordAPIService class Password models
  9. MessageAPIService class and Message models
  10. ProfileAPIService class and Profile models
  11. ConversationAPIService class and Conversation models
  
😉
