import '../../ui/shared/app_size_fit.dart';

extension IntFit on int {
  
  double get px {
    return BKSizeFit.setPx(this.toDouble());
  }

  double get rpx {
    return BKSizeFit.setRpx(this.toDouble());
  }
}