class OtherManager {
  int? code;
  String? message;
  List<OtherModel>? data;

  OtherManager({this.code, this.message, this.data});

  OtherManager.fromJson(Map<String, dynamic> json) {
    code = json['code'];
    message = json['message'];
    if (json['data'] != null) {
      data = <OtherModel>[];
      json['data'].forEach((v) {
        data!.add(new OtherModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['code'] = this.code;
    data['message'] = this.message;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class OtherModel {
  int? id;
  String? name;
  int? parentId;
  List<OtherModel>? children;

  OtherModel({this.id, this.name, this.parentId, this.children});

  OtherModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    parentId = json['parentId'];
    if (json['children'] != null) {
      children = <OtherModel>[];
      json['children'].forEach((v) {
        children!.add(new OtherModel.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['parentId'] = this.parentId;
    if (this.children != null) {
      data['children'] = this.children!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

// class Children {
//   int? id;
//   String? name;
//   int? parentId;
//   List? children;

//   Children({this.id, this.name, this.parentId, this.children});

//   Children.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     name = json['name'];
//     parentId = json['parentId'];
//     children = json['children'];
//   }

//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['name'] = this.name;
//     data['parentId'] = this.parentId;
//     data['children'] = this.children;
//     return data;
//   }
// }