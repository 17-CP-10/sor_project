import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:spotonresponse/data/Models/project_list_model.dart';
import 'package:spotonresponse/view/screens/incident/incident_list.dart';

import '../Models/incident_list_model.dart';

class UserApi {
  static Future<ProjectListModel?> fetchProjects({String? email}) async {
    try {
      final response = await http.get(Uri.parse(
          'https://app.spotonresponse.com/services/authservice.php?action=projectlist&email=ernie.dipko@gmail.com'));
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return ProjectListModel.fromJson(responseData);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }

  static Future<IncidentListModel?> getIncidentList({String? location}) async {
    try {
      final response = await http.post(
          Uri.parse(
              'https://app.spotonresponse.com/services/incidentService.php'),
          body: {
            "session":
                "eyJhbGciOiJSUzI1NiIsImtpZCI6IjJkM2E0YTllYjY0OTk0YzUxM2YyYzhlMGMwMTY1MzEzN2U5NTg3Y2EiLCJ0eXAiOiJKV1QifQ.eyJuYW1lIjoiTXVoYW1tYWQgSGFuZWVmIiwicGljdHVyZSI6Imh0dHBzOi8vbGgzLmdvb2dsZXVzZXJjb250ZW50LmNvbS9hL0FBY0hUdGNTc3FxUTNYaGsxVjhSSno3SjJUU0Z1ZEF4dTJiMVhWSFBrdVo2eUE9czk2LWMiLCJpc3MiOiJodHRwczovL3NlY3VyZXRva2VuLmdvb2dsZS5jb20vc29yLXByb2plY3QtMzg3MDE1IiwiYXVkIjoic29yLXByb2plY3QtMzg3MDE1IiwiYXV0aF90aW1lIjoxNjg1MDM1NTU4LCJ1c2VyX2lkIjoiWW1SZEtVVDh4RVpNYXBndXpqVWdlTVIyWGZmMiIsInN1YiI6IlltUmRLVVQ4eEVaTWFwZ3V6alVnZU1SMlhmZjIiLCJpYXQiOjE2ODUwMzU1NTgsImV4cCI6MTY4NTAzOTE1OCwiZW1haWwiOiJoYW5lZWY5MzkwN0BnbWFpbC5jb20iLCJlbWFpbF92ZXJpZmllZCI6dHJ1ZSwiZmlyZWJhc2UiOnsiaWRlbnRpdGllcyI6eyJnb29nbGUuY29tIjpbIjEwMTY5MTIyNzU3MDczMDY1MzIzMyJdLCJlbWFpbCI6WyJoYW5lZWY5MzkwN0BnbWFpbC5jb20iXX0sInNpZ25faW5fcHJvdmlkZXIiOiJnb29nbGUuY29tIn19.pC6D3EWF7tpYoO5eqH5F3S-OKOxbY2Tt7l1OsdkrWvrDThyyqHclfHSzKgOyuZvVIt80o-ul00QTzAd2cRk9yqnYzDeMU4dVAYgWkqIXuQhth-VpUQEb32FlefSQ8LzRd_nKpjZqlwYl9hk6A_cGH9CqNk5XwVKmR4gqZbuS8LIwN1L8_PksIG1NLTC5hJ8jeRL7QpVjZzBSgdgcmxRkyi2XqwXuR21cC0ZI4NW5SeWD-PFpDq0h_na36-QIeq5u_3R2KDJPw0ZkVO4KjxtEbWRFaCm6WCHwne4iMx4rGLef83RYL65lUgjHb1BZXmBWFF3jP1HmGSNZKDtOqb-kdQ",
            "loc": "LatLng(lat: 38.873847, lng: -77.129644)"
          });
      if (response.statusCode == 200) {
        Map<String, dynamic> responseData = jsonDecode(response.body);
        return IncidentListModel.fromJson(responseData);
      } else {
        return null;
      }
    } catch (e) {
      print(e.toString());
      return null;
    }
  }
}
