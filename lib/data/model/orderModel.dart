class OrderModel {
  String? ordersId;
  String? ordersPaymentMethod;
  String? ordersDeliveryType;
  String? ordersCouponId;
  String? ordersOrderPrice;
  String? ordersDeliveryPrice;
  String? ordersUserId;
  String? ordersAddressId;
  String? ordersStatus;
  String? ordersDate;
  String? ordersTotalPrice;
  String? addressId;
  String? addressUsersId;
  String? addressName;
  String? addressPhone;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressType;

  OrderModel(
      {this.ordersId,
        this.ordersPaymentMethod,
        this.ordersDeliveryType,
        this.ordersCouponId,
        this.ordersOrderPrice,
        this.ordersDeliveryPrice,
        this.ordersUserId,
        this.ordersAddressId,
        this.ordersStatus,
        this.ordersDate,
        this.ordersTotalPrice,
        this.addressId,
        this.addressUsersId,
        this.addressName,
        this.addressPhone,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.addressType});

  OrderModel.fromJson(Map<String, dynamic> json) {
    ordersId = json['orders_id'];
    ordersPaymentMethod = json['orders_paymentMethod'];
    ordersDeliveryType = json['orders_deliveryType'];
    ordersCouponId = json['orders_couponId'];
    ordersOrderPrice = json['orders_orderPrice'];
    ordersDeliveryPrice = json['orders_deliveryPrice'];
    ordersUserId = json['orders_userId'];
    ordersAddressId = json['orders_addressId'];
    ordersStatus = json['orders_status'];
    ordersDate = json['orders_date'];
    ordersTotalPrice = json['orders_totalPrice'];
    addressId = json['address_id'];
    addressUsersId = json['address_usersId'];
    addressName = json['address_name'];
    addressPhone = json['address_phone'];
    addressCity = json['address_city'];
    addressStreet = json['address_street'];
    addressLat = json['address_lat'];
    addressLong = json['address_long'];
    addressType = json['address_type'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['orders_id'] = this.ordersId;
    data['orders_paymentMethod'] = this.ordersPaymentMethod;
    data['orders_deliveryType'] = this.ordersDeliveryType;
    data['orders_couponId'] = this.ordersCouponId;
    data['orders_orderPrice'] = this.ordersOrderPrice;
    data['orders_deliveryPrice'] = this.ordersDeliveryPrice;
    data['orders_userId'] = this.ordersUserId;
    data['orders_addressId'] = this.ordersAddressId;
    data['orders_status'] = this.ordersStatus;
    data['orders_date'] = this.ordersDate;
    data['orders_totalPrice'] = this.ordersTotalPrice;
    data['address_id'] = this.addressId;
    data['address_usersId'] = this.addressUsersId;
    data['address_name'] = this.addressName;
    data['address_phone'] = this.addressPhone;
    data['address_city'] = this.addressCity;
    data['address_street'] = this.addressStreet;
    data['address_lat'] = this.addressLat;
    data['address_long'] = this.addressLong;
    data['address_type'] = this.addressType;
    return data;
  }
}