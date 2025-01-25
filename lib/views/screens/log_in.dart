import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_button.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_text.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_textformfield.dart';
import 'package:flutter_application_imtihon/constants/utils/app_images.dart';
import 'package:flutter_application_imtihon/constants/utils/appcolors.dart';
import 'package:flutter_application_imtihon/viewmodels/providers/provider.dart';
import 'package:flutter_application_imtihon/views/screens/home.dart';
import 'package:flutter_application_imtihon/views/screens/sign_up.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class LogIn extends StatefulWidget {
  const LogIn({super.key});

  @override
  State<LogIn> createState() => _LogInState();
}

class _LogInState extends State<LogIn> {
  final _formKey=GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  void dispose() {
    // TODO: implement dispose
    super.dispose();
    _phoneController.dispose();
    _passwordController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: SingleChildScrollView(
          child: Form(
            key: _formKey,
            child: Consumer<ProviderEd>(
              builder: (context, provider, child) =>  Column(
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                    name: "Welcome Back!",
                    align: true,
                  ),
                  CustomText2(
                      align: true,
                      name:
                          "Enter your email to start shopping and get awesome deals today!"),
                  SizedBox(
                    height: 32.h,
                  ),
                  CustomTextformfield(
                      iconPath: AppImages.mailIcon, hide: false, hinttext: "", labelText: "Phone", textEditingController: _phoneController, validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Telefon nomerni kiriting";
                        }
                        // if(value.startsWith("+998")==false)
                        // {
                        //   return "Telefon raqam +998 bilan boshlanishi kerak";
                        // }
                        return null;
                      },),
                  SizedBox(
                    height: 16,
                  ),
                  CustomTextformfield(
                      iconPath: AppImages.lockIcon, hide: true, hinttext: "password", labelText: "Password",textEditingController: _passwordController,
                      validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Parolni kiritishingiz kerak!';
                    }
                    if (value.length < 6) {
                      return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak!';
                    }
                    return null;
                  },),
                  SizedBox(
                    height: 16,
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 160),
                    child: CustomText2(
                      size: 16,
                      name: "Forgot your password?",
                      rang: Appcolors.mainColor,
                      align: true,
                    ),
                  ),
                  SizedBox(height: 16.h,),
                  SizedBox(
                      width: double.infinity,
                      height: 50.h,
                      child:ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          backgroundColor: Appcolors.mainColor,
                        ),
                        onPressed: () async{
                        final javob = await provider.authLogIn(_phoneController.text, _passwordController.text);
                        log(javob.toString());
                          if (_formKey.currentState!.validate() && javob) {

                        await provider.getFurnitures();
                      // Agar validatsiya muvaffaqiyatli bo‘lsa
                      // ScaffoldMessenger.of(context).showSnackBar(
                      //   const SnackBar(content: Text('Hamma maydonlar yaroqli!')),
                      // );

                      Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));

                      }
                        },

                      child: CustomText2(name: "Log in", rang: Colors.white, size: 16,)
                      ,
                      ),

                      ),
                  SizedBox(
                    height: 32.h,
                  ),
                  Center(
                    child: Row(

                      children: [

                        CustomText2(name: "Don’t have an account? "),
                        TextButton(onPressed: (){
                          Navigator.push(context, MaterialPageRoute(builder: (context) => SignUp(),));
                        }, child: CustomText2(name: "Register", rang: Appcolors.mainColor,),),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
