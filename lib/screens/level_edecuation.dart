import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xup_chat/constants/colors.dart';
import 'package:xup_chat/screens/auth/signin.dart';
import 'package:xup_chat/screens/senior_high_detail.dart';
import 'package:xup_chat/screens/university_details.dart';
import 'package:xup_chat/util/checkbox.dart';
import 'package:xup_chat/util/sizeFifteen.dart';
import 'package:xup_chat/util/sizeTwentyFont.dart';
import 'package:xup_chat/util/ui.dart';

class LevelOfEducation extends StatefulWidget {
  const LevelOfEducation({super.key});

  @override
  State<LevelOfEducation> createState() => _LevelOfEducationState();
}

class _LevelOfEducationState extends State<LevelOfEducation> {
  String? selectedLevel;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(top: 60), 
        child: Column(
          children: [
            const Text('Welcome to XupChat', style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
            verticalSpace(45),
            const Image(image: AssetImage('assets/levelOfEducation.png')),
            verticalSpace(40),
            const TwentyFontSize(text: "Select your level of education"),
            verticalSpace(20),
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: RadioListTile(title: const FifteenFontSize(text: 'Senior High School'), activeColor: AppColors.primaryColor, value: 'SeniorHigh', groupValue: selectedLevel, onChanged: (value){
                setState(() {
                  selectedLevel = value;
                });
              }),
            ),
            Padding(
              padding: const EdgeInsets.only(left: 45.0),
              child: RadioListTile(title: const FifteenFontSize(text: 'University'), activeColor: AppColors.primaryColor,  value: 'University', groupValue: selectedLevel, onChanged: (value){
                setState(() {
                  selectedLevel = value;
                });
              }),
            ),
            verticalSpace(15),
            
            verticalSpace(176),
             Padding(
              padding: const EdgeInsets.only(right: 30.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  InkWell(
                    onTap: () {
                      if (selectedLevel == 'University'){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const UniversityDetails()));

                      } else if (selectedLevel == 'SeniorHigh'){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const SeniorHighDetail()));
                      }
                    },
                    child: const Text('Next', style: TextStyle(color: AppColors.primaryColor, fontSize: 20, fontWeight: FontWeight.bold),)),
                  InkWell(
                    onTap: () {
                      if (selectedLevel == 'University'){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const UniversityDetails()));

                      } else if (selectedLevel == 'SeniorHigh'){
                        Navigator.of(context).push(CupertinoPageRoute(builder: (context)=> const SeniorHighDetail()));
                      }
                    },
                    child: const Icon(Icons.arrow_forward, color: AppColors.primaryColor,)),
                ],
              ),
            )
          ],
        )),
      ),
    );
  }
}