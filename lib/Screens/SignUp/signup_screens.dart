import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hamropasal/Screens/LoginScreen/login_screens.dart';
import 'package:provider/provider.dart';
import '../../Model/user_model.dart';
import '../../view_models/auth_view_model.dart';
import '../../view_models/global_auth_view_model.dart';
import 'button_hover.dart';

class SignupScreen extends StatefulWidget {
  const SignupScreen({Key? key}) : super(key: key);

  @override
  _SignupScreenState createState() => _SignupScreenState();
}

class _SignupScreenState extends State<SignupScreen> {
  TextEditingController _emailController = TextEditingController();
  TextEditingController _passwordController = TextEditingController();
  TextEditingController _confirmPasswordController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  bool _obscureTextPassword = true;
  bool _obscureTextPasswordConfirm = true;

  late GlobalUIViewModel _ui;
  late AuthViewModel _authViewModel;

  @override
  void initState() {
    _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
    _authViewModel = Provider.of<AuthViewModel>(context, listen: false);
    super.initState();
  }

  void register() async {
    if (_formKey.currentState == null || !_formKey.currentState!.validate()) {
      return;
    }
    _ui.loadState(true);
    try {
      await _authViewModel
          .register(UserModel(
              email: _emailController.text,
              password: _passwordController.text,
              fullname: _nameController.text))
          .then((value) {
        // NotificationService.display(
        //   title: "Welcome to this app",
        //   body: "Hello ${_authViewModel.loggedInUser?.name},\n Thank you for registering in this application.",
        // );
        Navigator.of(context).pushReplacementNamed("/dashboard");
      }).catchError((e) {
        ScaffoldMessenger.of(context)
            .showSnackBar(SnackBar(content: Text(e.message.toString())));
      });
    } catch (err) {
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text(err.toString())));
    }
    _ui.loadState(false);
  }

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade100,
      body: Form(
        key: _formKey,
        child: Center(
          child: SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.all(20),
              child: Column(
                children: [
                  Image.asset(
                    "assets/images/HamroPasal.png",
                    height: 160,
                    width: double.infinity,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _nameController,
                    validator: ValidateSignup.name,
                    keyboardType: TextInputType.name,
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[350],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.person,
                        color: Colors.deepOrange,
                        size: 22.0,
                      ),
                      hintText: 'First Name',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    controller: _emailController,
                    validator: ValidateSignup.emailValidate,
                    keyboardType: TextInputType.emailAddress,
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[350],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.email,
                        color: Colors.deepOrange,
                        size: 22.0,
                      ),
                      hintText: 'Enter email',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: _obscureTextPassword,
                    controller: _passwordController,
                    validator: (String? value) => ValidateSignup.password(
                        value, _confirmPasswordController),
                    keyboardType: TextInputType.text,
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[350],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.deepOrange,
                        size: 22.0,
                      ),
                      suffixIcon: passwordVisibility(),
                      hintText: 'Enter password',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  TextFormField(
                    obscureText: _obscureTextPasswordConfirm,
                    controller: _confirmPasswordController,
                    keyboardType: TextInputType.text,
                    validator: (String? value) =>
                        ValidateSignup.password(value, _passwordController),
                    style: const TextStyle(
                        fontFamily: 'WorkSansSemiBold',
                        fontSize: 16.0,
                        color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      fillColor: Colors.grey[350],
                      enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(20),
                          borderSide: BorderSide.none),
                      prefixIcon: Icon(
                        Icons.lock,
                        color: Colors.deepOrange,
                        size: 22.0,
                      ),
                      suffixIcon: passwordVisibilityConfirm(),
                      hintText: 'Enter confirm password',
                      hintStyle: TextStyle(
                          fontFamily: 'WorkSansSemiBold', fontSize: 17.0),
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Container(
                    width: double.infinity,
                    child: ElevatedButton(
                        style: ButtonStyle(
                          backgroundColor:
                              MaterialStateProperty.all(Colors.deepOrange),
                          shape:
                              MaterialStateProperty.all<RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(20),
                                      side: BorderSide(
                                          color: Colors.orangeAccent))),
                          padding: MaterialStateProperty.all<EdgeInsets>(
                              EdgeInsets.symmetric(vertical: 20)),
                        ),
                        onPressed: () {
                          register();
                        },
                        child: Text(
                          "Sign Up",
                          style: TextStyle(fontSize: 20),
                        )),
                  ),
                  SizedBox(
                    height: 20,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account? ",
                        style: TextStyle(color: Colors.grey.shade800),
                      ),
                      SizedBox(width: 5),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).pop();
                          },
                          child: Text(
                            "Sign in",
                            style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                            ),
                          ))
                    ],
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget passwordVisibility() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        onPressed: () {
          setState(() {
            _obscureTextPassword = !_obscureTextPassword;
          });
        },
        icon: Icon(
          _obscureTextPassword ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      ),
    );
  }

  Widget passwordVisibilityConfirm() {
    return Padding(
      padding: const EdgeInsets.only(right: 10.0),
      child: IconButton(
        onPressed: () {
          setState(() {
            _obscureTextPasswordConfirm = !_obscureTextPasswordConfirm;
          });
        },
        icon: Icon(
          _obscureTextPasswordConfirm ? Icons.visibility : Icons.visibility_off,
          color: Colors.grey,
        ),
      ),
    );
  }
}

