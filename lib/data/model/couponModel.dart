class CouponModel {
  String? couponsId;
  String? couponsName;
  String? couponsDiscount;
  String? couponsCount;
  String? couponsExpired;

  CouponModel(
      {this.couponsId,
        this.couponsName,
        this.couponsDiscount,
        this.couponsCount,
        this.couponsExpired});

  CouponModel.fromJson(Map<String, dynamic> json) {
    couponsId = json['coupons_id'];
    couponsName = json['coupons_name'];
    couponsDiscount = json['coupons_discount'];
    couponsCount = json['coupons_count'];
    couponsExpired = json['coupons_expired'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['coupons_id'] = this.couponsId;
    data['coupons_name'] = this.couponsName;
    data['coupons_discount'] = this.couponsDiscount;
    data['coupons_count'] = this.couponsCount;
    data['coupons_expired'] = this.couponsExpired;
    return data;
  }
}