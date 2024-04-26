class NotificationsModel {
  String? notificationsId;
  String? notificationsTitle;
  String? notificationsBody;
  String? notificationsUserId;
  String? notificationsDate;

  NotificationsModel(
      {this.notificationsId,
        this.notificationsTitle,
        this.notificationsBody,
        this.notificationsUserId,
        this.notificationsDate});

  NotificationsModel.fromJson(Map<String, dynamic> json) {
    notificationsId = json['notifications_id'];
    notificationsTitle = json['notifications_title'];
    notificationsBody = json['notifications_body'];
    notificationsUserId = json['notifications_userId'];
    notificationsDate = json['notifications_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['notifications_id'] = this.notificationsId;
    data['notifications_title'] = this.notificationsTitle;
    data['notifications_body'] = this.notificationsBody;
    data['notifications_userId'] = this.notificationsUserId;
    data['notifications_date'] = this.notificationsDate;
    return data;
  }
}