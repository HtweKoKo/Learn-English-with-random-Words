class LanguageName {
  String? language;
  String? name;

  LanguageName({this.language, this.name});

  LanguageName.fromJson(Map<String, dynamic> json) {
    language = json['language'];
    name = json['name'];
    
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['language'] = this.language;
    data['name'] = this.name;
    return data;
  }
}



















// // {
// //     "data": {
// //         "languages": [
// //             {
// //                 "language": "af",
// //                 "name": "Afrikaans"
// //             },