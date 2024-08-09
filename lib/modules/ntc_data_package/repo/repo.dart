import 'package:dio/dio.dart';


import '../data_package_model.dart';
 // Import the file where your models are def
class RepoServices {
  final Dio dio = Dio();

  Future<List<DataPackageModel>> getDataPackages() async {
    try {
      print("hello");
      final response = await dio.get(
        "https://cms.ntc.net.np/api/datapackage-mobile",
        options: Options(
          method: "GET",
        ),
      );

      if (response.statusCode == 200) {
        final dataResponse = response.data;
        final  packageList = dataResponse["data"]["gsm"]["prepaid"]  as List<dynamic>;
        print("response is $packageList");


        final List<DataPackageModel> data = packageList.map((e) => DataPackageModel.fromJson(e)).toList();
        print("--------------------------------Data is $data");
        return data;
      } else {
        throw Exception('Failed to load data: ${response.statusMessage}');
      }
    } catch (e,s) {
      print("Error $s");
      throw Exception("Error $e");
    }
  }
}
