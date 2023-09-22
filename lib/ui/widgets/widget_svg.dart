import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../utils/colors.dart';

class WSvgWidget extends StatelessWidget {
  final String imageUrl;
  final double width;
  final double height;
  bool showError;

  WSvgWidget({super.key, 
    required this.imageUrl,
    this.width = 100.0,
    this.height = 100.0,
    this.showError = false,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String>(
      future: DefaultAssetBundle.of(context).loadString(imageUrl),
      builder: (BuildContext context, AsyncSnapshot<String> snapshot) {
        if (snapshot.hasData) {
          return SizedBox(
            width: width,
              height: height,
            child: SvgPicture.string(
              snapshot.data!,
              fit: BoxFit.contain,
            ),
          );
        } else if(showError) {
          return const Center(child: Text("Error!", style: TextStyle(color:kBlack45Color),));
        } else{
          return Container();
        }
      },
    );
  }
}
