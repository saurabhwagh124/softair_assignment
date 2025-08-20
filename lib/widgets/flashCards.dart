import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class Flashcards extends StatelessWidget {
  const Flashcards({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 10.w),
      padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        color: Color(0xFFF0F6F1),
        borderRadius: BorderRadius.circular(10.r),
      ),
      width: 160.w,
      height: 170.h,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(children: [Spacer(), Icon(Icons.favorite_border, size: 15.sp)]),
          SizedBox(
            height: 110.h,
            child: Image.asset(
              'assets/images/ensure.png',
              fit: BoxFit.fitHeight,
            ),
          ),
          Text("Ensure Powder for Adults"),
          RichText(
            text: TextSpan(
              children: [
                TextSpan(
                  text: 'MRP',
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: '    ₹250',
                  style: TextStyle(
                    decoration: TextDecoration.lineThrough,
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w400,
                    color: Colors.grey,
                  ),
                ),
                TextSpan(
                  text: '   ₹200',
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
