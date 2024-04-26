class CartModel {
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
  String? cartId;
  String? cartUserId;
  String? cartItemsId;
  String? itemsPriceAll;
  String? itemsPriceAllWithDiscount;
  String? itemsCountAll;

  CartModel(
      {this.itemsId,
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
        this.cartId,
        this.cartUserId,
        this.cartItemsId,
        this.itemsPriceAll,
        this.itemsPriceAllWithDiscount,
        this.itemsCountAll});

  CartModel.fromJson(Map<String, dynamic> json) {
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
    cartId = json['cart_id'];
    cartUserId = json['cart_userId'];
    cartItemsId = json['cart_itemsId'];
    itemsPriceAll = json['itemsPriceAll'];
    itemsPriceAllWithDiscount = json['itemsPriceAllWithDiscount'];
    itemsCountAll = json['itemsCountAll'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
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
    data['cart_id'] = this.cartId;
    data['cart_userId'] = this.cartUserId;
    data['cart_itemsId'] = this.cartItemsId;
    data['itemsPriceAll'] = this.itemsPriceAll;
    data['itemsPriceAllWithDiscount'] = this.itemsPriceAllWithDiscount;
    data['itemsCountAll'] = this.itemsCountAll;
    return data;
  }
}