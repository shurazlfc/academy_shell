import 'package:academy_shell/services/controller/app_exceptiom.dart';
import 'package:academy_shell/services/controller/dialogue_helper.dart';
import 'package:flutter/material.dart';

class BaseController {
    handleError(error) {
    if (error is BadRequestException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message.toString());
    } else if (error is FetchDataException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message.toString());
    } else if (error is ApiNotRespondingException) {
      var message = error.message;
      DialogHelper.showErrorDialog(description: message.toString());
    }
  }
}
