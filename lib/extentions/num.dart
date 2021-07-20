import '../config/size_config.dart';

extension SizeExtension on num {
  double get h => SizeConfig.height(this.toDouble());

  double get w => SizeConfig.width(this.toDouble());

  double get text => SizeConfig.textSize(this.toDouble());
}
