import 'package:flutter/material.dart';
import 'package:xup_chat/util/sizeTwentyFont.dart';
import 'package:xup_chat/util/ui.dart';
import 'package:xup_chat/widgets/customebuttom.dart';

class SeniorHighDetail extends StatefulWidget {
  const SeniorHighDetail({super.key});

  @override
  State<SeniorHighDetail> createState() => _SeniorHighDetailState();
}

class _SeniorHighDetailState extends State<SeniorHighDetail> {
  final _formKey = GlobalKey<FormState>();
  String? selectedForm;
  List<String> formToSelect = ['Form 1', 'Form 2', 'Form 3'];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          child: Column(
            children:[const Padding(
              padding: EdgeInsets.only(top: 60.0, left: 25),
              child: TwentyFontSize(text: 'Senior High School'),
            ),
            verticalSpace(45),
            const Image(image: AssetImage('assets/seniorHigh.png')),
            verticalSpace(20),
              Padding(
                padding: const EdgeInsets.only(left: 30, right: 30),
                child: Form(
                  key: _formKey,
                  child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text('Name of Your School'),
                    verticalSpace(7),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                      ),
                    ),
                    verticalSpace(20),
                    const Text('Course'),
                    verticalSpace(7),
                    TextFormField(
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                      ),
                    ),
                    verticalSpace(20),
                    const Text('Form'),
                    verticalSpace(7),
                    DropdownButtonFormField<String>(
                      value: selectedForm,
                      items: formToSelect.map((item) {
                        return DropdownMenuItem<String>(
                          value: item,
                          child: Text(item));
                      }).toList(), onChanged: (value){
                        setState(() {
                          selectedForm = value;
                        });
                      },
                      decoration: InputDecoration(
                        border: OutlineInputBorder(borderRadius: BorderRadius.circular(9))
                      ),
                      ),
                  ],
                )),
              ),
                verticalSpace(85),
              const MyCustomButtom(label: 'Finish'),
          ]),
        ),
      ),
    );
  }
}