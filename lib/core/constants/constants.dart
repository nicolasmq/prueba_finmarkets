
class Urls {

  static const String baseUrl = "https://rest.coinapi.io/v1";
  static const String apiKey = "C278D26B-86FA-4AF4-ADCE-23CD65BA04D0";
  static const String assetsIconUrl = "$baseUrl/assets/icons/32?apikey=$apiKey";
  static const String allAssets = "$baseUrl/assets=$apiKey";
  static String assetById (String assetId) => "$baseUrl/assets/$assetId?apikey=$apiKey";
  static String filterAssetId (List<String> assetsId) => "$baseUrl/assets/$assetsId?apikey=$apiKey";

}