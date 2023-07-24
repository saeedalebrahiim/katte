// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'katte.swagger.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AccessToken _$AccessTokenFromJson(Map<String, dynamic> json) => AccessToken(
      accessToken: json['access_token'] as String?,
      refreshToken: json['refresh_token'] as String?,
      tokenType: json['token_type'] as String?,
      expiresIn: json['expires_in'] as int?,
    );

Map<String, dynamic> _$AccessTokenToJson(AccessToken instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('access_token', instance.accessToken);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('token_type', instance.tokenType);
  writeNotNull('expires_in', instance.expiresIn);
  return val;
}

AddressDto _$AddressDtoFromJson(Map<String, dynamic> json) => AddressDto(
      clientId: json['clientId'] as String?,
      clientPhoneNumber: json['clientPhoneNumber'] as String?,
      clientFname: json['clientFname'] as String?,
      clientLname: json['clientLname'] as String?,
      topic: json['topic'] as String?,
      postalCode: json['postalCode'] as String?,
      location: json['location'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$AddressDtoToJson(AddressDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('clientId', instance.clientId);
  writeNotNull('clientPhoneNumber', instance.clientPhoneNumber);
  writeNotNull('clientFname', instance.clientFname);
  writeNotNull('clientLname', instance.clientLname);
  writeNotNull('topic', instance.topic);
  writeNotNull('postalCode', instance.postalCode);
  writeNotNull('location', instance.location);
  writeNotNull('id', instance.id);
  return val;
}

AddressDtoApiResult _$AddressDtoApiResultFromJson(Map<String, dynamic> json) =>
    AddressDtoApiResult(
      data: json['data'] == null
          ? null
          : AddressDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddressDtoApiResultToJson(AddressDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

AddressDtoListApiResult _$AddressDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    AddressDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$AddressDtoListApiResultToJson(
    AddressDtoListApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

ApiResult _$ApiResultFromJson(Map<String, dynamic> json) => ApiResult(
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ApiResultToJson(ApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

Card2Dto _$Card2DtoFromJson(Map<String, dynamic> json) => Card2Dto(
      addressId: json['addressId'] as String?,
      payOnline: json['payOnline'] as bool?,
    );

Map<String, dynamic> _$Card2DtoToJson(Card2Dto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('addressId', instance.addressId);
  writeNotNull('payOnline', instance.payOnline);
  return val;
}

CategoryDto _$CategoryDtoFromJson(Map<String, dynamic> json) => CategoryDto(
      name: json['name'] as String?,
      imageLink: json['imageLink'] as String?,
      code: json['code'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CategoryDtoToJson(CategoryDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('name', instance.name);
  writeNotNull('imageLink', instance.imageLink);
  writeNotNull('code', instance.code);
  writeNotNull('id', instance.id);
  return val;
}

CategoryDtoListApiResult _$CategoryDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    CategoryDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CategoryDtoListApiResultToJson(
    CategoryDtoListApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

CommentDto _$CommentDtoFromJson(Map<String, dynamic> json) => CommentDto(
      text: json['text'] as String?,
      rate: (json['rate'] as num?)?.toDouble(),
      userId: json['userId'] as String?,
      userFname: json['userFname'] as String?,
      userLname: json['userLname'] as String?,
      productsId: json['productsId'] as String?,
      commentStatus: commentStatusFromJson(json['commentStatus']),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$CommentDtoToJson(CommentDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('text', instance.text);
  writeNotNull('rate', instance.rate);
  writeNotNull('userId', instance.userId);
  writeNotNull('userFname', instance.userFname);
  writeNotNull('userLname', instance.userLname);
  writeNotNull('productsId', instance.productsId);
  writeNotNull('commentStatus', commentStatusToJson(instance.commentStatus));
  writeNotNull('id', instance.id);
  return val;
}

CommentDtoApiResult _$CommentDtoApiResultFromJson(Map<String, dynamic> json) =>
    CommentDtoApiResult(
      data: json['data'] == null
          ? null
          : CommentDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommentDtoApiResultToJson(CommentDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

CommentDtoListApiResult _$CommentDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    CommentDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$CommentDtoListApiResultToJson(
    CommentDtoListApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

ListChosedProductDto _$ListChosedProductDtoFromJson(
        Map<String, dynamic> json) =>
    ListChosedProductDto(
      productId: json['productId'] as String?,
      count: json['count'] as int?,
    );

Map<String, dynamic> _$ListChosedProductDtoToJson(
    ListChosedProductDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('productId', instance.productId);
  writeNotNull('count', instance.count);
  return val;
}

LoginOtpDto _$LoginOtpDtoFromJson(Map<String, dynamic> json) => LoginOtpDto(
      phoneNumber: json['phoneNumber'] as String?,
      code: json['code'] as int?,
    );

Map<String, dynamic> _$LoginOtpDtoToJson(LoginOtpDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('code', instance.code);
  return val;
}

NotificationDto _$NotificationDtoFromJson(Map<String, dynamic> json) =>
    NotificationDto(
      topic: json['topic'] as String?,
      text: json['text'] as String?,
      dateTimes: json['dateTimes'] == null
          ? null
          : DateTime.parse(json['dateTimes'] as String),
      userId: json['userId'] as String?,
      userPhoneNumber: json['userPhoneNumber'] as String?,
      userFName: json['userFName'] as String?,
      userLName: json['userLName'] as String?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$NotificationDtoToJson(NotificationDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('topic', instance.topic);
  writeNotNull('text', instance.text);
  writeNotNull('dateTimes', instance.dateTimes?.toIso8601String());
  writeNotNull('userId', instance.userId);
  writeNotNull('userPhoneNumber', instance.userPhoneNumber);
  writeNotNull('userFName', instance.userFName);
  writeNotNull('userLName', instance.userLName);
  writeNotNull('id', instance.id);
  return val;
}

ProductDto _$ProductDtoFromJson(Map<String, dynamic> json) => ProductDto(
      code: json['code'] as int?,
      name: json['name'] as String?,
      price: json['price'] as int?,
      imageLink: json['imageLink'] as String?,
      discount: json['discount'] as int?,
      percent: json['percent'] as int?,
      count: json['count'] as int?,
      rate: (json['rate'] as num?)?.toDouble(),
      totalRate: (json['totalRate'] as num?)?.toDouble(),
      shortDetail: json['shortDetail'] as String?,
      longDetail: json['longDetail'] as String?,
      creationDateTime: json['creationDateTime'] == null
          ? null
          : DateTime.parse(json['creationDateTime'] as String),
      categorysId: json['categorysId'] as String?,
      categories: (json['categories'] as List<dynamic>?)
              ?.map((e) => CategoryDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      comments: (json['comments'] as List<dynamic>?)
              ?.map((e) => CommentDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ProductDtoToJson(ProductDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('price', instance.price);
  writeNotNull('imageLink', instance.imageLink);
  writeNotNull('discount', instance.discount);
  writeNotNull('percent', instance.percent);
  writeNotNull('count', instance.count);
  writeNotNull('rate', instance.rate);
  writeNotNull('totalRate', instance.totalRate);
  writeNotNull('shortDetail', instance.shortDetail);
  writeNotNull('longDetail', instance.longDetail);
  writeNotNull(
      'creationDateTime', instance.creationDateTime?.toIso8601String());
  writeNotNull('categorysId', instance.categorysId);
  writeNotNull(
      'categories', instance.categories?.map((e) => e.toJson()).toList());
  writeNotNull('comments', instance.comments?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id);
  return val;
}

ProductDtoApiResult _$ProductDtoApiResultFromJson(Map<String, dynamic> json) =>
    ProductDtoApiResult(
      data: json['data'] == null
          ? null
          : ProductDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProductDtoApiResultToJson(ProductDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

ProductDtoListApiResult _$ProductDtoListApiResultFromJson(
        Map<String, dynamic> json) =>
    ProductDtoListApiResult(
      data: (json['data'] as List<dynamic>?)
              ?.map((e) => ProductDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ProductDtoListApiResultToJson(
    ProductDtoListApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.map((e) => e.toJson()).toList());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

ShopCardDetailDto _$ShopCardDetailDtoFromJson(Map<String, dynamic> json) =>
    ShopCardDetailDto(
      price: json['price'] as int?,
      count: json['count'] as int?,
      disCount: json['disCount'] as int?,
      productsId: json['productsId'] as String?,
      productsPrice: json['productsPrice'] as int?,
      productsDiscount: json['productsDiscount'] as int?,
      productsName: json['productsName'] as String?,
      productsImageLink: json['productsImageLink'] as String?,
      creationDateTime: json['creationDateTime'] == null
          ? null
          : DateTime.parse(json['creationDateTime'] as String),
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShopCardDetailDtoToJson(ShopCardDetailDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('price', instance.price);
  writeNotNull('count', instance.count);
  writeNotNull('disCount', instance.disCount);
  writeNotNull('productsId', instance.productsId);
  writeNotNull('productsPrice', instance.productsPrice);
  writeNotNull('productsDiscount', instance.productsDiscount);
  writeNotNull('productsName', instance.productsName);
  writeNotNull('productsImageLink', instance.productsImageLink);
  writeNotNull(
      'creationDateTime', instance.creationDateTime?.toIso8601String());
  writeNotNull('id', instance.id);
  return val;
}

ShopCardDto _$ShopCardDtoFromJson(Map<String, dynamic> json) => ShopCardDto(
      userId: json['userId'] as String?,
      addressId: json['addressId'] as String?,
      orderReportId: json['orderReportId'] as String?,
      orderReportTax: json['orderReportTax'] as int?,
      orderReportPostCost: json['orderReportPostCost'] as int?,
      userUserName: json['userUserName'] as String?,
      userFName: json['userFName'] as String?,
      userLName: json['userLName'] as String?,
      totalPrice: json['totalPrice'] as int?,
      postPrice: json['postPrice'] as int?,
      finalTotalPrice: json['finalTotalPrice'] as int?,
      payOnline: json['payOnline'] as bool?,
      shopCardDetails: (json['shopCardDetails'] as List<dynamic>?)
              ?.map(
                  (e) => ShopCardDetailDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      addresses: (json['addresses'] as List<dynamic>?)
              ?.map((e) => AddressDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
      id: json['id'] as String?,
    );

Map<String, dynamic> _$ShopCardDtoToJson(ShopCardDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('userId', instance.userId);
  writeNotNull('addressId', instance.addressId);
  writeNotNull('orderReportId', instance.orderReportId);
  writeNotNull('orderReportTax', instance.orderReportTax);
  writeNotNull('orderReportPostCost', instance.orderReportPostCost);
  writeNotNull('userUserName', instance.userUserName);
  writeNotNull('userFName', instance.userFName);
  writeNotNull('userLName', instance.userLName);
  writeNotNull('totalPrice', instance.totalPrice);
  writeNotNull('postPrice', instance.postPrice);
  writeNotNull('finalTotalPrice', instance.finalTotalPrice);
  writeNotNull('payOnline', instance.payOnline);
  writeNotNull('shopCardDetails',
      instance.shopCardDetails?.map((e) => e.toJson()).toList());
  writeNotNull(
      'addresses', instance.addresses?.map((e) => e.toJson()).toList());
  writeNotNull('id', instance.id);
  return val;
}

ShopCardDtoApiResult _$ShopCardDtoApiResultFromJson(
        Map<String, dynamic> json) =>
    ShopCardDtoApiResult(
      data: json['data'] == null
          ? null
          : ShopCardDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$ShopCardDtoApiResultToJson(
    ShopCardDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

SignUpDto _$SignUpDtoFromJson(Map<String, dynamic> json) => SignUpDto(
      fName: json['fName'] as String?,
      lName: json['lName'] as String?,
      phoneNumber: json['phoneNumber'] as String?,
      otp: json['otp'] as int?,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$SignUpDtoToJson(SignUpDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('fName', instance.fName);
  writeNotNull('lName', instance.lName);
  writeNotNull('phoneNumber', instance.phoneNumber);
  writeNotNull('otp', instance.otp);
  writeNotNull('id', instance.id);
  return val;
}

StringApiResult _$StringApiResultFromJson(Map<String, dynamic> json) =>
    StringApiResult(
      data: json['data'] as String?,
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$StringApiResultToJson(StringApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data);
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

SyncOrderDto _$SyncOrderDtoFromJson(Map<String, dynamic> json) => SyncOrderDto(
      totalPrice: json['totalPrice'] as int?,
      description: json['description'] as String?,
      listChosedProduct: (json['list_Chosed_Product'] as List<dynamic>?)
              ?.map((e) =>
                  ListChosedProductDto.fromJson(e as Map<String, dynamic>))
              .toList() ??
          [],
    );

Map<String, dynamic> _$SyncOrderDtoToJson(SyncOrderDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('totalPrice', instance.totalPrice);
  writeNotNull('description', instance.description);
  writeNotNull('list_Chosed_Product',
      instance.listChosedProduct?.map((e) => e.toJson()).toList());
  return val;
}

UserDto _$UserDtoFromJson(Map<String, dynamic> json) => UserDto(
      student: json['student'] as bool?,
      name: json['name'] as String?,
      managerName: json['managerName'] as String?,
      userName: json['userName'] as String,
      email: json['email'] as String?,
      password: json['password'] as String?,
      passwordConfirm: json['passwordConfirm'] as String?,
      fname: json['fname'] as String,
      lname: json['lname'] as String,
      gender: genderTypeFromJson(json['gender']),
      nationalCode: json['nationalCode'] as String,
      phoneNumber: json['phoneNumber'] as String,
      code: json['code'] as String?,
      birthCertificateNumber: json['birthCertificateNumber'] as String,
      birthDay: json['birthDay'] as String,
      birthCity: json['birthCity'] as String,
      certificateCity: json['certificateCity'] as String,
      phone: json['phone'] as String,
      postalCode: json['postalCode'] as String,
      id: json['id'] as String?,
    );

Map<String, dynamic> _$UserDtoToJson(UserDto instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('student', instance.student);
  writeNotNull('name', instance.name);
  writeNotNull('managerName', instance.managerName);
  val['userName'] = instance.userName;
  writeNotNull('email', instance.email);
  writeNotNull('password', instance.password);
  writeNotNull('passwordConfirm', instance.passwordConfirm);
  val['fname'] = instance.fname;
  val['lname'] = instance.lname;
  writeNotNull('gender', genderTypeToJson(instance.gender));
  val['nationalCode'] = instance.nationalCode;
  val['phoneNumber'] = instance.phoneNumber;
  writeNotNull('code', instance.code);
  val['birthCertificateNumber'] = instance.birthCertificateNumber;
  val['birthDay'] = instance.birthDay;
  val['birthCity'] = instance.birthCity;
  val['certificateCity'] = instance.certificateCity;
  val['phone'] = instance.phone;
  val['postalCode'] = instance.postalCode;
  writeNotNull('id', instance.id);
  return val;
}

UserDtoApiResult _$UserDtoApiResultFromJson(Map<String, dynamic> json) =>
    UserDtoApiResult(
      data: json['data'] == null
          ? null
          : UserDto.fromJson(json['data'] as Map<String, dynamic>),
      isSuccess: json['isSuccess'] as bool?,
      statusCode: apiResultStatusCodeFromJson(json['statusCode']),
      message: json['message'] as String?,
    );

Map<String, dynamic> _$UserDtoApiResultToJson(UserDtoApiResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('data', instance.data?.toJson());
  writeNotNull('isSuccess', instance.isSuccess);
  writeNotNull('statusCode', apiResultStatusCodeToJson(instance.statusCode));
  writeNotNull('message', instance.message);
  return val;
}

ApiV1AuthenticationFreeTokenPost$RequestBody
    _$ApiV1AuthenticationFreeTokenPost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthenticationFreeTokenPost$RequestBody(
          grantType: json['grant_type'] as String?,
          username: json['username'] as String?,
          password: json['password'] as String?,
          refreshToken: json['refresh_token'] as String?,
          scope: json['scope'] as String?,
          clientId: json['client_id'] as String?,
          clientSecret: json['client_secret'] as String?,
        );

Map<String, dynamic> _$ApiV1AuthenticationFreeTokenPost$RequestBodyToJson(
    ApiV1AuthenticationFreeTokenPost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('grant_type', instance.grantType);
  writeNotNull('username', instance.username);
  writeNotNull('password', instance.password);
  writeNotNull('refresh_token', instance.refreshToken);
  writeNotNull('scope', instance.scope);
  writeNotNull('client_id', instance.clientId);
  writeNotNull('client_secret', instance.clientSecret);
  return val;
}

ApiV1AuthenticationEditProfileImagePost$RequestBody
    _$ApiV1AuthenticationEditProfileImagePost$RequestBodyFromJson(
            Map<String, dynamic> json) =>
        ApiV1AuthenticationEditProfileImagePost$RequestBody(
          file: json['File'] as String?,
        );

Map<String, dynamic>
    _$ApiV1AuthenticationEditProfileImagePost$RequestBodyToJson(
        ApiV1AuthenticationEditProfileImagePost$RequestBody instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('File', instance.file);
  return val;
}
