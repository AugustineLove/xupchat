import 'package:email_validator/email_validator.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xup_chat/constants/colors.dart';
import 'package:xup_chat/constants/firebase_constants.dart';
import 'package:xup_chat/providers/firebase_provider.dart';
import 'package:xup_chat/screens/auth/signup.dart';
import 'package:xup_chat/screens/auth/verify_email.dart';
import 'package:xup_chat/screens/home_page.dart';
import 'package:xup_chat/widgets/customebuttom.dart';
import 'package:xup_chat/widgets/outlinebuttom.dart';


class SignInPage extends StatefulWidget {
  const SignInPage({super.key});

  @override
  State<SignInPage> createState() => _SignInPageState();
}

class _SignInPageState extends State<SignInPage> {
  final _formKey = GlobalKey<FormState>();
  final emailController = TextEditingController();
  final passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final FirebaseServices firebaseService = FirebaseServices();
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 60),
          child: Center(
            child: Column(
              children: [
                const Text('Get Started', style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20,),),
                InkWell(
                  onTap: () {
                    Navigator.push(context, CupertinoPageRoute(builder: (_)=> const VerifyEmail()));
                  },
                  child: const Text('Verify')),
                const SizedBox(height: 58,),
                Form(
                  key: _formKey,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 50, right: 50),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Email'),
                          const SizedBox(height: 5,),
                          TextFormField(
                            controller: emailController,
                            validator: (value) {
                              bool isValidemail = EmailValidator.validate(value!);
                              if (value.isEmpty){
                                return 'Email is required';
                              } else if (!isValidemail){
                                return 'Enter a valid email';
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              border: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                          const SizedBox(height: 20,),
                          const Text('Password'),
                          const SizedBox(height: 5,),
                          TextFormField(
                            obscureText: true,
                            controller: passwordController,
                            validator: (value) {
                              if (value!.isEmpty || value ==null){
                                return 'Password cannot be empty';
                              }
                              else if (value.length < 8){
                                return 'Password should be more than 8';
                              }
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
                    ),
                  ]
                ),),
                const SizedBox(height: 10,),
                const Padding(
                  padding: EdgeInsets.only(right: 50),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Text('Forgot Password?'),
                    ],
                  ),
                ),
                const SizedBox(height: 20,),
                InkWell(
                  onTap: () {
                    bool isValidated = _formKey.currentState!.validate();
                    if (isValidated){
                      try {
                        firebaseService.signInUserWithEmailAndPassword(emailController.text.trim(), passwordController.text.trim(), context);
                        Navigator.of(context).pushReplacement(CupertinoPageRoute(builder: (_)=> HomePage()));
                      } catch (e) {
                        print(e); 
                      }
                    }
                    
                  },
                  child: const MyCustomButtom(label: 'Login',)),
                const SizedBox(height: 45,),
                 Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children:[
                    const Text("Don't have an account? "),
                    InkWell(
                      onTap: () {
                        Navigator.of(context).push(CupertinoPageRoute(builder: (_) => const SignUpPage()));
                      },
                      child: const Text('Sign up', style: TextStyle(color: AppColors.primaryColor, fontWeight: FontWeight.bold),)) ]
                ),
                const SizedBox(height: 30,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  Container(
                    width: 135,
                    height: 1,
                    color: Colors.black,
                  ),
                  const SizedBox(width: 23,),
                  const Text('Or'),
                  const SizedBox(width: 23,),
                  Container(width: 135,
                  height: 1,
                  color: Colors.black,)
                ],),
                const SizedBox(height: 30,),
                const OutlineContainer(imageUrl: 'assets/google.png', label: 'Continue with Google',),
                const SizedBox(height: 25,),
              const OutlineContainer(
                imageUrl: 'assets/apple.png',
                label: 'Continue with Apple',
              ),
              const SizedBox(height: 25,),
              const OutlineContainer(
                imageUrl: 'assets/facebook.png',
                label: 'Continue with Facebook',
              ),
              ]
            ),
          ),
        ),
      ),
    );
  }
}