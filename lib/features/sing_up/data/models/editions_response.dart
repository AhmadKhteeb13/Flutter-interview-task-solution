class EditionsResponse {
  final Result? result;
  final String? targetUrl;
  final bool success;
  final dynamic error;
  final bool unAuthorizedRequest;
  final bool abp;

  EditionsResponse({
    this.result,
    this.targetUrl,
    required this.success,
    this.error,
    required this.unAuthorizedRequest,
    required this.abp,
  });

  factory EditionsResponse.fromJson(Map<String, dynamic> json) {
    return EditionsResponse(
      result: json['result'] != null ? Result.fromJson(json['result']) : null,
      targetUrl: json['targetUrl'],
      success: json['success'],
      error: json['error'],
      unAuthorizedRequest: json['unAuthorizedRequest'],
      abp: json['__abp'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'result': result?.toJson(),
      'targetUrl': targetUrl,
      'success': success,
      'error': error,
      'unAuthorizedRequest': unAuthorizedRequest,
      '__abp': abp,
    };
  }
}

class Result {
  final List<Feature>? allFeatures;
  final List<EditionWithFeatures>? editionsWithFeatures;
  final int? tenantEditionId;

  Result({
    this.allFeatures,
    this.editionsWithFeatures,
    this.tenantEditionId,
  });

  factory Result.fromJson(Map<String, dynamic> json) {
    return Result(
      allFeatures: json['allFeatures'] != null
          ? List<Feature>.from(json['allFeatures'].map((x) => Feature.fromJson(x)))
          : [],
      editionsWithFeatures: json['editionsWithFeatures'] != null
          ? List<EditionWithFeatures>.from(
              json['editionsWithFeatures'].map((x) => EditionWithFeatures.fromJson(x)))
          : [],
      tenantEditionId: json['tenantEditionId'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'allFeatures': allFeatures?.map((x) => x.toJson()).toList(),
      'editionsWithFeatures': editionsWithFeatures?.map((x) => x.toJson()).toList(),
      'tenantEditionId': tenantEditionId,
    };
  }
}

class Feature {
  final String? name;
  final String? parentName;
  final String? displayName;
  final String? description;
  final String? defaultValue;
  final Metadata? metadata;
  final InputType? inputType;

  Feature({
    this.name,
    this.parentName,
    this.displayName,
    this.description,
    this.defaultValue,
    this.metadata,
    this.inputType,
  });

  factory Feature.fromJson(Map<String, dynamic> json) {
    return Feature(
      name: json['name'],
      parentName: json['parentName'],
      displayName: json['displayName'],
      description: json['description'],
      defaultValue: json['defaultValue'],
      metadata: json['metadata'] != null ? Metadata.fromJson(json['metadata']) : null,
      inputType: json['inputType'] != null ? InputType.fromJson(json['inputType']) : null,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'parentName': parentName,
      'displayName': displayName,
      'description': description,
      'defaultValue': defaultValue,
      'metadata': metadata?.toJson(),
      'inputType': inputType?.toJson(),
    };
  }
}

class Metadata {
  final int? dataType;
  final bool? isVisibleOnPricingTable;
  final bool? isVisibleOnTenantSubscription;

  Metadata({
    this.dataType,
    this.isVisibleOnPricingTable,
    this.isVisibleOnTenantSubscription,
  });

  factory Metadata.fromJson(Map<String, dynamic> json) {
    return Metadata(
      dataType: json['dataType'],
      isVisibleOnPricingTable: json['isVisibleOnPricingTable'],
      isVisibleOnTenantSubscription: json['isVisibleOnTenantSubscription'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'dataType': dataType,
      'isVisibleOnPricingTable': isVisibleOnPricingTable,
      'isVisibleOnTenantSubscription': isVisibleOnTenantSubscription,
    };
  }
}

class InputType {
  final String? name;
  final Map<String, dynamic>? attributes;
  final Validator? validator;
  final dynamic itemSource;

  InputType({
    this.name,
    this.attributes,
    this.validator,
    this.itemSource,
  });

  factory InputType.fromJson(Map<String, dynamic> json) {
    return InputType(
      name: json['name'],
      attributes: json['attributes'] ?? {},
      validator: json['validator'] != null ? Validator.fromJson(json['validator']) : null,
      itemSource: json['itemSource'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'attributes': attributes,
      'validator': validator?.toJson(),
      'itemSource': itemSource,
    };
  }
}

class Validator {
  final String? name;
  final int? minValue;
  final int? maxValue;
  final Map<String, dynamic>? attributes;

  Validator({
    this.name,
    this.minValue,
    this.maxValue,
    this.attributes,
  });

  factory Validator.fromJson(Map<String, dynamic> json) {
    return Validator(
      name: json['name'],
      minValue: json['minValue'],
      maxValue: json['maxValue'],
      attributes: json['attributes'] ?? {},
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'minValue': minValue,
      'maxValue': maxValue,
      'attributes': attributes,
    };
  }
}

class EditionWithFeatures {
  final Edition? edition;
  final List<FeatureValue>? featureValues;

  EditionWithFeatures({this.edition, this.featureValues});

  factory EditionWithFeatures.fromJson(Map<String, dynamic> json) {
    return EditionWithFeatures(
      edition: json['edition'] != null ? Edition.fromJson(json['edition']) : null,
      featureValues: json['featureValues'] != null
          ? List<FeatureValue>.from(json['featureValues'].map((x) => FeatureValue.fromJson(x)))
          : [],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'edition': edition?.toJson(),
      'featureValues': featureValues?.map((x) => x.toJson()).toList(),
    };
  }
}

class Edition {
  final String? name;
  final String? displayName;
  final String? publicDescription;
  final String? internalDescription;
  final bool? isPublished;
  final bool? isRegistrable;
  final int? type;
  final int? minimumUsersCount;
  final double? monthlyPrice;
  final double? annualPrice;
  final int? waitingDayAfterExpire;
  final int? trialDayCount;
  final int? countAllowExtendTrial;
  final bool? hasTrial;
  final bool? disableWorkspaceAfterExpire;
  final bool? isMostPopular;
  final bool? doNotSendVerifyEmail;
  final ExpiringEdition? expiringEdition;
  final String? seatsText;
  final String? buttonText;
  final String? buttonLink;
  final String? starterLineText;
  final String? editionColor;
  final int? id;

  Edition({
    this.name,
    this.displayName,
    this.publicDescription,
    this.internalDescription,
    this.isPublished,
    this.isRegistrable,
    this.type,
    this.minimumUsersCount,
    this.monthlyPrice,
    this.annualPrice,
    this.waitingDayAfterExpire,
    this.trialDayCount,
    this.countAllowExtendTrial,
    this.hasTrial,
    this.disableWorkspaceAfterExpire,
    this.isMostPopular,
    this.doNotSendVerifyEmail,
    this.expiringEdition,
    this.seatsText,
    this.buttonText,
    this.buttonLink,
    this.starterLineText,
    this.editionColor,
    this.id,
  });

  factory Edition.fromJson(Map<String, dynamic> json) {
    return Edition(
      name: json['name'],
      displayName: json['displayName'],
      publicDescription: json['publicDescription'],
      internalDescription: json['internalDescription'],
      isPublished: json['isPublished'],
      isRegistrable: json['isRegistrable'],
      type: json['type'],
      minimumUsersCount: json['minimumUsersCount'],
      monthlyPrice: (json['monthlyPrice'] != null) ? json['monthlyPrice'].toDouble() : null,
      annualPrice: (json['annualPrice'] != null) ? json['annualPrice'].toDouble() : null,
      waitingDayAfterExpire: json['waitingDayAfterExpire'],
      trialDayCount: json['trialDayCount'],
      countAllowExtendTrial: json['countAllowExtendTrial'],
      hasTrial: json['hasTrial'],
      disableWorkspaceAfterExpire: json['disableWorkspaceAfterExpire'],
      isMostPopular: json['isMostPopular'],
      doNotSendVerifyEmail: json['doNotSendVerifyEmail'],
      expiringEdition: json['expiringEdition'] != null
          ? ExpiringEdition.fromJson(json['expiringEdition'])
          : null,
      seatsText: json['seatsText'],
      buttonText: json['buttonText'],
      buttonLink: json['buttonLink'],
      starterLineText: json['starterLineText'],
      editionColor: json['editionColor'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'displayName': displayName,
      'publicDescription': publicDescription,
      'internalDescription': internalDescription,
      'isPublished': isPublished,
      'isRegistrable': isRegistrable,
      'type': type,
      'minimumUsersCount': minimumUsersCount,
      'monthlyPrice': monthlyPrice,
      'annualPrice': annualPrice,
      'waitingDayAfterExpire': waitingDayAfterExpire,
      'trialDayCount': trialDayCount,
      'countAllowExtendTrial': countAllowExtendTrial,
      'hasTrial': hasTrial,
      'disableWorkspaceAfterExpire': disableWorkspaceAfterExpire,
      'isMostPopular': isMostPopular,
      'doNotSendVerifyEmail': doNotSendVerifyEmail,
      'expiringEdition': expiringEdition?.toJson(),
      'seatsText': seatsText,
      'buttonText': buttonText,
      'buttonLink': buttonLink,
      'starterLineText': starterLineText,
      'editionColor': editionColor,
      'id': id,
    };
  }
}

class ExpiringEdition {
  final String? name;
  final String? displayName;
  final int? id;

  ExpiringEdition({this.name, this.displayName, this.id});

  factory ExpiringEdition.fromJson(Map<String, dynamic> json) {
    return ExpiringEdition(
      name: json['name'],
      displayName: json['displayName'],
      id: json['id'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'displayName': displayName,
      'id': id,
    };
  }
}

class FeatureValue {
  final String? name;
  final String? value;

  FeatureValue({this.name, this.value});

  factory FeatureValue.fromJson(Map<String, dynamic> json) {
    return FeatureValue(
      name: json['name'],
      value: json['value'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'value': value,
    };
  }
}
