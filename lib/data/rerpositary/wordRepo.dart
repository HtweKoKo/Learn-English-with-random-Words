import 'dart:convert';

import 'package:http/http.dart';
import 'package:learnenglish/constant/apiConstatnt.dart';
import 'package:learnenglish/utilities/requestType.dart';

import '../api/apiService.dart';

class WordRepo {
  ApiService apiService = ApiService();
  Future<dynamic> getWords(counts) async {
  print("Word call");

    String _uriString = "$base_url$count=$counts";
    var response = await apiService.request(
        uriString: _uriString,
        header: headerWords,
        requestType: RequestType.GET);
    if (response.statusCode == 200) {
    var responseBody = jsonDecode(response.body);

      print("$responseBody ++++++++++==");
      return responseBody;
    }
  }

  Future<List<dynamic>> getcustomRandomWords({counts, minwordlengths, includes, excludes, beginWiths, }) async {
    var uri = "${base_url}minLength=$minwordlengths&count=$counts&includes=$includes&excludes=$excludes&beginsWith=$beginWiths";
    Response response = await apiService.request(
        uriString: uri,
        requestType: RequestType.GET,
        header: headerWords);
    List<dynamic> responseBody = jsonDecode(response.body);
    print(responseBody);
    print("${responseBody.runtimeType} +++++++++");
   
      return responseBody;
    
  }
}
