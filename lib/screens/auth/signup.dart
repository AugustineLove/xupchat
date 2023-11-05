import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xup_chat/screens/auth/verify_email.dart';
import 'package:xup_chat/widgets/customebuttom.dart';

class SignUpPage extends StatefulWidget {
  const SignUpPage({super.key});

  @override
  State<SignUpPage> createState() => _SignUpPageState();
}

class _SignUpPageState extends State<SignUpPage> {
  final _formKey = GlobalKey<FormState>();
  final _fullnameController = TextEditingController();
  final _usernameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmpasswordController = TextEditingController();

   RegExp passValid = RegExp(r"(?=.*\d)(?=.*[a-z])(?=.*[A-Z])(?=.*\W)");

   bool validatePassword(String password){
    String userpassword = password.trim();
    if(passValid.hasMatch(userpassword)){
      return true;
    } else{
      return false;
    }
   }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.only(top: 60),
            child: Column(
              
              children: [
              const Padding(padding: EdgeInsets.only(top: 25,)),
              const Text('Register an Account'),
              const SizedBox(height: 35,),
              Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: Column(children: [
                Padding(
                  padding: const EdgeInsets.only(left: 25, right: 25,),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text('Full Name'),
                      TextFormField(
                        controller: _fullnameController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Enter full name';
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: OutlineInputBorder(borderRadius: BorderRadius.circular(10,))
                        ),
                      ),
                      const SizedBox(height: 35,),
                      const Text('Username'),
                      TextFormField(
                        controller: _usernameController,
                        validator: (value) {
                          if(value!.isEmpty ){
                            return 'Enter full name';
                          }
                          return null;
                        },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                      const SizedBox(height: 35,),
                      const Text('Email'),
                      TextFormField(
                        controller: _emailController,
                        validator: (value) {
                          bool isValidEmail = EmailValidator.validate(value!);
                          if(value.isEmpty){
                            return 'Enter your email account';
                          }
                          else if(!isValidEmail){
                            return "Enter a valid email";
                          }
                          return null;
                        },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                ),
                              ),
                      const SizedBox(height: 35,),
                      const Text('Enter Password'),
                      TextFormField(
                        obscureText: true,
                        controller: _passwordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Password is required and cannot be empty';
                          }
                          else{
                            bool result = validatePassword(value);
                            if (result){
                              return null;
                            }
                            else{
                              return "Pasword should container Capital letters, small letters, numbers and special characters";
                            }
                          }
                          
                        },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: const Icon(Icons.key),
                                ),
                              ),
                      const SizedBox(height: 35,),
                      const Text('Confirm Password'),
                      TextFormField(
                        obscureText: true,
                        controller: _confirmpasswordController,
                        validator: (value) {
                          if(value!.isEmpty){
                            return 'Confirm password';
                          }
                          else if(_confirmpasswordController.text.trim() != _passwordController.text.trim()){
                            return "Passwords do not match";
                          }
                          return null;
                        },
                                decoration: InputDecoration(
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                  ),
                                  suffixIcon: const Icon(Icons.key),
                                ),
                              ),
                    ],
                  ),
                  
                )
              ],)),
              const SizedBox(height: 50,),
              InkWell(
                onTap: () {
                  bool isValidated = _formKey.currentState!.validate();
                  if (isValidated){
                    Navigator.push(context, CupertinoPageRoute(builder: (context)=> const VerifyEmail()));
                  }
                },
                child: const MyCustomButtom(label: 'Sign Up'))
            ],
            ),
          ),
        ),
      ),
    );
  }
}