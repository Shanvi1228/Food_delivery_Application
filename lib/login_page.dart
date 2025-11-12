import 'package:flutter/material.dart';
import 'home_page.dart';

const Color kPrimaryColor = Color(0xFFFDC040);
const double kHorizontalPadding = 30.0;

class login extends StatefulWidget {
  const login({super.key});

  @override
  State<login> createState() => _LoginState();
}

class _LoginState extends State<login> {
  @override
  Widget build(BuildContext context) {
    // We use Builder to get context for the Scaffold and determine screen size
    return Builder(
        builder: (context) {
          final screenHeight = MediaQuery.of(context).size.height;

          return Scaffold(
            body: SingleChildScrollView(
              child: Stack(
                children: [
                  // 2. Colored Header Background
                  Container(
                    height: screenHeight * 0.3, // Header takes 30% of screen height
                    width: double.infinity,
                    color: kPrimaryColor,
                    alignment: Alignment.topCenter,
                    padding: const EdgeInsets.only(top: 60),
                    child: const Text(
                        "Log In",
                        style: TextStyle(
                          fontSize: 24,
                          fontWeight: FontWeight.bold,
                          color: Colors.black87, // Header text color
                        )
                    ),
                  ),

                  // 3. White Login Form Card (positioned over the header)
                  Container(
                    width: double.infinity,
                    margin: EdgeInsets.only(top: screenHeight * 0.25), // Starts slightly over header
                    padding: const EdgeInsets.symmetric(
                      horizontal: kHorizontalPadding,
                      vertical: 30.0,
                    ),
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      // Rounded top corners to match the design
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30.0),
                        topRight: Radius.circular(30.0),
                      ),
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        // Welcome Text Block
                        const Text(
                          "Welcome",
                          style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        const Text(
                          "Login or sign up to order food.",
                          style: TextStyle(fontSize: 14, color: Colors.grey),
                        ),

                        const SizedBox(height: 40),

                        // Email/Mobile Field
                        const Text("Email or Mobile Number", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        _StyledTextField(labelText: "example@example.com"),

                        const SizedBox(height: 20),

                        // Password Field
                        const Text("Password", style: TextStyle(fontWeight: FontWeight.w600)),
                        const SizedBox(height: 8),
                        _StyledTextField(
                          labelText: "Password",
                          isPassword: true,
                          // Add Forgot Password link
                          suffixWidget: TextButton(
                            onPressed: (){},
                            child: Text("Forgot Password", style: TextStyle(color: Colors.red[400], fontSize: 12)),
                          ),
                        ),

                        const SizedBox(height: 40),

                        // Login Button
                        SizedBox(
                          width: double.infinity,
                          height: 55,
                          child: ElevatedButton(
                            onPressed: () {
                              Navigator.push(context, MaterialPageRoute(builder: (context) => FoodAppHome()),
                              );
                              },
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kPrimaryColor,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(15.0),
                              ),
                              elevation: 0,
                            ),
                            child: const Text(
                              "Log In",
                              style: TextStyle(fontSize: 18, color: Colors.black87, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),

                        const SizedBox(height: 30),

                        // Social Login and Sign Up link
                        Center(
                          child: Column(
                            children: [
                              const Text("or sign up with"),
                              const SizedBox(height: 15),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  // Placeholder for social icons (Google, Facebook, etc.)
                                  IconButton(onPressed: (){}, icon: const Icon(Icons.facebook, size: 30, color: Colors.blue)),
                                  IconButton(onPressed: (){}, icon: Image.asset('assets/google.png', height: 30)), // Use actual asset
                                ],
                              ),
                              const SizedBox(height: 20),
                              TextButton(
                                onPressed: () {},
                                child: Text(
                                  "Don't have an account? Sign Up",
                                  style: TextStyle(color: kPrimaryColor, fontWeight: FontWeight.bold),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          );
        }
    );
  }
}

// Custom widget for the styled TextFormFields
class _StyledTextField extends StatelessWidget {
  final String labelText;
  final bool isPassword;
  final Widget? suffixWidget;

  const _StyledTextField({
    required this.labelText,
    this.isPassword = false,
    this.suffixWidget,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      obscureText: isPassword,
      decoration: InputDecoration(
        hintText: labelText,
        // The background color of the text field
        fillColor: const Color(0xFFFFF0D0), // A very light cream/yellow
        filled: true,
        contentPadding: const EdgeInsets.symmetric(vertical: 15.0, horizontal: 15.0),
        // Removes the border completely
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: BorderSide.none,
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15.0),
          borderSide: const BorderSide(color: kPrimaryColor, width: 2.0),
        ),
        // Places the Forgot Password link
        suffixIcon: suffixWidget != null
            ? Padding(
          padding: const EdgeInsets.only(right: 8.0),
          child: suffixWidget,
        )
            : null,
        suffixIconConstraints: const BoxConstraints(minWidth: 0, minHeight: 0),
      ),
    );
  }
}