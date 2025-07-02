# LoginStarter JSP Project

A basic JSP-based user authentication system that demonstrates:

- Login page (`login.jsp`)
- Signup page (`signup.jsp`)
- Login validation (`logincheck.jsp`)
- Home page (`home.jsp`) shown after successful login
- Session handling for user authentication

## 🔐 Features
- Simple form-based login and signup
- Session-based user tracking
- Error message for incorrect login

## 🛠️ Technologies Used
- JSP (JavaServer Pages)
- HTML/CSS
- Apache Tomcat (or any servlet container)

## 🧭 How It Works
- `signup.jsp`: User enters new credentials (mock or DB-based storage)
- `login.jsp`: User enters credentials to log in
- `logincheck.jsp`: Verifies credentials and starts session
- `home.jsp`: Displays user-specific content using session attributes
