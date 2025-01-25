import 'package:flutter/material.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_button.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_text.dart';
import 'package:flutter_application_imtihon/constants/custom_widgets/custom_textformfield.dart';
import 'package:flutter_application_imtihon/constants/utils/app_images.dart';
import 'package:flutter_application_imtihon/constants/utils/appcolors.dart';
import 'package:flutter_application_imtihon/viewmodels/providers/provider.dart';
import 'package:flutter_application_imtihon/views/screens/home.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  const SignUp({super.key});

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey=GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  final _passwordController = TextEditingController();
  final _firstNameController = TextEditingController();
  final _lastNameController = TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<ProviderEd>(
          builder: (context, provider, child) =>  SingleChildScrollView(
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomText(
                    name: "Create Account",
                    align: true,
                  ),
                  CustomText2(
                    name:
                        "Fill in your details below to get started on a seamless shopping experience.",
                    align: true,
                  ),
                  SizedBox(
                    height: 32,
                  ),
                  CustomTextformfield(
                    textEditingController: _firstNameController,
                    iconPath: AppImages.userIcon,
                    hide: false,
                    hinttext: "",
                    labelText: "First Name",
                    validator: (value) {
                      if(value==null || value.isEmpty)
                      {
                        return "Ism kiriting";
                      }

                      if(value.length<2)
                      {
                        return "Ismda kamida 2 ta belgi bo'lishi kerak";
                      }

                      return null;
                    },

                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextformfield(
                    textEditingController: _lastNameController,
                    iconPath: AppImages.userIcon,
                    hide: false,
                    hinttext: "",
                    labelText: "Last Name",
                    validator: (value) {
                      if(value==null || value.isEmpty)
                      {
                        return "Ism kiriting";
                      }
                      if(value.length<2)
                      {
                        return "Familiyada kamida 2 ta belgi bo'lishi kerak";
                      }

                      return null;
                    },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextformfield(
                    textEditingController: _phoneController,
                    iconPath: AppImages.mailIcon,
                    hide: false,
                    hinttext: "",
                    labelText: "Phone",
                    validator: (value) {
                        if(value==null || value.isEmpty)
                        {
                          return "Telefon nomerni kiriting";
                        }
                        if(value.startsWith("+998")==false)
                        {
                          return "Telefon raqam +998 bilan boshlanishi kerak";
                        }
                        return null;
                      },
                  ),
                  SizedBox(
                    height: 16.h,
                  ),
                  CustomTextformfield(
                    textEditingController: _passwordController,
                    iconPath: AppImages.lockIcon,
                    hide: true,
                    hinttext: "",
                    labelText: "Password",
                    validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Parolni kiritishingiz kerak!';
                    }
                    if (value.length < 6) {
                      return 'Parol kamida 6 ta belgidan iborat bo‘lishi kerak!';
                    }
                    return null;
                  },
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  CustomText2(
                    name:
                        "By clicking Create Account, you acknowledge you have read and agreed to our Terms of Use and Privacy Policy",
                    align: true,
                    size: 12,
                  ),
                  SizedBox(
                    height: 24.h,
                  ),
                  SizedBox(
                    width: double.infinity,
                    height: 50.h,
                    child: ElevatedButton(

                        style: ElevatedButton.styleFrom(
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(12.r),
                          ),
                          backgroundColor: Appcolors.mainColor,
                        ),
                        onPressed: () async{

                          final javob = await provider.authSignUp([_phoneController.text, _passwordController.text, _firstNameController.text, _lastNameController.text]);
                          if (_formKey.currentState!.validate() && javob) {

                            await provider.getFurnitures();

                            Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));


                      } else
                      {
                        // Agar validatsiya muvaffaqiyatli bo‘lsa
                      ScaffoldMessenger.of(context).showSnackBar(
                        const SnackBar(content: Text('Nimadir xato')),);
                      }

                        },

                      child: CustomText2(name: "Create account", rang: Colors.white, size: 16,)
                      ,
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
