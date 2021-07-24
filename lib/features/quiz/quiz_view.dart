import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:trivia/features/quiz/config.dart';
import 'package:trivia/shared/theme_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class QuizView extends StatelessWidget {
  const QuizView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      appBar: AppBar(
        title: const Text('Quizera'),
        actions: [const ThemeSwitch()],
      ),
      body: Stack(
        children: [
          _firstLayer(),
          _secondLayer(),
        ],
      ),
    );
  }

  Positioned _secondLayer() {
    return Positioned(
      top: 130.h,
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 30.w),
        child: Container(
          height: 120.h,
          width: 1.sw - 2 * 30.w,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            gradient: const LinearGradient(colors: [Colors.purple, Colors.blue]),
            borderRadius: BorderRadius.circular(10.r),
          ),
          child: Row(
            children: [
              SizedBox(
                width: 0.4.sw,
              ),
              Text(
                'Play & Win\nExiting Prizes',
                overflow: TextOverflow.ellipsis,
                style: TextStyle(fontSize: 25.sp, fontWeight: FontWeight.bold, color: Colors.white),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _firstLayer() {
    return SizedBox(
      child: Column(
        children: [
          _buildUserImageAndName(),
          SizedBox(
            height: 100.sp,
          ),
          Expanded(
            child: Container(
              child: Column(
                children: [
                  Row(
                    children: [
                      SizedBox(width: 30.w),
                      Text(
                        'Top Quiz Categories',
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Spacer(),
                      TextButton(
                        onPressed: () {},
                        style: TextButton.styleFrom(
                          alignment: Alignment.center,
                          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.r)),
                          textStyle: TextStyle(color: Colors.cyan, fontSize: 15.sp),
                          padding: EdgeInsets.symmetric(horizontal: 20.w),
                          backgroundColor: Colors.cyan.shade200,
                        ),
                        child: const Text(
                          'View All',
                          textAlign: TextAlign.center,
                        ),
                      ),
                      SizedBox(width: 30.w),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }

  Container _buildUserImageAndName() {
    return Container(
      height: 200.h,
      decoration: BoxDecoration(
          borderRadius: BorderRadius.only(
            bottomLeft: QuizConfig.profileContainerRadius,
            bottomRight: QuizConfig.profileContainerRadius,
          ),
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue,
              Colors.blue.shade300,
            ],
          )),
      child: Column(
        children: [
          const SizedBox(height: 3 * kPadding),
          Row(
            children: [
              const SizedBox(width: 2 * kPadding),
              CircleAvatar(
                backgroundImage: const AssetImage('${imagePath}profile.png'),
                radius: 30.r,
              ),
              const SizedBox(width: 2 * kPadding),
              const Expanded(
                child: Text(
                  'Mahbubur Rahman ',
                  maxLines: 1,
                  overflow: TextOverflow.clip,
                  style: TextStyle(color: Colors.white, fontWeight: FontWeight.w700, fontSize: 20),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
