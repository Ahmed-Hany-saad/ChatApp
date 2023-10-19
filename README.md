<h1>Flutter Chat App</h1>

<p>This is a Flutter chat application with three main pages: Login, Register, and Chat. The app allows users to log in, register, and communicate with others in a chat room. The user's data is securely stored in Firebase Authentication, and the chat messages are stored in Firestore.</p>

<h2>Features</h2>

<h3>Login Page</h3>

<p>The Login page allows users to enter their email and password to log in. It includes the following elements:</p>

<ul>
  <li>Email text form field</li>
  <li>Password text form field</li>
  <li>Login button</li>
  <li>Register button (for users who don't have an account)</li>
</ul>

<p>Upon submitting the login credentials, the app performs the following checks:</p>

<ul>
  <li>If the email entered is not registered, a snackbar message appears, notifying the user with "User not found."</li>
  <li>If the email is found but the password is incorrect, a snackbar message appears, notifying the user with "Wrong password."</li>
  <li>If the email and password are correct, a snackbar message appears, notifying the user with "Login has been completed successfully," and the user is redirected to the Chat page.</li>
</ul>

<h3>Register Page</h3>

<p>The Register page allows users to create a new account by providing their email and password. It includes the following elements:</p>

<ul>
  <li>Email text form field</li>
  <li>Password text form field</li>
  <li>Register button</li>
  <li>Login button (for users who already have an account)</li>
</ul>

<p>Upon submitting the registration details, the app performs the following checks:</p>

<ul>
  <li>If an invalid email is entered, a snackbar message appears, notifying the user with "An error occurred during registration."</li>
  <li>If the email is already in use, a snackbar message appears, notifying the user with "Email already in use."</li>
  <li>If a weak password is entered, a snackbar message appears, notifying the user with "Weak password."</li>
  <li>If a valid email and password are entered, a snackbar message appears, notifying the user with "Registration has been completed successfully." The user is then redirected to the Chat page, and their registration data is saved in Firebase Authentication for future logins.</li>
</ul>

<h3>Chat Page</h3>

<p>The Chat page allows users to send and receive messages in a stylized format. If the user closes the app and reopens it, they will find their previous messages retrieved from the Firestore database.</p>

<h2>Getting Started</h2>

<p>To run this application locally, follow these steps:</p>

<ol>
  <li>Clone this repository.</li>
  <li>Ensure you have Flutter and Dart installed on your machine.</li>
  <li>Set up Firebase Authentication and Firestore for your project.</li>
  <li>Replace the necessary Firebase configuration files in the project.</li>
  <li>Run <code>flutter pub get</code> to fetch the required dependencies.</li>
  <li>Connect your device/emulator and run <code>flutter run</code> to launch the app.</li>
</ol>

<h2>Dependencies</h2>

<p>This project uses the following dependencies:</p>

<ul>
  <li><code>firebase_auth: ^4.6.3</code> - Provides Firebase authentication services for user login and registration.</li>
  <li><code>flutter: sdk: flutter</code> - The Flutter SDK.</li>
  <li><code>cupertino_icons: ^1.0.2</code> - Provides the Cupertino icons used in the app's UI.</li>
  <li><code>firebase_core: ^2.14.0</code> - Provides the core functionality for Firebase integration in Flutter.</li>
  <li><code>modal_progress_hud_nsn: ^0.4.0</code> - Displays a modal progress indicator during login and registration processes.</li>
  <li><code>cloud_firestore: ^4.8.2</code> - Enables integration with Firestore for storing and retrieving chat messages.</li>
</ul>

<h2>Conclusion</h2>

<p>This Flutter chat app provides a simple and intuitive user interface for logging in, registering, and engaging in chat conversations. It leverages Firebase Authentication for secure user authentication and Firestore for storing chat messages. Feel free to explore and customize the code to fit your requirements.</p>

<p>Happy chatting!</p>
