import 'package:dio/dio.dart';
import '../models/data_package_model.dart';
class RepoServices {
  final Dio dio = Dio();

  Future<List<DataPackageModel>> getDataPackages() async {
    try {
      final response = await dio.get(
        "https://cms.ntc.net.np/api/datapackage-mobile",
        options: Options(
          method: "GET",
        ),
      );

      if (response.statusCode == 200) {
        final dataResponse = response.data;
        final  packageList = dataResponse["data"]["gsm"]["prepaid"]  as List<dynamic>;


        final List<DataPackageModel> data = packageList.map((e) => DataPackageModel.fromJson(e)).toList();
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


