import 'package:flutter/material.dart';
import 'package:flutter_photo_gallery_webant/theme/light_theme.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';

class NoInternetConnectionWidget extends StatelessWidget {
  const NoInternetConnectionWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        SizedBox(
          height: 40.h,
        ),
        SizedBox(
          height: MediaQuery.of(context).size.width,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/webant_logo.svg"),
              SizedBox(
                height: 20.h,
              ),
              Text(
                'Oh shucks!',
                style: Theme.of(context).textTheme.errorTitle,
              ),
              SizedBox(
                height: 5.h,
              ),
              Text(
                'Slow or no internet connection.\nPlease check your internet settings',
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.errorSubtitle,
              ),
            ],
          ),
        )
      ],
    );
  }
}