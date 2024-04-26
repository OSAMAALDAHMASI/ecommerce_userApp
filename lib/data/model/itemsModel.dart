class ItemsModel {
  String? itemsId;
  String? itemsName;
  String? itemsNameAr;
  String? itemsDes;
  String? itemsDesAr;
  String? itemsCount;
  String? itemsActive;
  String? itemsPrice;
  String? itemsDiscount;
  String? itemsDate;
  String? itemsImage;
  String? itemsCategories;
  String? categoriesId;
  String? categoriesName;
  String? categoriesNameAr;
  String? categoriesImage;
  String? categoriesDatetime;
  String? favorite;
  String? itemsPriceDiscount;


  ItemsModel(
      {this.itemsId,
        this.itemsName,
        this.itemsNameAr,
        this.itemsDes,
        this.itemsDesAr,
        this.itemsCount,
        this.itemsActive,
        this.itemsPrice,
        this.itemsDiscount,
        this.itemsDate,
        this.itemsImage,
        this.itemsCategories,
        this.categoriesId,
        this.categoriesName,
        this.categoriesNameAr,
        this.categoriesImage,
        this.categoriesDatetime,
        this.favorite,
        this.itemsPriceDiscount,


      });

  ItemsModel.fromJson(Map<String, dynamic> json) {
    itemsId = json['items_id'];
    itemsName = json['items_name'];
    itemsNameAr = json['items_name_ar'];
    itemsDes = json['items_des'];
    itemsDesAr = json['items_des_ar'];
    itemsCount = json['items_count'];
    itemsActive = json['items_active'];
    itemsPrice = json['items_price'];
    itemsDiscount = json['items_discount'];
    itemsDate = json['items_date'];
    itemsImage = json['items_image'];
    itemsCategories = json['items_categories'];
    categoriesId = json['categories_id'];
    categoriesName = json['categories_name'];
    categoriesNameAr = json['categories_name_ar'];
    categoriesImage = json['categories_image'];
    categoriesDatetime = json['categories_datetime'];
    favorite = json['favorite'];
    itemsPriceDiscount = json['itemsPriceDiscount'];

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
    data['items_date'] = this.itemsDate;
    data['items_image'] = this.itemsImage;
    data['items_categories'] = this.itemsCategories;
    data['categories_id'] = this.categoriesId;
    data['categories_name'] = this.categoriesName;
    data['categories_name_ar'] = this.categoriesNameAr;
    data['categories_image'] = this.categoriesImage;
    data['categories_datetime'] = this.categoriesDatetime;
    data['favorite'] = this.favorite;
    data['itemsPriceDiscount'] = this.itemsPriceDiscount;

    return data;
  }
}