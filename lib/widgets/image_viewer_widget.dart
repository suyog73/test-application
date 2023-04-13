import 'package:custom_full_image_screen/custom_full_image_screen.dart';
import 'package:flutter/material.dart';

import '../helpers/constants.dart';

class ImageViewerWidget extends StatelessWidget {
  const ImageViewerWidget({
    Key? key,
    required this.urlDownload,
    this.width = 150,
    this.height = 150,
    this.finalWidth = double.infinity,
    this.finalHeight = double.infinity,
  }) : super(key: key);

  final String urlDownload;
  final double width, height;
  final double finalHeight, finalWidth;

  @override
  Widget build(BuildContext context) {
    return ImageCachedFullscreen(
      imageUrl: urlDownload,
      imageBorderRadius: 5,
      imageWidth: width,
      imageHeight: height,
      imageDetailsHeight: finalHeight,
      imageDetailsWidth: finalWidth,
      // iconBackButtonColor: kGreenShadeColor,
      // hideBackButtonDetails: false,
      // backgroundColorDetails: ,
      imageDetailsFit: BoxFit.contain,
      // hideAppBarDetails: true,
      imageFit: BoxFit.cover,
      withHeroAnimation: false,
      placeholderDetails: CircularProgressIndicator(color: primaryColor),
      placeholder: CircularProgressIndicator(color: primaryColor),
      errorWidget: urlDownload == ''
          ? CircularProgressIndicator(color: primaryColor)
          : Center(
              child: Text(
                'Image corrupted',
                style: TextStyle(color: Colors.red, fontSize: 32),
              ),
            ),
    );
  }
}
