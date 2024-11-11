import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:rto/Widgets/uiHelper.dart';

class MyexamShimmer extends StatelessWidget {
  MyexamShimmer({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
              padding: const EdgeInsets.all(16.0),
              child: Column(
                children: [
                  SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Uihelper.shimmerContainer(
                          height: 20, width: 150, context: context),
                      Uihelper.shimmerContainer(
                          height: 20, width: 100, context: context),
                    ],
                  ),
                  SizedBox(height: 10),
                  shimmerProgressBar(),
                ],
              )),
          Uihelper.shimmerContainer(
              height: 150,
              width: MediaQuery.of(context).size.width * 0.9,
              context: context),
          SizedBox(height: 5),
          shimmerAnswerList(context),
          Uihelper.shimmerContainer(
              height: 50,
              width: MediaQuery.of(context).size.width * 0.8,
              context: context),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Uihelper.shimmerContainer(
                height: 20,
                width: MediaQuery.of(context).size.width * 0.9,
                context: context),
          ),
        ],
      ),
    );
  }

  Widget shimmerProgressBar() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: 8.0,
        width: double.infinity,
        color: Colors.white,
      ),
    );
  }

  Widget shimmerAnswerList(context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Column(
        children: List.generate(4, (index) {
          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 10.0),
            child: Uihelper.shimmerContainer(
                height: 40,
                width: MediaQuery.of(context).size.width * 0.9,
                context: context),
          );
        }),
      ),
    );
  }

  Widget myShimmerLoader() {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Row(
        children: [
          const CircleAvatar(
            radius: 40,
            backgroundColor: Colors.white,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              children: [
                SizedBox(height: 15),
                Container(height: 20, color: Colors.white),
                SizedBox(height: 10),
                Container(height: 15, width: 80, color: Colors.white),
              ],
            ),
          )
        ],
      ),
    );
  }
}
