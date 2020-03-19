import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porri_app/src/controllers/navigationController.dart';
import 'package:porri_app/src/controllers/serviceLocator.dart';
import 'package:porri_app/src/widgets/commonModal.dart';

class BumperCarsButtonWidget extends StatelessWidget {
  final String modalTitle = 'Porri Coches de Choque',
      modalMessage =
          'Al activar esta llamada se informará a todos los porricultores del'
          ' mejor momento de la noche.\n¿Estás seguro?',
      modalNegativeButton = 'No, cancelar llamada',
      modalPositiveButton = 'Sí, estoy seguro';

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext buildContext) {
            return CommonModal(modalTitle, modalMessage, modalNegativeButton,
                modalPositiveButton, () {
              sl<NavigationController>().pop();
            }, () {});
          },
        );
      },
      backgroundColor: Colors.lightGreen,
      child: Icon(
        Icons.directions_car,
        color: Colors.white,
      ),
    );
  }
}
