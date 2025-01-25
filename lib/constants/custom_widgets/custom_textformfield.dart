// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';

import 'package:flutter_application_imtihon/constants/utils/app_images.dart';

class CustomTextformfield extends StatelessWidget {
  final String iconPath;
  final bool hide;
  final String hinttext;
  final String labelText;
  final TextEditingController textEditingController;
  final String? Function(String?)? validator;
  const CustomTextformfield({
    super.key,
    required this.iconPath,
    required this.hide,
    required this.hinttext,
    required this.labelText, required this.textEditingController, this.validator,
  });

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: textEditingController,
      decoration: InputDecoration(
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12.r),
          borderSide: BorderSide(color: Colors.grey),
        ),
        labelText: labelText,
        prefixIcon: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SvgPicture.asset(iconPath),
        ),
        suffixIcon: hide == true
            ? IconButton(onPressed: () {}, icon: Icon(Icons.visibility))
            : null,
        hintText: hinttext,
      ),
      validator: validator,
    );
  }
}
