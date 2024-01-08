import 'package:flutter/cupertino.dart';

import '../core.dart';

enum StatusCode { success, notFound, unAuthorized, badRequest, timeout, forbidden, error, multiple }

enum CommonStatus { initial, ready, success, loading, failure }

sealed class WalkDataType {
  final String title;
  final Widget icon;
  final Color color;
  final String unit;

  WalkDataType({
    required this.title,
    required this.icon,
    required this.color,
    this.unit = '',
  });
}

class TimeDataType extends WalkDataType {
  TimeDataType({
    super.title = '걸음 시간',
    super.icon = const SvgImage('assets/icons/ic_walk_time.svg'),
    super.color = timeColor,
    super.unit = '분',
  });
}

class SpeedDataType extends WalkDataType {
  SpeedDataType({
    super.title = '걸음 속도',
    super.icon = const SvgImage('assets/icons/ic_walk_speed.svg'),
    super.color = speedColor,
    super.unit = 'm/s',
  });
}

class DistanceDataType extends WalkDataType {
  DistanceDataType({
    super.title = '이동 거리',
    super.icon = const SvgImage('assets/icons/ic_walk_range.svg'),
    super.color = distanceColor,
    super.unit = 'km',
  });
}
