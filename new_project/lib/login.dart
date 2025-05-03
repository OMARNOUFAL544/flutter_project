import 'package:flutter/material.dart';
import 'home.dart';

class Login extends StatelessWidget {
  Login({Key? key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية (الصورة)
          Positioned.fill(
            child: Image.asset(
              "images/log.png",
              fit: BoxFit.cover,
            ),
          ),
          // طبقة شفافة لتغميق الخلفية
          Positioned.fill(
            child: Container(
              // color: Colors.black.withOpacity(0.5),
            ),
          ),
          // المحتوى
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Center(
               child: Container(
                  width: 300,
                  padding: const EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    color: const Color.fromARGB(255, 255, 255, 255).withOpacity(0.5),
                    borderRadius: BorderRadius.circular(16),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(0.3),
                        blurRadius: 10,
                        offset: Offset(0, 4),
                      ),
                    ],
                  ),
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      mainAxisSize: MainAxisSize.min,
                
                                      children: [
                        const SizedBox(height: 20),
                       TextFormField(
                          style: TextStyle(color: Colors.black),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the email";
                            }
                            // Simple email pattern validation
                            if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                              return "Enter a valid email address";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: " Enter your email",
                          ),
                        ),
                        
                        const SizedBox(height: 20),
                        TextFormField(
                           style: TextStyle(color: Colors.black),
                           validator: (value) {
                             if (value == null || value.isEmpty) {
                               return "Please enter the password";
                             }
                             if (value.length < 8) {
                               return "Password must be at least 8 characters long";
                             }
                             if (!RegExp(r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$').hasMatch(value)) {
                               return "Password must contain letters and numbers";
                             }
                             return null;
                           },
                           obscureText: true,
                           decoration: const InputDecoration(
                             labelText: " Enter your Password",
                           ),
                         ),
                         
                        const SizedBox(height: 30),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFBA4A), // Example: orange-yellow
                            foregroundColor: Colors.white, // Text color
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print("Login Success");
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomeScreen(),
                                ),
                              );
                            } else {
                              print("Login Failed");
                            }
                          },
                          child: const Text("Login"),
                        ),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
