import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xup_chat/constants/colors.dart';
import 'package:xup_chat/screens/level_edecuation.dart';
import 'package:xup_chat/util/ui.dart';
import 'package:xup_chat/widgets/customebuttom.dart';

class VerifyEmail extends StatefulWidget {
  const VerifyEmail({super.key});

  @override
  State<VerifyEmail> createState() => _VerifyEmailState();
}

class _VerifyEmailState extends State<VerifyEmail> {
  final List<FocusNode> _focusNodes = List.generate(5, (index) => FocusNode());
  final List<TextEditingController> _controllers = List.generate(5, (index) => TextEditingController());

  @override
  void dispose(){
    for (var focusNode in _focusNodes){
      focusNode.dispose();
    }
    for (var controller in _controllers){
      controller.dispose();
    }
    super.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 60.0),
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              children: [
                const Text('Verify your Email', style: TextStyle(fontWeight: FontWeight.bold, fontSize: 20,),),
                verticalSpace(35),
                const Text("We've sent a code to your email address", style: TextStyle(fontSize: 15,),),
                verticalSpace(30),
                const Text("Enter your code", style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),),
                verticalSpace(26),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List<Widget>.generate(5, (index){
                    return Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Container(
                        width: 60,
                        child: TextFormField(
                          controller: _controllers[index],
                          focusNode: _focusNodes[index],
                          maxLength: 1,
                          keyboardType: TextInputType.number,
                          textAlign: TextAlign.center,
                          decoration: const InputDecoration(
                            counterText: "",
                            border: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: AppColors.primaryColor,
                              )
                            )
                          ),
                          onChanged: (value) {
                            if( value.isNotEmpty && index < 4){
                              _focusNodes[index].unfocus();
                              FocusScope.of(context).requestFocus(_focusNodes[index + 1]);
                            } else if (index == 4){
                              String enterredOTP = _controllers.fold("", (previousValue, controller) => previousValue + controller.text);
                            }
                          },
                        ),
                      ),
                    );
                  }),
                ),
                  verticalSpace(49),
                  InkWell(
                    onTap: () {
                      Navigator.of(context).push(CupertinoPageRoute(builder: (context) => LevelOfEducation()));
                    },
                    child: const MyCustomButtom(label: 'Continue')),
                  verticalSpace(20),
                  const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text("I didn't get code."),
                      Text('Resend', style: TextStyle(color: AppColors.primaryColor),)
                    ],
                  ),
                  verticalSpace(300),
                  const Text("Tap Continue to accept Privacy Policy cookie use \n and Terms and Conditions of XupChat")
              ],
            ),
          ),
        ),
      ),
    );
  }
}