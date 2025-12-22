import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../utils/asset_paths.dart';
class ScreenBackground extends StatelessWidget {
  const ScreenBackground({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return   Stack(
      children: [
        SvgPicture.asset(AssetPaths.backgroundSvg,//assets_paths file theke paisi//svg picture add korte eita use hoi
           width:double.maxFinite,
           height:double.maxFinite,
          fit: BoxFit.cover,
        ),
        SafeArea(child: child)         //child widget make korse karon holo onk somoi background e sudu image nah onk text o use hoi tai eibabe text and image 2 tai use kora jabe
      ],
    );
  }
}
