class CommonUtils {


  static String formatDate(int month) {
    String str = "";
    if (month > 9) {
      str = String.fromCharCode(month);
    } else {
      str = '0${month}';
    }
    return str;
  }

}