import '../../ui/shared/app_size_fit.dart';
import "package:intl/intl.dart";

extension DoubleFit on double {
  
  double get px {
    return BKSizeFit.setPx(this);
  }

  double get rpx {
    return BKSizeFit.setRpx(this);
  }
}

extension MoneyDouble on double {
  /// double 显示金额格式
  String get moneyFormat {
    NumberFormat format = NumberFormat("###,##0.00");
    return format.format(this);

    // NumberFormat formatter = NumberFormat('###,##0.00');
    // formatter.minimumExponentDigits = 2;
    // formatter.maximumFractionDigits = 2;
    // return formatter.format(this);
    
  }
}