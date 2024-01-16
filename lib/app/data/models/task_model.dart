class Task {
  String? uid;
  String? tittle;
  String? description;
  String? category;
  String? deadlineDate;
  String? deadlineTime;
  String? createdAt;
  bool? isCompleted;
  List<Attachments>? attachments;

  Task(
      {this.uid,
      this.tittle,
      this.description,
      this.category,
      this.deadlineDate,
      this.deadlineTime,
      this.createdAt,
      this.isCompleted,
      this.attachments});

  Task.fromJson(Map<String, dynamic> json) {
    uid = json['uid'];
    tittle = json['tittle'];
    description = json['description'];
    category = json['category'];
    deadlineDate = json['deadlineDate'];
    deadlineTime = json['deadlineTime'];
    createdAt = json['createdAt'];
    isCompleted = json['isCompleted'];
    if (json['attachments'] != null) {
      attachments = <Attachments>[];
      json['attachments'].forEach((v) {
        attachments?.add(Attachments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['uid'] = uid;
    data['tittle'] = tittle;
    data['description'] = description;
    data['category'] = category;
    data['deadlineDate'] = deadlineDate;
    data['deadlineTime'] = deadlineTime;
    data['createdAt'] = createdAt;
    data['isCompleted'] = isCompleted;
    if (attachments != null) {
      data['attachments'] = attachments?.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Attachments {
  String? type;
  String? url;

  Attachments({this.type, this.url});

  Attachments.fromJson(Map<String, dynamic> json) {
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['type'] = type;
    data['url'] = url;
    return data;
  }
}
