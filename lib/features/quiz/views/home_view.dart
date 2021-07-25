import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:trivia/features/quiz/config.dart';
import 'package:trivia/features/quiz/controllers/quiz_main_controller.dart';
import 'package:trivia/features/quiz/views/quiz_main_view.dart';
import 'package:trivia/shared/theme_switch.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class HomeView extends StatelessWidget {
  const HomeView({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFEDF3F6),
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
            height: 70.sp,
          ),
          Expanded(
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
                ),
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 3.h),
                    child: const _BuildQuizTopicGrid(),
                  ),
                )
              ],
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
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              Colors.blue,
              Colors.blue.shade200,
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

class _BuildQuizTopicGrid extends ConsumerWidget {
  const _BuildQuizTopicGrid({
    Key? key,
  }) : super(key: key);

  static const List<String> categories = [
    'Mathematics',
    'Science',
    'Drama',
    'Sports',
    'Entertainment',
    'Gaming',
  ];

  @override
  Widget build(BuildContext context, ScopedReader watch) {
    return GridView.builder(
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
      ),
      itemCount: categories.length,
      itemBuilder: (BuildContext context, int index) {
        return Padding(
          padding: const EdgeInsets.symmetric(horizontal: kPadding, vertical: kPadding),
          child: GestureDetector(
            onTap: () {
              context.read(quizMainControllerProvider).setCurrentQuizCategory(categories[index]);
              Navigator.of(context).push(MaterialPageRoute(builder: (_) => const QuizMainView()));
            },
            child: Card(
              shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16.r)),
              // elevation: 5,
              child: Column(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset('$imagePath${categories[index]}.png'),
                    ),
                  ),
                  Padding(
                    padding: EdgeInsets.all(8.0.sp),
                    child: Text(
                      categories[index],
                      style: TextStyle(fontSize: 15.sp, fontWeight: FontWeight.w500),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
