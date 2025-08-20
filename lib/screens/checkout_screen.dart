import 'package:dotted_line/dotted_line.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:softair_assignment/model/item_model.dart';
import 'package:softair_assignment/widgets/item_widget.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  final items = [
    ItemModel(
      image: 'assets/images/paracetamol.png',
      name: 'Paracetamol Capsule',
      desc: '| 1 packet 20 tablets',
    ),
    ItemModel(
      image: 'assets/images/syrup.png',
      name: 'Dextromethorphan',
      desc: '| 1 bottle',
    ),
    ItemModel(
      image: 'assets/images/bournvita.png',
      name: 'Bournvita Drink',
      desc: '| 1 kg',
    ),
    ItemModel(
      image: 'assets/images/vicks1.png',
      name: 'Vicks VapoRub Balm ',
      desc: '| 50ml',
    ),
    ItemModel(
      image: 'assets/images/vicks1.png',
      name: 'Vicks VapoRub Balm ',
      desc: '| 50ml',
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xFFF4F4F4),
      appBar: PreferredSize(
        preferredSize: Size(360.w, 60.h),
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(30.r),
              bottomRight: Radius.circular(30.r),
            ),
            color: Color(0xFF293543),
          ),
          padding: EdgeInsets.only(left: 16.w, top: 40.h, right: 16.w),
          child: Column(
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                      size: 24.sp,
                    ),
                  ),
                  Text(
                    "Checkout",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                    ),
                  ),
                ],
              ),
              Spacer(),
            ],
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            itemsList(context),
            priceDetails(context),
            Padding(
              padding: EdgeInsets.all(16.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "You might also like",
                        style: TextStyle(
                          fontSize: 16.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Spacer(),
                      Text(
                        "See all",
                        style: TextStyle(
                          color: Color(0xFF31B682),
                          fontSize: 14.sp,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    height: 110.h,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: 5,
                      itemBuilder:
                          (context, index) => Container(
                            padding: EdgeInsets.all(10.sp),
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(15.r),
                            ),
                            margin: EdgeInsets.only(right: 10.w),
                            child: Column(
                              children: [
                                Image.asset(
                                  'assets/images/vicks2.png',
                                  fit: BoxFit.fill,
                                  height: 50.h,
                                ),
                                SizedBox(height: 8.h),
                                Text("Vicks Value Pack"),
                                RichText(
                                  text: TextSpan(
                                    children: [
                                      TextSpan(
                                        text: "MRP ",
                                        style: TextStyle(
                                          color: Color(0xFF31B682),
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "₹280 ",
                                        style: TextStyle(
                                          color: Color(0xFF31B682),
                                          fontWeight: FontWeight.w600,
                                          fontSize: 12.sp,
                                        ),
                                      ),
                                      TextSpan(
                                        text: "150ml",
                                        style: TextStyle(
                                          color: Colors.grey,
                                          fontWeight: FontWeight.w400,
                                          fontSize: 10.sp,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 140.h,
        padding: EdgeInsets.all(16.w),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(16.r),
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              blurRadius: 6,
              offset: Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(Icons.home, color: Colors.green, size: 22.sp),
                SizedBox(width: 8.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Delivering to Home",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      Text(
                        "1st Floor Punjabi Bagh, phase 2 above HDFC bank",
                        style: TextStyle(
                          fontSize: 12.sp,
                          color: Colors.grey[600],
                        ),
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {},
                  child: Text(
                    "Change",
                    style: TextStyle(
                      fontSize: 13.sp,
                      color: Color(0xFF31B682),
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 16.h),
            Row(
              children: [
                Image.asset("assets/images/paytm.png", height: 20.h),
                SizedBox(width: 6.w),
                Text(
                  "PAY USING",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.w500,
                  ),
                ),
                Icon(Icons.keyboard_arrow_up, size: 18.sp),
              ],
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                Text(
                  "Paytm UPI",
                  style: TextStyle(
                    fontSize: 16.sp,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Spacer(),
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 10.w,
                    vertical: 3.h,
                  ),
                  decoration: BoxDecoration(
                    color: Color(0xFF31B682),
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Column(
                        children: [
                          Text(
                            "TOTAL",
                            style: TextStyle(
                              fontSize: 10.sp,
                              color: Colors.white70,
                            ),
                          ),
                          Text(
                            "₹1034.0",
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      SizedBox(width: 20.w),
                      Text(
                        "Place Order",
                        style: TextStyle(
                          fontSize: 14.sp,
                          color: Colors.white,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget itemsList(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      // padding: EdgeInsets.all(10.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        border: Border.all(color: Color(0xFF31B682)),
      ),
      child: Column(
        children: [
          Container(
            height: 25.h,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15.r),
              color: Color(0xFFF4FCF9),
            ),
            child: Row(
              children: [
                SizedBox(width: 15.w),
                Icon(Icons.watch_later, color: Color(0xFF31B682)),
                SizedBox(width: 10.w),
                Text(
                  "Free delivery in 18 minutes",
                  style: TextStyle(
                    fontSize: 14.sp,
                    fontWeight: FontWeight.w700,
                    color: Color(0xFF31B682),
                  ),
                ),
              ],
            ),
          ),
          SizedBox(
            height: 320.h,
            child: ListView.builder(
              itemBuilder: (context, index) => ItemWidget(item: items[index]),
              itemCount: items.length,
            ),
          ),
        ],
      ),
    );
  }

  Widget priceDetails(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 16.w, vertical: 18.h),
      padding: EdgeInsets.all(16.sp),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15.r),
        color: Colors.white,
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            children: [
              Text(
                "Price Details",
                style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.w600,
                  color: Color(0xFF293543),
                ),
              ),
              Spacer(),
              Icon(Icons.keyboard_arrow_up, color: Colors.black),
            ],
          ),
          DottedLine(),
          SizedBox(height: 10.h),
          Row(
            children: [
              Text("Price (5 Items)", style: TextStyle(fontSize: 14.sp)),
              Spacer(),
              RichText(
                text: TextSpan(
                  children: [
                    TextSpan(
                      text: '₹1200',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.grey,
                        decoration: TextDecoration.lineThrough,
                      ),
                    ),
                    TextSpan(
                      text: '\t\t₹1034.0',
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontWeight: FontWeight.w700,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          SizedBox(height: 10.h),
          Row(
            // mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Delivery Fee", style: TextStyle(fontSize: 12.sp)),
              Spacer(),
              Text(
                "₹30",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Colors.grey,
                  decoration: TextDecoration.lineThrough,
                ),
              ),
              Text(
                "Free",
                style: TextStyle(
                  fontSize: 12.sp,
                  color: Color(0xFF31B682),
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
          DottedLine(lineLength: 100),
          SizedBox(height: 10.h),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text("Handling Charge", style: TextStyle(fontSize: 12.sp)),
              Text("₹9", style: TextStyle(fontSize: 12.sp)),
            ],
          ),
          DottedLine(lineLength: 120),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                "Grand Amount",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
              Text(
                "₹1043",
                style: TextStyle(fontSize: 14.sp, fontWeight: FontWeight.w700),
              ),
            ],
          ),
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.h),
            padding: EdgeInsets.all(8.sp),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10.r),
              color: Color(0xFFF4FCF9),
            ),
            child: Center(
              child: Text(
                "You will save ₹157 on this order",
                style: TextStyle(fontSize: 12.sp, color: Color(0xFF31B682)),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
