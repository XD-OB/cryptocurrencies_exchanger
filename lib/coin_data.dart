import 'networking.dart';
import 'constants.dart';

class       Crypto {

  dynamic  getData(String currency) async {
    NetworkHelper networkHelper = NetworkHelper(
      url: '$apiServer?key=$apiKey&ids=$kMainCurrencies&interval=1d&convert=$currency',
    );
    return await networkHelper.getCryptoData();
  }
}