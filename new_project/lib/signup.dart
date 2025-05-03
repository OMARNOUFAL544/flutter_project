import 'package:flutter/material.dart';
import 'login.dart';

class Signup extends StatelessWidget {
  Signup({Key? key});

  final GlobalKey<FormState> formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          // الخلفية (الصورة)
          Positioned.fill(
            child: Image.asset(
              "images/sign.png",
              fit: BoxFit.cover,
            ),
          ),
          // طبقة شفافة لتغميق الصورة
          Positioned.fill(
            child: Container(
              // color: Colors.black.withOpacity(0.5),
            ),
          ),
          // محتوى الصفحة
          SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                minHeight: MediaQuery.of(context).size.height,
              ),
              child: Center(
                child: Container(
                   width: 300,
                   padding: const EdgeInsets.all(20.0),
                   decoration: BoxDecoration(
                     color: Colors.white.withOpacity(0.5),
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
                      mainAxisSize: MainAxisSize.min,
                      children: [
                      
                        const SizedBox(height: 20 ),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the first name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "First-Name",
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return "Please enter the last name";
                            }
                            return null;
                          },
                          decoration: const InputDecoration(
                            labelText: "Last-Name",
                          ),
                        ),
                        const SizedBox(height: 10),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
                          validator: (value) {
                             if (value == null || value.isEmpty) {
                               return "Please enter the email";
                             }
                             // Basic email pattern
                             if (!RegExp(r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$').hasMatch(value)) {
                               return "Enter a valid email address";
                             }
                             return null;
                           },
                          decoration: const InputDecoration(
                            labelText: "Email",
                          ),
                        ),
                        const SizedBox(height: 20),
                        TextFormField(
                          style: TextStyle(color: Colors.white),
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
                            labelText: "Password",
                          ),
                        ),
                        const SizedBox(height: 30),
                       ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: Color(0xFFFFBA4A), // Orange-yellow
                            foregroundColor: Colors.white,
                            padding: EdgeInsets.symmetric(horizontal: 32, vertical: 12),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {
                            if (formKey.currentState!.validate()) {
                              print("Sign Success");
                              Navigator.push(
                                context,
                                MaterialPageRoute(builder: (context) => Login()),
                              );
                            } else {
                              print("Sign Failed");
                            }
                          },
                          child: const Text("Sign Up"),
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
