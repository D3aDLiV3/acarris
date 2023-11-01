import 'package:acarreos/firebase/firebase_auth.dart';
import 'package:acarreos/widgets/passwordtextfield.dart';
import 'package:acarreos/widgets/textfield.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  // ignore: prefer_const_constructors_in_immutables
  LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final FirebaseAuthService _auth = FirebaseAuthService();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  // final _codigoTiendaController = TextEditingController();

  bool rememberMe = false;

  bool obscurePassword = true;

  bool obscureCodigo = true;

  double value = 15;
  double btnre = 15;

  Color getColor(Set<MaterialState> states) {
    const Set<MaterialState> interactiveStates = <MaterialState>{
      MaterialState.hovered,
      MaterialState.focused,
    };
    if (states.any(interactiveStates.contains)) {
      return Colors.white;
    }
    return Colors.white;
  }

  void _signUp() async {
    String email = _emailController.text;
    String password = _passwordController.text;

    User? user = await _auth.signInWithEmailAndPassword(email, password);

    if (user != null) {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Exitoso '),
            content: const Text('El inicio de sesion ha sido exitoso.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('OK'),
              ),
            ],
          );
        },
      );
    } else {
      if (!mounted) return;
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            title: const Text('Error!'),
            content: const Text(
                'El usuario o la contraseña no se encuentra en la base de datos.'),
            actions: <Widget>[
              TextButton(
                onPressed: () {
                  Navigator.of(context).pop(); // Close the dialog
                },
                child: const Text('Reintentar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              "assets/fondologin.jpg",
              fit: BoxFit.cover,
              width: media.width,
              height: media.height,
            ),
          ),
          Row(
            children: [
              SizedBox(
                // color: Colors.red,
                height: 932,
                width: 430,
                child: Column(
                  children: [
                    const SizedBox(
                      height: 100,
                    ),
                    ClipOval(
                      child: Container(
                        height: 166,
                        color: Colors.white,
                        child: Padding(
                          padding: const EdgeInsets.all(20.0),
                          child: Image.asset('assets/icons/iconprofile.png'),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: TextFieldLogin(
                        height: 58,
                        width: 402,
                        controller: _emailController,
                      ),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0, right: 10.0),
                      child: PasswordTextField(
                          height: 58,
                          width: 402,
                          codigoTiendaController: _passwordController,
                          obscure: obscurePassword),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(left: 130, top: 0),
                          child: GestureDetector(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Olvide mi contraseña'),
                                    content: const Text(
                                        'Enviando correo para el cambio de contraseña'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: const Text('Confirmar'),
                                      ),
                                    ],
                                  );
                                },
                              );
                              //Navigator.pushNamed(context, '');
                            },
                            child: const Text(
                              'Olvide mi contraseña',
                              style: TextStyle(
                                fontFamily: 'DarkerGrotesque',
                                fontSize: 17,
                                letterSpacing: 0.5,
                                color: Colors.white,
                                decoration: TextDecoration.underline,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          value = 17;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          value = 15;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 120,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(60)),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: FloatingActionButton(
                            hoverColor: Colors.black26,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200)),
                            ),
                            backgroundColor: Colors.white,
                            onPressed: () {
                              _signUp();
                            },
                            child: Center(
                              child: Text(
                                'Ingresar',
                                style: TextStyle(
                                    fontSize: value, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    const Text(
                      'O',
                      style: TextStyle(color: Colors.white, fontSize: 20),
                    ),
                    const SizedBox(
                      height: 25,
                    ),
                    MouseRegion(
                      onEnter: (event) {
                        setState(() {
                          btnre = 17;
                        });
                      },
                      onExit: (event) {
                        setState(() {
                          btnre = 15;
                        });
                      },
                      child: Container(
                        height: 50,
                        width: 190,
                        decoration: BoxDecoration(
                            color: Colors.black,
                            borderRadius: BorderRadius.circular(60)),
                        child: Padding(
                          padding: const EdgeInsets.all(1.0),
                          child: FloatingActionButton(
                            hoverColor: Colors.black26,
                            shape: const RoundedRectangleBorder(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(200)),
                            ),
                            backgroundColor: Colors.white,
                            onPressed: () {
                              showDialog(
                                context: context,
                                builder: (BuildContext context) {
                                  return AlertDialog(
                                    title: const Text('Register'),
                                    content: const Text(
                                        'Boton que lleva al register.'),
                                    actions: <Widget>[
                                      TextButton(
                                        onPressed: () {
                                          Navigator.of(context)
                                              .pop(); // Close the dialog
                                        },
                                        child: const Text('Salir'),
                                      ),
                                    ],
                                  );
                                },
                              );
                            },
                            child: Center(
                              child: Text(
                                'Registrarme',
                                style: TextStyle(
                                    fontSize: btnre, color: Colors.black),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
