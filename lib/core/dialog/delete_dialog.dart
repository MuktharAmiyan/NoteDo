import 'package:notedo/core/dialog/dialog_model.dart';

class DeleteDialog extends AlertDialogModel<bool> {
  final String nameOfObject;

  DeleteDialog(this.nameOfObject)
      : super(
            title: 'Delete $nameOfObject',
            message: 'Are you sure you want to delete this $nameOfObject',
            buttons: {
              'Cancel': false,
              'Delete': true,
            });
}
