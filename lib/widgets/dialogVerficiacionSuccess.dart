// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

// ignore: must_be_immutable
class CustomDialogVerificacionSucesses extends StatefulWidget {
  String textUp;
  String textDown;
  bool respuesta;

  CustomDialogVerificacionSucesses({
    Key? key,
    this.respuesta = true,
    required this.textDown,
    required this.textUp,
  }) : super(key: key);

  @override
  State<CustomDialogVerificacionSucesses> createState() =>
      _CustomDialogVerificacionSucessesState();
}

class _CustomDialogVerificacionSucessesState
    extends State<CustomDialogVerificacionSucesses> {
  Color color = Colors.white;
  Color colorText = Colors.black;

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;

    return Container(
      height: media.height,
      width: media.width,
      color: Colors.transparent,
      child: Dialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(0.0)),
        elevation: 0.0,
        backgroundColor: Colors.transparent,
        child: Align(
          alignment: Alignment.bottomCenter,
          child: Container(
              height: media.height * 0.4,
              width: media.width,
              decoration: const BoxDecoration(
                color: Color(0xff433F3F),
                borderRadius: BorderRadius.all(Radius.circular(80)),
              ),
              child: Column(
                children: [
                  const SizedBox(
                    height: 80,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '       Por favor espere, ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 70,
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        ' buscando un prestador',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const Row(
                    children: [
                      SizedBox(
                        width: 50,
                      ),
                      Text(
                        '          de servicio...',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 20,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 60,
                  ),
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).pop();
                    },
                    child: Container(
                      height: 40,
                      width: 200,
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.all(Radius.circular(80)),
                      ),
                      child: const Center(
                          child: Text(
                        'Cancelar solicitud',
                        style: TextStyle(fontSize: 20),
                      )),
                    ),
                  )
                ],
              )),
        ),
      ),
    );
  }
}
