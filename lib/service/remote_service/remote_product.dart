
import 'package:http/http.dart' as http;

import '../../const.dart';

class  RemoteProductService {
  var client = http.Client();
  var remoteUrl= '$baseUrl/api/products';
  Future<dynamic> get() async {
    var response = await client.get(
        Uri.parse('$remoteUrl?populate=image,tags')
    );
    return response;
  }
  
  Future<dynamic> getByName({required String keyword}) async{
    var response = await client.get(
      Uri.parse('$remoteUrl/?populate=image,tags&filters[name][\$contains]=$keyword')
    );
    return response;
  }
  Future<dynamic> getByCategory({required int id}) async{
    var response = await client.get(
        Uri.parse('$remoteUrl/?populate=image,tags&filters[category][id]=$id')
    );
    return response;
  }
}
//http://localhost:1337/api/products?populate=image,tags