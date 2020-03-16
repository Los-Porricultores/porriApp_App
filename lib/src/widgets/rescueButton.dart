import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:porri_app/src/widgets/commonModal.dart';

class RescueButton extends StatelessWidget {
  final String modalTitle = 'Porri Rescate',
      modalMessage =
          'Al activar esta alerta se informará a todos los porricultores de tu estado de emergencia junto con tu posición.\n¿Estás seguro?',
      modalNegativeButton = 'No, cancelar rescate',
      modalPositiveButton = 'Sí, estoy seguro',
      buttonText = 'SOS';

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          backgroundColor: Colors.transparent,
          context: context,
          builder: (BuildContext buildContext) {
            return CommonModal(modalTitle, modalMessage, modalNegativeButton,
                modalPositiveButton);
          },
        );
      },
      backgroundColor: Colors.redAccent,
      child: Text(
        buttonText,
        style: TextStyle(color: Colors.white),
      ),
    );
  }
}
