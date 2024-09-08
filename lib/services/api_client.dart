import 'dart:convert';
import 'package:http/http.dart' as http;

class ApiClient {
  
  final Uri currencyURL = Uri.http(
    "v6.exchangerate-api.com",
    "/v6/a0db2761bf7ca8c31843f892/latest/USD",
  );

  Future<List<String>> getCurrencies() async {
    http.Response res = await http.get(currencyURL);

    if (res.statusCode == 200) {
      var body = jsonDecode(res.body);

      if (body["result"] == "success") {
        var conversionRates = body["conversion_rates"];
        List<String> currencies = (conversionRates.keys).toList();
        return currencies;
      } else {
        throw Exception("Error in API: ${body['error-type']}");
      }
    } else {
      throw Exception("Failed to connect to API");
    }
  }
  Future<double> getRate(String from, String to) async{
  final String apiKey = 'a0db2761bf7ca8c31843f892';
  final Uri rateURL = Uri.https(
    "v6.exchangerate-api.com",
    "/v6/$apiKey/pair/$from/$to",
  );
  http.Response res = await http.get(rateURL);
   if (res.statusCode == 200) {
    var data = jsonDecode(res.body);
    double rate = data['conversion_rate'];
    return rate;
  } else {
    // Throw an error if the API call failed
    throw Exception("Failed to load exchange rate");
  }
}
}
