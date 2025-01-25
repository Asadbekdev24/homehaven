// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:provider/provider.dart';

import 'package:flutter_application_imtihon/constants/custom_widgets/custom_text.dart';
import 'package:flutter_application_imtihon/constants/utils/app_images.dart';
import 'package:flutter_application_imtihon/viewmodels/providers/provider.dart';

class CustomCard extends StatelessWidget {
  final int productId;
  const CustomCard({
    super.key,
    required this.productId,
  });

  @override
  Widget build(BuildContext context) {
    return Consumer<ProviderEd>(
      builder: (context, provider, child) => SizedBox(
        height: 300.h,
        width: 152.w,
        child: Card(
          child: Container(
            alignment: Alignment.center,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.r),
            ),
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(AppImages.card1Img),
                  CustomText2(
                    name: provider.products[0].data[productId].name ?? "EKERÖ",
                    size: 14,
                    align: true,
                  ),
                  CustomText2(
                    name: provider.products[0].data[productId].discount.toString() ?? "\$230.00",
                    size: 20,
                    align: true,
                    rang: Color(0xff404040),
                  ),
                  CustomText2(
                    name: provider.products[0].data[productId].price.toString() ?? "\$512.58",
                    size: 12,
                    align: true,
                  ),
                  Row(
                    children: [
                      SvgPicture.asset(AppImages.starIcon),
                      CustomText2( name: provider.products[0].data[productId].rating.toString() ?? "4.9 (256)", size: 12, align: true,),
                    ],
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
