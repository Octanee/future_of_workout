import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:future_of_workout/src/styles/app_colors.dart';

class AppIcon extends StatelessWidget {
  const AppIcon({
    super.key,
    required this.iconData,
    this.widht = 24,
    this.height = 24,
    Color? color,
    this.fit = BoxFit.scaleDown,
  }) : color = color ?? AppColors.grey;

  final AppIcons iconData;
  final double? widht;
  final double? height;
  final Color? color;
  final BoxFit fit;

  @override
  Widget build(BuildContext context) {
    return SvgPicture.asset(
      iconData.asset,
      width: widht,
      height: height,
      color: color,
      fit: fit,
    );
  }
}

enum AppIcons {
  calendarEdit('calendar_edit.svg'),
  calendar('calendar.svg'),
  checkBox('check_box.svg'),
  check('check.svg'),
  clock('clock.svg'),
  flame('flame.svg'),
  gym('gym.svg'),
  heartFilled('heart_filled.svg'),
  heart('heart.svg'),
  info('info.svg'),
  intensity('intensity.svg'),
  left('left.svg'),
  listAdd('list_add.svg'),
  listLess('list_less.svg'),
  listMore('list_more.svg'),
  listRemove('list_remove.svg'),
  list('list.svg'),
  minus('minus.svg'),
  muscle('muscle.svg'),
  pencil('pencil.svg'),
  play('play.svg'),
  plus('plus.svg'),
  repeat('repeat.svg'),
  right('right.svg'),
  scale('scale.svg'),
  search('search.svg'),
  settings('settings.svg'),
  starFilled('star_filled.svg'),
  star('star.svg'),
  stats('stats.svg'),
  stop('stop.svg'),
  stopwatch('stopwatch.svg'),
  trash('trash.svg'),
  weight('weight.svg');

  const AppIcons(this._name);

  final String _name;

  String get asset {
    return 'assets/icons/$_name';
  }
}
