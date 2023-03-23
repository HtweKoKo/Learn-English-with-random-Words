
import 'dart:convert';

import 'package:http/http.dart';
import 'package:learnenglish/constant/apiConstatnt.dart';
import 'package:learnenglish/data/api/apiService.dart';
import 'package:learnenglish/data/model/getlanguage.dart';
import 'package:learnenglish/utilities/requestType.dart';

class TranslateRepo {
  ApiService apiService = ApiService();

  Future<List<LanguageName>> getlanguage({required String targetText}) async {
    String uriString = "$base_urlGetLanguage?target=$targetText";
    var response = await apiService.request(
        uriString: uriString,
        requestType: RequestType.GET,
        header: headerTranslate);

    var resDecode = jsonDecode(response.body);
    var list = resDecode["data"]["languages"] as List;
    var result = list.map((e) => LanguageName.fromJson(e)).toList();
    print(result[8].language);
    return result;
  }

  Future<List<dynamic>> translateText({
    required String languageCodeFrom,
    required String languageCodeto,
    required List<String> text,
  }) async {
    print("Translate Call");
    print("$text to Translate");
    String uriString = base_url_rapidTranslate;
    Map<String, dynamic> body = {
      "from": languageCodeFrom,
      "to": languageCodeto,
      "e": "",
      "q": text
    };
    Response response = await apiService.request(
        uriString: uriString,
        requestType: RequestType.POST,
        header: headerRapid,
        body: jsonEncode(body));

    List<dynamic> responseData = jsonDecode(response.body);
    print(responseData);
    return responseData;
  }
}
