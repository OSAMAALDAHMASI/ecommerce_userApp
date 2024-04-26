class MyFavoriteModel {
  String? favoriteId;
  String? favoriteUserId;
  String? favoriteItemsId;
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDes;
  String? itemsDesAr;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsData;
  String? itemsImage;
  String? itemsCategories;
  String? usersId;

  MyFavoriteModel(
      {this.favoriteId,
        this.favoriteUserId,
        this.favoriteItemsId,
        this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDes,
        this.itemsDesAr,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsData,
        this.itemsImage,
        this.itemsCategories,
        this.usersId});

  MyFavoriteModel.fromJson(Map<String, dynamic> json) {
    favoriteId = json['favorite_id'];
    favoriteUserId = json['favorite_userId'];
    favoriteItemsId = json['favorite_itemsId'];
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDes = json['items_des'];
    itemsDesAr = json['items_des_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsData = json['items_data'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    usersId = json['users_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['favorite_id'] = this.favoriteId;
    data['favorite_userId'] = this.favoriteUserId;
    data['favorite_itemsId'] = this.favoriteItemsId;
    data['items_id'] = this.itemsId;
    data['items_name'] = this.itemsName;
    data['items_name_ar'] = this.itemsNameAr;
    data['items_des'] = this.itemsDes;
    data['items_des_ar'] = this.itemsDesAr;
    data['items_count'] = this.itemsCount;
    data['items_active'] = this.itemsActive;
    data['items_price'] = this.itemsPrice;
    data['items_discount'] = this.itemsDiscount;
    data['items_data'] = this.itemsData;
    data['items_image'] = this.itemsImage;
    data['items_categories'] = this.itemsCategories;
    data['users_id'] = this.usersId;
    return data;
  }
}