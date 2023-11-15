import 'package:acarreos/screens/maps.dart';
import 'package:acarreos/widgets/dialogVerficiacionSuccess.dart';
import 'package:flutter/material.dart';

class HomePageScreen extends StatefulWidget {
  const HomePageScreen({super.key});

  @override
  State<HomePageScreen> createState() => _HomePageScreenState();
}

class _HomePageScreenState extends State<HomePageScreen> {
  final _destinoController = TextEditingController();
  final _dineroController = TextEditingController();
  final GlobalKey<ScaffoldState> _key = GlobalKey();

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return SafeArea(
      child: Scaffold(
        key: _key,
        drawer: CustomDrawer(),
        backgroundColor: Colors.transparent,
        body: SizedBox(
          height: media.height,
          width: media.width,
          child: Stack(
            children: [
              const MapScreen(),
              Align(
                alignment: Alignment.bottomCenter,
                child: Container(
                    height: media.height * 0.3,
                    width: media.width,
                    decoration: const BoxDecoration(
                        color: Colors.blue,
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(60),
                          topRight: Radius.circular(60),
                        ),
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          image: AssetImage(
                            "assets/fondologin.jpg",
                          ),
                        )),
                    child: Column(
                      children: [
                        const SizedBox(
                          height: 50,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'Destino: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              SizedBox(
                                // height: 200,
                                width: 230,
                                child: TextField(
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                  obscureText: false,
                                  controller: _destinoController,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: ''),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Container(
                          height: 50,
                          width: 350,
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Row(
                            children: [
                              const SizedBox(
                                width: 20,
                              ),
                              const Text(
                                'COP: ',
                                style: TextStyle(fontSize: 20),
                              ),
                              const SizedBox(
                                width: 10,
                              ),
                              SizedBox(
                                // height: 200,
                                width: 200,
                                child: TextField(
                                  style: const TextStyle(
                                    fontSize: 30,
                                  ),
                                  textAlign: TextAlign.center,
                                  obscureText: false,
                                  controller: _dineroController,
                                  keyboardType: TextInputType.number,
                                  decoration: const InputDecoration.collapsed(
                                      hintText: 'XX.XXX'),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        Row(
                          children: [
                            const SizedBox(
                              width: 25,
                            ),
                            GestureDetector(
                              onTap: () {
                                showDialog(
                                    context: context,
                                    builder: (BuildContext context) =>
                                        CustomDialogVerificacionSucesses(
                                          textUp: 'Verificación',
                                          textDown:
                                              'CODIGO DE TIENDA APLICADO CORRECTAMENTE',
                                        ));
                              },
                              child: Container(
                                height: 50,
                                width: 240,
                                decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(40),
                                ),
                                child: const Center(
                                  child: Text(
                                    'Buscar Tranportista',
                                    style: TextStyle(
                                      fontSize: 20,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                            const SizedBox(
                              width: 20,
                            ),
                            Container(
                              height: 47,
                              width: 80,
                              decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(40),
                              ),
                              child: Center(
                                child: Image.asset(
                                  'assets/icons/preferencias.png',
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    )),
              ),
              Column(
                children: [
                  const SizedBox(
                    height: 20,
                  ),
                  GestureDetector(
                    onTap: () {
                      print('object');
                      _key.currentState!.openDrawer();
                      print('object2');
                    },
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Row(
                        children: [
                          SizedBox(
                            width: 25,
                          ),
                          Icon(
                            Icons.menu,
                            color: Colors.black,
                            size: 30,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class CustomDrawer extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage(
                'assets/fondologin.jpg'), // Reemplaza con la ruta de tu imagen de fondo
            fit: BoxFit.cover,
          ),
        ),
        child: Column(
          children: <Widget>[
            DrawerHeader(
              child: Column(
                children: [
                  GestureDetector(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Align(
                      alignment: Alignment.topLeft,
                      child: Icon(
                        Icons.menu,
                        color: Colors.white,
                        size: 30,
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 10,
                  ),
                  const Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CircleAvatar(
                        backgroundImage: AssetImage(
                            'assets/icons/iconprofile.png'), // Reemplaza con la ruta de tu imagen de perfil
                        radius: 40.0,
                      ),
                      SizedBox(height: 20.0),
                      Column(
                        children: [
                          SizedBox(
                            height: 30,
                          ),
                          Text(
                            '     mirusame@gmail.com',
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Text(
                  'Cambiar el Estado',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Text(
                  'Historial de servicios',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Text(
                  'Configuración',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Text(
                  'Ayuda',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            Container(
              height: 80,
              width: 400,
              decoration: BoxDecoration(
                color: Colors.transparent,
                border: Border.all(
                  color: Colors.grey,
                ),
              ),
              child: const Center(
                child: Text(
                  'Soporte',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
