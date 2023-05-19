import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import '../components/text_field_decorator.dart';
import '../utils/custom_color.dart';
import '../utils/custom_font.dart';
import '../utils/spin_kit.dart';
class NewCompanyDialog extends StatefulWidget {
  NewCompanyDialog({
    super.key,
  });

  @override
  State<NewCompanyDialog> createState() => _NewCompanyDialogState();
}

class _NewCompanyDialogState extends State<NewCompanyDialog> {
  final _formkey =  GlobalKey<FormState>();

  TextEditingController nameController = TextEditingController();

  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  TextEditingController phoneController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return ModalProgressHUD(
      inAsyncCall: isLoading,
      progressIndicator: spinkit,
      child: AlertDialog(
          elevation: 1,
          contentPadding: EdgeInsets.zero,
          content: SizedBox(
              width: 372,
              height: 470,
              child: SingleChildScrollView(
                child: Column(
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.pop(context);
                        },
                        child: Padding(
                          padding: const EdgeInsets.only(top: 14,right: 12),
                          child: Container(
                              alignment: Alignment.topRight,
                              child: Image.asset("assets/Vector.png")
                          ),
                        ),
                      ),
                      // SizedBox(height: 8,),
                      Text("Create a New Company",style: myStyle(22,titleTextColor,FontWeight.w700),),
                      const SizedBox(height: 38,),
                      Form(
                        key: _formkey,
                        child: Padding(
                          padding: const EdgeInsets.only(left: 27,right: 35),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              TextFormField(
                                  controller: nameController,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return "Please Enter company name";
                                    }
                                  },
                                  decoration: textFiledDecorator("Company Name")
                              ),
                              const SizedBox(height: 15,),
                              TextFormField(
                                  controller: emailController,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return "Please Enter email";
                                    }
                                    if(!value.contains("@")){
                                      return "Invalid Email";
                                    }
                                  },
                                  decoration: textFiledDecorator("Work Email")
                              ),
                              const SizedBox(height: 15,),
                              TextFormField(
                                  controller: passwordController,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return "Please Enter Password";
                                    }
                                    if(value.length<3){
                                      return "Use Strong Password";
                                    }
                                    // if(!value.contains("#") && !value.contains("\$")){
                                    //   return "Use special Character";
                                    // }
                                  },
                                  decoration: textFiledDecorator("Password")
                              ),
                              const SizedBox(height: 15,),
                              TextFormField(
                                  keyboardType: TextInputType.number,
                                  controller: phoneController,
                                  validator: (value) {
                                    if(value!.isEmpty){
                                      return "Please Enter phone number";
                                    }
                                  },
                                  decoration: textFiledDecorator("Phone")
                              ),
                              const SizedBox(height: 27,),
                              InkWell(
                                onTap: () {
                                  if(_formkey.currentState!.validate()){
                                    onButtonClick();
                                  }
                                  // Navigator.pop(context);
                                },
                                child: Container(
                                  width: double.maxFinite,
                                  height: 45,
                                  decoration: BoxDecoration(
                                      color: buttonColor,
                                      borderRadius: BorderRadius.circular(4)
                                  ),
                                  child: Center(child: Text("Create a New Company",style: myStyle(16,Colors.white,FontWeight.w700),)),
                                ),
                              )
                            ],
                          ),
                        ),
                      )
                    ]
                ),
              )
          )
      ),
    );
  }

  bool isLoading = false;

  onButtonClick() async {
    setState(() {
      isLoading = true;
    });
    try{
      String url = "http://139.59.35.127/apex-dmit/public/api/company";
      var map = Map<String,dynamic>();
      map['company_name'] = nameController.text.toString();
      map['email'] = emailController.text.toString();
      map['password'] = passwordController.text.toString();
      map['phone'] = phoneController.text.toString();
      var response = await http.post(Uri.parse(url),body: map);
      var data = jsonDecode(response.body);

      setState(() {
        isLoading = false;
      });

      if(response.statusCode == 201){
        // showToastMessage("Login successful");
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.green,
            behavior: SnackBarBehavior.floating,
            // content: Text('Company Created Successfully'),
            content: Text(data['status_message']),
            duration: Duration(seconds: 2),
          ),
        );
        Navigator.pop(context);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            backgroundColor: Colors.red,
            content: Text(data['status_message']),
            duration: const Duration(seconds: 3),
          ),
        );
      }
      print(data);
      print(response.statusCode);
    }catch(e){
      print(e);
    }
  }
}
