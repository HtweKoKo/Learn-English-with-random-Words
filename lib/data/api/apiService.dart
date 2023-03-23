
import 'package:learnenglish/utilities/requestType.dart';
import 'package:http/http.dart' as http;
import 'package:learnenglish/utilities/requestTypeNotFoundException.dart';

class ApiService {
  Future request(
      {required String uriString,
      required RequestType requestType,
      Map<String, String>? header,
      dynamic body}) async {
    switch (requestType) {
      case RequestType.GET:
        return http.get(
          Uri.parse(uriString),
          headers: header,
        );

        break;

      case RequestType.POST:
        return http.post(
          Uri.parse(uriString),
          headers: header,
          body: body,
        );
        break;

      default:
        return throw RequestTypeNotFoundException("error occured");
    }
  }
  var headers = {
  'content-type': 'application/x-www-form-urlencoded',
  'Accept-Encoding': 'application/gzip',
  'X-RapidAPI-Key': '426a767badmsh42bbef1d54b5fcap105f9djsn2292690895b9',
  'X-RapidAPI-Host': 'google-translate1.p.rapidapi.com'
};

}
