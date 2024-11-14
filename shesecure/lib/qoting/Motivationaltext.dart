
import 'package:flutter/material.dart';
import 'package:shesecure/qoting/quotes.dart';

// ignore: must_be_immutable
class CustomAppBar extends StatelessWidget {
  // const CustomAppBar({super.key});
  Function? onTap;
  int? quoteIndex;
  CustomAppBar({this.onTap, this.quoteIndex});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onTap!();
      },
      child: Container(
        child: Text(
          sweetSayings[quoteIndex!],
          textAlign: TextAlign.center,
          style: TextStyle(
           fontSize: 35,
                      fontWeight: FontWeight.w500,
                      letterSpacing: 1,
                      wordSpacing: 2,
                      color: Colors.white,
            ),
        ),
      ),
    );
  }
}