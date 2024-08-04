import 'dart:convert';

class SheetUserFieldsModels {
  static String id = 'id';
  static String accounts = 'accounts';

  static List<String> getFields() => [id,accounts];
}

class Sheet{
  final int? id;
  final String? accounts;

  const Sheet({
    this.id,
    this.accounts
  });

  static Sheet fromJson(Map<String, dynamic> json) => Sheet(
    id: jsonDecode(json[SheetUserFieldsModels.id]),
    accounts: json[SheetUserFieldsModels.accounts] 
  );

  Map<String, dynamic> toJson() =>{
    SheetUserFieldsModels.id: id,
    SheetUserFieldsModels.accounts: accounts
  };
}