import '../../ui/shared/app_size_fit.dart';

extension DoubleFit on double {
  
  double get px {
    return BKSizeFit.setPx(this);
  }

  double get rpx {
    return BKSizeFit.setRpx(this);
  }
}