class ValidateSignup {
  static String? name(String? value) {
    if (value == null || value.isEmpty) {
      return "Name is required";
    }
    return null;
  }

  static String? emailValidate(String? value) {
    final RegExp emailValid = RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+");
    if (value == null || value.isEmpty) {
      return "Email is required";
    }
    if (!emailValid.hasMatch(value)) {
      return "Please enter a valid email";
    }
    return null;
  }

  static String? password(String? value, TextEditingController otherPassword) {
    if (value == null || value.isEmpty) {
      return "Password is required";
    }
    if (value.length < 8) {
      return "Password should be at least 8 character";
    }
    if (otherPassword.text != value) {
      return "Please make sure both the password are the same";
    }
    return null;
  }
}
//
// class SignupScreen extends StatefulWidget {
//   const SignupScreen({Key? key}) : super(key: key);
//
//   @override
//   State<SignupScreen> createState() => _SignupScreenState();
// }
//
// class _SignupScreenState extends State<SignupScreen> {
//   TextEditingController emailController = TextEditingController();
//   TextEditingController fullNameController = TextEditingController();
//   TextEditingController passwordController = TextEditingController();
//   TextEditingController confirmPasswordController = TextEditingController();
//
//   late GlobalUIViewModel _ui;
//   late AuthViewModel _auth;
//
//   @override
//   void initState() {
//     _ui = Provider.of<GlobalUIViewModel>(context, listen: false);
//     _auth = Provider.of<AuthViewModel>(context, listen: false);
//     super.initState();
//   }
//
//   void register() async {
//     if (formkey.currentState == null || !formkey.currentState!.validate()) {
//       return;
//     }
//     _ui.loadState(true);
//     try {
//       await _auth
//           .register(UserModel(
//               email: emailController.text,
//               password: passwordController.text,
//               fullname: fullNameController.text))
//           .then((value) {
//         Navigator.of(context).pushReplacementNamed("/dashboard");
//       }).catchError((e) {
//         ScaffoldMessenger.of(context)
//             .showSnackBar(SnackBar(content: Text(e.message.toString())));
//       });
//     } catch (err) {
//       ScaffoldMessenger.of(context)
//           .showSnackBar(SnackBar(content: Text(err.toString())));
//     }
//     _ui.loadState(false);
//   }
//
//   final formkey = GlobalKey<FormState>();
//
//   late double _height;
//   late double _width;
//
//   bool isVisible = false;
//
//   Widget passwordVisibility() {
//     return Padding(
//       padding: const EdgeInsets.only(right: 10.0),
//       child: IconButton(
//         onPressed: () {
//           setState(() {
//             isVisible = !isVisible;
//           });
//         },
//         icon: Icon(
//           isVisible ? Icons.visibility : Icons.visibility_off,
//           color: Colors.grey,
//         ),
//       ),
//     );
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     _height = MediaQuery.of(context).size.height;
//     _width = MediaQuery.of(context).size.width;
//     return Scaffold(
//       backgroundColor: Colors.grey.shade100,
//       body: SingleChildScrollView(
//         child: Column(
//           children: <Widget>[
//             logo(),
//             form(),
//             signup(),
//             backToLogin(),
//           ],
//         ),
//       ),
//     );
//   }
//
//   Widget logo() {
//     return Expanded(
//       // flex: 2,
//       child: Container(
//         height: _height * 0.35,
//         child: Image.asset("assets/images/HamroPasal.png"),
//       ),
//     );
//   }
//
//   Widget form() {
//     return Expanded(
//       // flex: 4,
//       child: Container(
//         margin: EdgeInsets.all(20),
//         child: Form(
//           key: formkey,
//           child: Column(
//             children: <Widget>[
//               fullNameTextField(),
//               SizedBox(height: 20.0),
//               emailTextField(),
//               SizedBox(height: 20.0),
//               passwordTextField(),
//               SizedBox(height: 20.0),
//               confirmPasswordTextField(),
//               SizedBox(height: 5.0),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
//
//   Widget fullNameTextField() {
//     return TextFormField(
//       controller: fullNameController,
//       autofocus: true,
//       keyboardType: TextInputType.text,
//       cursorColor: Colors.deepOrange,
//       cursorHeight: 25,
//       decoration: InputDecoration(
//         filled: true,
//         fillColor: Colors.grey[350],
//         prefixIcon: Icon(
//           Icons.person,
//           color: Colors.deepOrange,
//           size: 25,
//         ),
//         hintText: "Enter full name",
//         border: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide.none),
//         focusedBorder: OutlineInputBorder(
//             borderRadius: BorderRadius.circular(30),
//             borderSide: BorderSide(color: Colors.black38)),
//       ),
//       validator: (value) {
//         if (value == null || value.isEmpty) {
//           return "Please enter full name";
//         }
//         return null;
//       },
//     );
//   }
//
//   Widget emailTextField() {
//     return TextFormField(
//         controller: emailController,
//         validator: (value) {
//           if (value != null || value!.isEmpty) {
//             final bool isValid =
//                 EmailValidator.validate(emailController.text.trim());
//             if (!isValid) {
//               return "Invalid email";
//             }
//           }
//         },
//         keyboardType: TextInputType.emailAddress,
//         cursorColor: Colors.deepOrange,
//         cursorHeight: 25,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.grey[350],
//           prefixIcon: Icon(
//             Icons.email_rounded,
//             color: Colors.deepOrange,
//             size: 25,
//           ),
//           hintText: "Enter your email",
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: Colors.black38)),
//         ));
//   }
//
//   Widget passwordTextField() {
//     return TextFormField(
//         controller: passwordController,
//         validator: (PassCurrentValue) {
//           RegExp regex = RegExp(
//               r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$');
//           var passNonNullValue = PassCurrentValue ?? "";
//           if (passNonNullValue.isEmpty) {
//             return ("Password is required");
//           } else if (passNonNullValue.length < 6) {
//             return ("Password Must be more than 5 characters");
//           } else if (!regex.hasMatch(passNonNullValue)) {
//             return ("Password should contain upper,lower,digit and Special character ");
//           }
//           return null;
//         },
//         keyboardType: TextInputType.text,
//         cursorColor: Colors.deepOrange,
//         cursorHeight: 25,
//         obscureText: isVisible ? false : true,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.grey[350],
//           prefixIcon: Icon(
//             Icons.lock,
//             color: Colors.deepOrange,
//             size: 25,
//           ),
//           suffixIcon: passwordVisibility(),
//           hintText: "Enter password",
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: Colors.black38)),
//         ));
//   }
//
//   Widget confirmPasswordTextField() {
//     return TextFormField(
//         controller: confirmPasswordController,
//         validator: (PassCurrentValue) {
//           if (passwordController.text != confirmPasswordController.text) {
//             return "password and confirm password must be same";
//           }
//           return null;
//         },
//         keyboardType: TextInputType.text,
//         cursorColor: Colors.deepOrange,
//         cursorHeight: 25,
//         decoration: InputDecoration(
//           filled: true,
//           fillColor: Colors.grey[350],
//           prefixIcon: Icon(
//             Icons.lock,
//             color: Colors.deepOrange,
//             size: 25,
//           ),
//           suffixIcon: passwordVisibility(),
//           hintText: "Confirm password",
//           border: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide.none),
//           focusedBorder: OutlineInputBorder(
//               borderRadius: BorderRadius.circular(30),
//               borderSide: BorderSide(color: Colors.black38)),
//         ));
//   }
//
//   Widget signup() {
//     return Expanded(
//       child: Container(
//         width: _width / 1.2,
//         margin: EdgeInsets.all(10),
//         child: ButtonOnHover(
//           child: ElevatedButton(
//               style: ElevatedButton.styleFrom(
//                 primary: Colors.deepOrange,
//                 shape: RoundedRectangleBorder(
//                     borderRadius: BorderRadius.circular(30.0)),
//               ),
//               onPressed: () {
//                 register();
//               },
//               child: Padding(
//                 padding: const EdgeInsets.all(18.0),
//                 child: Text(
//                   'Signup',
//                   style: TextStyle(fontSize: 30, fontWeight: FontWeight.bold),
//                 ),
//               )),
//         ),
//       ),
//     );
//   }
//
//   Widget backToLogin() {
//     return RichText(
//         textAlign: TextAlign.start,
//         text: TextSpan(
//             text: 'Already have an account? ',
//             style: TextStyle(color: Colors.black, fontSize: 18),
//             children: <TextSpan>[
//               TextSpan(
//                 text: "Login",
//                 style: const TextStyle(
//                   color: Colors.redAccent,
//                   fontWeight: FontWeight.normal,
//                   fontSize: 18,
//                 ),
//                 recognizer: TapGestureRecognizer()
//                   ..onTap = () {
//                     Navigator.push(
//                       context,
//                       MaterialPageRoute(
//                         builder: (_) => LoginScreens(),
//                       ),
//                     );
//                   },
//               )
//             ]));
//   }
// }
