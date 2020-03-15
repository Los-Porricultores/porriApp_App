import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class RescueButton extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
        onPressed: () {
          showModalBottomSheet(
              backgroundColor: Colors.transparent,
              context: context,
              builder: (BuildContext bc) {
                return Container(
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(
                      topLeft: Radius.circular(35),
                      topRight: Radius.circular(35),
                    ),
                  ),
                  child: Wrap(
                    children: <Widget>[
                      ListTile(
                        title: new Text(
                          'Porri Rescate',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      ListTile(
                        title: new Text(
                          'Al activar esta alerta se informará a todos los porricultores de tu estado de emergencia junto con tu posición\n¿Estás seguro?',
                          softWrap: true,
                          textAlign: TextAlign.center,
                          style: TextStyle(color: Colors.grey),
                        ),
                      ),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: <Widget>[
                            Chip(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              backgroundColor: Colors.redAccent,
                              label: Text('No, cancelar rescate'),
                            ),
                            Chip(
                              padding: EdgeInsets.symmetric(horizontal: 10),
                              backgroundColor: Colors.lightGreen,
                              label: Text('Sí, estoy seguro'),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                );
              });
        },
        backgroundColor: Colors.redAccent,
        child: Text(
          'SOS',
          style: TextStyle(color: Colors.white),
        ));
  }
}
