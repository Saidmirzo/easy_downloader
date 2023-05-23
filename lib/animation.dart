import 'package:flutter/material.dart';

class LottieAnimation extends StatefulWidget {
  const LottieAnimation({
    super.key,
    this.height = 50,
  });
  final double height;

  @override
  State<LottieAnimation> createState() => _LottieAnimationState();
}

class _LottieAnimationState extends State<LottieAnimation>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation animation;
  @override
  void initState() {
    super.initState();
    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 510),
    );
    animation = Tween<double>(begin: -1, end: 1).animate(animationController);
    animationController.forward();
    animationController.addListener(() {
      if (animationController.isCompleted) {
        animationController.reverse();
      } else if (animationController.isDismissed) {
        animationController.forward();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = widget.height;
    return SizedBox(
      height: height,
      width: height * 3,
      child: AnimatedBuilder(
        animation: animation,
        builder: (context, child) {
          return Stack(
            children: [
              Align(
                alignment: Alignment(animation.value, 0.5),
                child: Container(
                  height: height,
                  width: height,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xffA6E1DD),
                  ),
                ),
              ),
              Align(
                alignment: Alignment(-animation.value, .5),
                child: Container(
                  height: height,
                  width: height,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Color(0xff19B3A9),
                  ),
                ),
              )
            ],
          );
        },
      ),
    );
  }
}
