
class DealListModel {
  List<Deal>? done;
  List<Deal>? running;
  List<Deal>? future;
  List<Deal>? help;
  int? count;
  String? dateOf;

  DealListModel(
      {this.done,
      this.running,
      this.future,
      this.help,
      this.count,
      this.dateOf});

  DealListModel.fromJson(Map<String, dynamic> json) {
    if (json['done'] != null) {
      done = <Deal>[];
      json['done'].forEach((v) {
        done!.add(new Deal.fromJson(v));
      });
    }
    if (json['running'] != null) {
      running = <Deal>[];
      json['running'].forEach((v) {
        running!.add(new Deal.fromJson(v));
      });
    }
    if (json['future'] != null) {
      future = <Deal>[];
      json['future'].forEach((v) {
        future!.add(new Deal.fromJson(v));
      });
    }
    if (json['help'] != null) {
      help = <Deal>[];
      json['help'].forEach((v) {
        help!.add(new Deal.fromJson(v));
      });
    }
    count = json['count'];
    dateOf = json['dateOf'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.done != null) {
      data['done'] = this.done!.map((v) => v.toJson()).toList();
    }
    if (this.running != null) {
      data['running'] = this.running!.map((v) => v.toJson()).toList();
    }
    if (this.future != null) {
      data['future'] = this.future!.map((v) => v.toJson()).toList();
    }
    if (this.help != null) {
      data['help'] = this.help!.map((v) => v.toJson()).toList();
    }
    data['count'] = this.count;
    data['dateOf'] = this.dateOf;
    return data;
  }
}

/// 日报模型
class Deal {
  int? id;
  String? dateOf;
  String? item;
  int? typeId;
  int? orderId;
  String? createDate;

  Deal(
      {this.id,
      this.dateOf,
      this.item,
      this.typeId,
      this.orderId,
      this.createDate});

  Deal.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    dateOf = json['dateOf'];
    item = json['item'];
    typeId = json['typeId'];
    orderId = json['orderId'];
    createDate = json['createDate'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['dateOf'] = this.dateOf;
    data['item'] = this.item;
    data['typeId'] = this.typeId;
    data['orderId'] = this.orderId;
    data['createDate'] = this.createDate;
    return data;
  }
}