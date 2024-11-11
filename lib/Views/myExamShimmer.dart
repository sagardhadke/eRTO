import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

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
                      shimmerContainer(
                        height: 20,
                        width: 150,
                      ),
                      shimmerContainer(
                        height: 20,
                        width: 100,
                      ),
                    ],
                  ),
                  SizedBox(height: 10),
                  shimmerProgressBar(),
                ],
              )),
          shimmerContainer(
              height: 150, width: MediaQuery.of(context).size.width * 0.9),
          SizedBox(height: 5),
          shimmerAnswerList(context),
          shimmerContainer(
              height: 50, width: MediaQuery.of(context).size.width * 0.8),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: shimmerContainer(
                height: 20, width: MediaQuery.of(context).size.width * 0.9),
          ),
        ],
      ),
    );
  }

  Widget shimmerContainer({required double height, required double width}) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        height: height,
        width: width,
        color: Colors.white,
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
            child: shimmerContainer(
                height: 40, width: MediaQuery.of(context).size.width * 0.9),
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
