// import 'dart:convert';
// import 'dart:io';
//
// import 'package:quliku/model/response/login/login_response.dart';
// import 'package:quliku/model/response/mandor_detail/mandor_detail_response.dart';
// import 'package:quliku/model/response/mandor_reccomend/mandor_reccomendation_response.dart';
// import 'package:quliku/model/response/mandor_search/mandor_search_response.dart';
// import 'package:quliku/model/response/register/register_response.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter_dotenv/flutter_dotenv.dart';
// import 'package:quliku/model/response/update_profile/update_profile_response.dart';
// import 'package:quliku/model/response/wishlist/mandor_wishlist_response.dart';
//
// class Network {
//   Future<MandorReccomendationResponse> getReccomendedMandor(
//       String token) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().get(
//         Uri.parse('$baseurl/api/contractor/foreman/recommendation'),
//         headers: {"Authorization": "Bearer $token"});
//     if (response.statusCode >= 400) throw Exception();
//     return MandorReccomendationResponse.fromJson(json.decode(response.body));
//   }
//
//   Future<MandorSearchResponse> getSearchMandor(
//       String name, String classification, String city) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().get(Uri.parse(
//         '$baseurl/api/contractor/foreman/search?name=$name&classification=$classification&city=$city'));
//     if (response.statusCode >= 400) throw Exception();
//     return MandorSearchResponse.fromJson(json.decode(response.body));
//   }
//
//   Future<MandorWishlistResponse> getWishlistMandor(String token) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().get(
//         Uri.parse('$baseurl/api/contractor/foreman/wishlist'),
//         headers: {"Authorization": "Bearer $token"});
//
//     if (response.statusCode >= 400) throw Exception();
//     return MandorWishlistResponse.fromJson(json.decode(response.body));
//   }
//
//   Future<UpdateProfileResponse> updateProfile(
//       String token,
//       String name,
//       String email,
//       String password,
//       String password_confirmation,
//       File img) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final request = http.MultipartRequest(
//         'POST', Uri.parse('$baseurl/api/contractor/auth/update'));
//     request.headers.addAll({"Authorization": "Bearer $token"});
//     request.fields['name'] = name;
//     request.fields['email'] = email;
//     request.fields['password'] = password;
//     request.fields['password_confirmation'] = password_confirmation;
//     request.files.add(http.MultipartFile(
//         'picture', img.readAsBytes().asStream(), img.lengthSync(),
//         filename: "profile.png"));
//
//     var responseStream = await request.send();
//     var responseByte = await responseStream.stream.toBytes();
//     var response = String.fromCharCodes(responseByte);
//     if (responseStream.statusCode >= 400) throw Exception();
//     return UpdateProfileResponse.fromJson(json.decode(response));
//   }
//
//   Future<bool> deleteWishlistMandor(String token, int id) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().delete(
//         Uri.parse('$baseurl/api/contractor/foreman/wishlist?foreman_id=$id'),
//         headers: {"Authorization": "Bearer $token"});
//
//     if (response.statusCode >= 400) return false;
//     return true;
//   }
//
//   Future<bool> addWishlistMandor(String token, int id) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().post(
//         Uri.parse('$baseurl/api/contractor/foreman/wishlist?foreman_id=$id'),
//         headers: {"Authorization": "Bearer $token"});
//
//     if (response.statusCode >= 400) return false;
//     return true;
//   }
//
//   Future<MandorDetailResponse> getDetailMandor(String token, String id) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().get(
//         Uri.parse('$baseurl/api/contractor/foreman/detail/$id'),
//         headers: {"Authorization": "Bearer $token"});
//     if (response.statusCode >= 400) throw Exception();
//     return MandorDetailResponse.fromJson(json.decode(response.body));
//   }
//
//   Future<RegisterResponse> register(
//       name, username, email, password, passwordConfirmation) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().post(
//       Uri.parse("$baseurl/api/contractor/auth/register"),
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded",
//       },
//       encoding: Encoding.getByName('utf-8'),
//       body: {
//         "name": name,
//         "username": username,
//         "email": email,
//         "password": password,
//         "password_confirmation": passwordConfirmation
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return RegisterResponse.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Gagal mendaftar, pastikan email dan password sudah pas");
//     }
//   }
//
//   Future<LoginResponse> login(email, password) async {
//     var baseurl = dotenv.env['BASE_URL'] ?? "";
//
//     final response = await http.Client().post(
//       Uri.parse("$baseurl/api/contractor/auth/login"),
//       headers: {
//         "Content-Type": "application/x-www-form-urlencoded",
//       },
//       encoding: Encoding.getByName('utf-8'),
//       body: {
//         "email": email,
//         "password": password,
//       },
//     );
//
//     if (response.statusCode == 200) {
//       return LoginResponse.fromJson(json.decode(response.body));
//     } else {
//       throw Exception("Gagal Login, pastikan email dan password sudah pas");
//     }
//   }
// }
