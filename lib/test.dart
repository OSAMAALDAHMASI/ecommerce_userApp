import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'core/function/checkInternet.dart';

class Test extends StatefulWidget {
  const Test({Key? key}) : super(key: key);

  @override
  State<Test> createState() => _TestState();
}

class _TestState extends State<Test> {

  indata()async{
  bool x= await checkInternet();
  print(x);

  }
@override
  void initState() {
  indata();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(body:
    Column(mainAxisAlignment: MainAxisAlignment.center,
      children: [





        Center(
          child: OtpTextField(fieldWidth:  MediaQuery.of(context).size.width/20*3,
            numberOfFields: 5,
            borderColor: Color(0xFF512DA8),
            //set to true to show as box or false to show as dash
            showFieldAsBox: true,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode){
              showDialog(
                  context: context,
                  builder: (context){
                    return AlertDialog(
                      title: Text("Verification Code"),
                      content: Text('Code entered is $verificationCode'),
                    );
                  }
              );
            }, // end onSubmit
          ),
        ),


        Center(
          child: OtpTextField(fieldWidth:  MediaQuery.of(context).size.width/20*3,
            numberOfFields: 5,
            borderColor: Colors.green,
            focusedBorderColor: Colors.red,
            // styles: otpTextStyles,
            showFieldAsBox: false,
            borderWidth: 4.0,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here if necessary
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {

            },
          ),
        ),
      ],
    ),);
  }
}
