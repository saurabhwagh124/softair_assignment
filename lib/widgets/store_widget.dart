import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softair_assignment/model/store_model.dart';

class StoreWidget extends StatelessWidget {
  final StoreModel storeModel;

  const StoreWidget({super.key, required this.storeModel});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Row(
            children: [
              CircleAvatar(
                backgroundImage: AssetImage(storeModel.image),
                radius: 28.r,
              ),
              SizedBox(width: 10.w),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    storeModel.name,
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    storeModel.address,
                    style: TextStyle(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
              Spacer(),
              Column(
                children: [
                  Icon(Icons.favorite_border, color: Colors.black, size: 15.sp),
                  InkWell(
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        vertical: 5.h,
                        horizontal: 6.w,
                      ),
                      decoration: BoxDecoration(
                        color: Color(0xFF31B682),
                        borderRadius: BorderRadius.circular(10.r),
                      ),
                      child: Text(
                        "Add to Cart",
                        style: TextStyle(
                          fontSize: 12.sp,
                          fontWeight: FontWeight.w600,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Container(
            padding: EdgeInsets.all(6.sp),
            color: Color(0xFFF4FCF9),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  storeModel.available ? "● Available" : "● Not Available",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color:
                        storeModel.available
                            ? Color(0xFF004E4C)
                            : Color(0xFFF83D3D),
                  ),
                ),
                Text(
                  "● ${storeModel.exp} Years Exp",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF004E4C),
                  ),
                ),
                SizedBox(width: 10.w),
                Text(
                  "● ${storeModel.medicine}+ Medicines",
                  style: TextStyle(
                    fontSize: 10.sp,
                    fontWeight: FontWeight.w500,
                    color: Color(0xFF004E4C),
                  ),
                ),
                SizedBox(width: 10.w),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
