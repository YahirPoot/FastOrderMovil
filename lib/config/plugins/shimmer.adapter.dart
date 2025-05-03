import 'package:flutter/widgets.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerAdapter { //To create a shimmer is necesary to be involved by boundary constrains.
  static Shimmer createShimmer({ required Widget child, required Color baseColor, required Color highlightColor }) {
    return Shimmer.fromColors(
      baseColor: baseColor,
      highlightColor: highlightColor,
      child: child
    );
  }
}