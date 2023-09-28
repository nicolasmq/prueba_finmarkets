class Urls {
  // base URL
  static const String baseUrl = "https://rest.coinapi.io/v1";
  // Api Keys
  static const String apiKey = "C278D26B-86FA-4AF4-ADCE-23CD65BA04D0";
  static const String apiKey2 = "A7D2AB45-225D-4C88-ACF7-3C16DE442B8C";
  static const String apiKey3 = "844A250E-68CB-4EE5-8263-1D5955C55D63";
  // currencies_list
  static const String assetsIconUrl = "$baseUrl/assets/icons/100";
  static const String allAssets = "$baseUrl/assets";
  static String assetById(String assetId) => "$baseUrl/assets/$assetId";
  static String filterAssetId(List<String> assetsIds) =>
      "$baseUrl/assets?filter_asset_id=${assetsIds.join(",")}";
  // asset-detail
  static const String periodsUrl = "$baseUrl/ohlcv/periods";
  static String symbolsUrl({String? filterExchangeId,String? assetId}) =>
      "$baseUrl/symbols?filter_symbol_id=BINANCE_SPOT_$assetId&filter_asset_id=$assetId";
  static String symbolsUrlByAssetId({String? assetId}) =>
      "$baseUrl/symbols?filter_asset_id=$assetId";

  static String ohlcvUrl(String symbolId, String periodId, String timeStart,
          {int? limit, bool? includeEmptyItems, DateTime? timeEnd}) =>
      "$baseUrl/ohlcv/$symbolId/history?period_id=$periodId&time_start=$timeStart";
}

class Lists {
  static const assetsIds = [
    "BTC",
    "DOGE",
    "USDT",
    "TRC",
    "ADA",
    "MINT",
    "LTC",
    "XRP",
    "ETH",
    "FTC",
    "TOR"
  ];
}

class ErrorsMessages {
  static const String badRequest = "There is something wrong with your request";
  static const String unauthorized = "Your API key is wrong";
  static const String forbidden =
      "Your API key doesnt't have enough privileges to access this resource";
  static const String tooManyRequests =
      "You have exceeded your API key rate limits";
  static const String noData =
      "You requested specific single item that we don't have at this moment";
}
