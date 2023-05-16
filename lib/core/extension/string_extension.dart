
extension BKDateTime on String {
  
  static today(){
    return '${todayToYear()}-${todayToMonth()}-${todayToDay()}';
  }
  static String todayToYear() {
    DateTime today = DateTime.now();
    return today.year.toString();
  }
  
  static String todayToMonth() {
    DateTime today = DateTime.now();
    String month = today.month.toString().padLeft(2,'0');
    return month;
  }
  static String todayToDay() {
    DateTime today = DateTime.now();
    String day = today.day.toString().padLeft(2,'0');
    return day;
  }

  
  String get toYear {
    DateTime dateTime = DateTime.parse(this);
    String year = dateTime.year.toString();
    return year;
  }

  String get toMonth {
    DateTime dateTime = DateTime.parse(this);
    String month = dateTime.month.toString().padLeft(2,'0');
    return month;
  }

  /// 获取当前日期
  String get toDay {
    DateTime dateTime = DateTime.parse(this);
    String day = dateTime.day.toString().padLeft(2,'0');
    print('today:$this-- $day');
    return day;
  }

  /// 当前日期字符串 => 12:00 
  String get toTime {
    return '${this.toHour}:${this.toMinute}';
  }

  /// 当前日期字符串 => 转为 小时
  String get toHour {
    DateTime dateTime = DateTime.parse(this);
    String hour = dateTime.hour.toString().padLeft(2,'0');
    return hour;
  }
  
  /// 当前日期字符串 => 转为 分钟
  String get toMinute {
    DateTime dateTime = DateTime.parse(this);
    String minute = dateTime.minute.toString().padLeft(2,'0');
    return minute;
  }

  /// 当前日期字符串 => 转为 yyyy.mm.dd 
  String get yearMonthDay{
    return '${this.toYear}.${this.toMonth}.${this.toDay}';
  }

  String get png{
    return 'assets/images/$this.png';
  }
}

