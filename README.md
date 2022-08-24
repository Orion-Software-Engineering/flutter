# Orion Meet Mobile App
Built with ❤️ and Flutter


To test the build with full functionality one must be signed in

You'd want to set the initialRoute in main.dart to do that

## Pages within the application with complete business logic for backend functionality;
  1. Login Page
  2. Sign Up Pages
  3. Forgot Password Page 
  4. Home Page
  5. Messaging Pages
  6. Chat Room Page
  7. Events Page
  8. Settings Pages
  9. Profile Pages
  
### Login Page
  <img src="https://user-images.githubusercontent.com/80262558/186311100-b2880f07-2a2c-4949-a808-ca157b29f910.jpg" width="216" height="480">


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

### Sign Up Pages
<p float="left">
  <img src="https://user-images.githubusercontent.com/80262558/186315587-035f9d74-d5af-4ac0-808f-e95cb49f0ebd.jpg" width="216" height="480" />
  <img src="https://user-images.githubusercontent.com/80262558/186313290-8b085912-5aa0-472d-86fc-2d091c2b7c35.jpg" width="216" height="480" /> 
  <img src="https://user-images.githubusercontent.com/80262558/186313320-21385c43-c130-41d4-8851-1e0373cd07d4.jpg" width="216" height="480" />
  <img src="https://user-images.githubusercontent.com/80262558/186313369-c697c452-c73f-4ab1-a359-46ea9aed1500.jpg" width="216" height="480" />
</p>

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

    -The Interest pages have 5 options per screen with each option selection being toggleable

    -Each page except the last has a Next--> link which routes to the next page and each page except the first has a link <--Back routing to the previous page

    -The 3rd and final page has a Done link which checks if the user has selected at least 3 interests. Failure to do so results in a prompt and success calls
        the InterestAPIService class which makes an api post request to store the users interests. 

    -All 3 interest pages have a Skip now--> link at the bottom that allows the user to skip the other pages if 3 interests have been selected and 
        complete the sign up process.

### Forgot Password Page
  <p float="left">
   <img src="https://user-images.githubusercontent.com/80262558/186320691-f76eb2ae-ba2f-4096-a20f-f184ac9f53d8.jpg" width="216" height="480">
</p>

    -Forgot password page has takes only an email as input

    -Email field accepts only inputs in email format with no trailing spaces. Validates on submit

    -The SUBMIT button is of elevated button type and validates the input field as well as make and api post request that
      allows a reset password link to be sent to the provided link. It calls the ForgotPasswordAPIService
 

  

### Components and special classes implemented;
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
