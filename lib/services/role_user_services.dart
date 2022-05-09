import 'dart:convert';

import 'package:academy_shell/models/role_user_model.dart';
import 'package:http/http.dart' as http;

var url =
    'http://dev-system.academyshell.com/api/v1/academy/roles?page=1&rowsPerPage=25&sortBy=id&descending=false&query=&filters={}';

class RoleUserServices {
  Future<List<RoleUserModel>?> getRoles() async {
    var client = http.Client();
    var uri = Uri.parse(url);
    var response = await client.get(uri, headers: {
      "Content-Type": "application/json",
      "Accept": "application/json",
      "Authorization":
          "Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiYzJjNDU5MTU1MzkwYWMwMmRhODYwY2NkYzU0OTg2M2IxMDI5ZWY2ZjlmNjc5ODUxMjcxMGUzMjM3YjBhOGFjZjI0NDhiYzkzNGE2MzQ5YWUiLCJpYXQiOjE2NTE3MjM5MDQuNTYxMzY3LCJuYmYiOjE2NTE3MjM5MDQuNTYxMzg2LCJleHAiOjE2ODMyNTk5MDQuNTU3MjcxLCJzdWIiOiIxIiwic2NvcGVzIjpbImFjYWRlbXktdXNlciJdfQ.YbK1WAv5g1ulCb9HTT4HDVyXoxHRAC2dMFmtpS1_dpwxKeoSh4gcIHQ2VNfZrxkOW5OE0mF6tY5kE68g-FfXTL-PKkgCQBZ5r5B3C3LVBVJjJrC1kDBbtOZq9xEdS71SDutHlPNXfnlZFkSkqXLDnrCGlumt4gpBxkTc-2_ZamZiuADwrhiWb_dhF7YcOVnzChauyLp-BY7nY4FxFEAKR85Hn8oIx2M2E79OyJNzhvkxwMIv_kH8ZJ4aGpAMtvQqpK_iaR5tkiuh0qZpx1SZMNVyJZ7VQ9uAXy9F5GdTfPSGbd97a5VV-fdTOeFHi1X3AmnCHO8dxIyfnV3kfPQufjZbQg4dluMgoEZYqpqUPz-e8vFd4tdsBEw3tw3Q6hnjYRF_94wI44UscB2RSd2cdI1P0CCk8GyB_reFoz5_nKo9LfFsfIo6krRHl9CvNw291gqg6_khE7yGrLBV6wM1yNIAn3OoiGEevRaRuopBBAWYp1aspfA2o0Av1pmmFPy-J4y8ztMX6TSIfLCLQ4McPBO1EG1WvDU_tRZqRNES8O8n_Mpj0yynHOCb2sDk_Ly1daud3M_T_K0wo4-AHD90Hy7ss1UqWbVBjBww6NxiZ1eYY5WJre3dbgNsIszeamgOkKB1xfL1C_XTUOCfY2nrOspyxyFGaG0_cIqRmjg4xZY"
    });
    if (response.statusCode == 200 || response.statusCode == 201) {
      var json = response.body;
      var bodydata = jsonDecode(json) as Map<String, dynamic>;
      var data = bodydata["data"];
      List<RoleUserModel> list = [];
      data.forEach((element) {
        list.add(RoleUserModel.fromJson(element));
      });
      return list;
    } else {
      return [];
    }
  }
}
