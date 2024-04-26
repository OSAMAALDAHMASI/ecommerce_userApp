class AddressModel {
  String? addressId;
  String? addressUsersId;
  String? addressName;
  String? addressPhone;
  String? addressCity;
  String? addressStreet;
  String? addressLat;
  String? addressLong;
  String? addressType;

  AddressModel(
      {this.addressId,
        this.addressUsersId,
        this.addressName,
        this.addressPhone,
        this.addressCity,
        this.addressStreet,
        this.addressLat,
        this.addressLong,
        this.addressType});

  AddressModel.fromJson(Map<String, dynamic> json) {
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