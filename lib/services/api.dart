import 'package:dio/dio.dart';

const baseURL =
    "https://discovery.tekoapis.com/api/v1/product?productId=535038&sku=230900684&location=&terminalCode=phongvu";

Future<dynamic> getProduct() async {
  final dio = Dio();
  final response = await dio.get(baseURL);
  return response.data;
}
