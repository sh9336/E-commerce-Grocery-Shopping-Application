import 'package:http/http.dart' as http;
import 'package:shop/const.dart';
class RemoteBannerService {
  var client = http.Client();
  var remoteUrl = '$baseUrl/api/banners';
  //var remoteUrl = 'http://192.168.43.186:1337/api/banners';
  Future<dynamic> get() async {
    var response = await client.get(
      Uri.parse('$remoteUrl?populate=image')
    );
    return response;
  }
}
// List<AddBanner> addBannerListFromJson(String val) => List<AddBanner>.from(
//     json.decode(val)['data']?.map((banner)  => AddBanner.fromJson(banner))?.toList() ?? []
// );