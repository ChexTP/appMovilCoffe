import 'package:flutter/material.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [        
        Container(
          height: 500,
          width: double.infinity,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: [Color.fromARGB(255, 41, 28, 171),Color.fromARGB(255, 0, 0, 116)]),
            // color: const Color.fromARGB(255, 41, 28, 171),
            borderRadius: BorderRadius.only(bottomLeft: Radius.circular(40),bottomRight:Radius.circular(40) )),
          ),
        Positioned.fill(
          top: 110,
          child: Align(
            alignment: Alignment.topCenter,
            child: Image.asset('assets/logo.png',scale: 0.9,)),
          ),
        Padding(
          padding: const EdgeInsets.only(top: 350,left: 40,right: 40,bottom: 40),
          child: SafeArea(
            child: SingleChildScrollView(
              child: Container(
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(20)),
                  color: Colors.white,
                  boxShadow: [BoxShadow(
                    color: Colors.grey,
                    spreadRadius: 2,
                    blurRadius: 10,
                    blurStyle: BlurStyle.normal,
                    offset: Offset(0, 10)
                  )],
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 50),
                  child: Center(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          const Text(
                            'Bienvenido',
                            style:TextStyle(color:Color.fromARGB(255, 41, 28, 171),
                              fontSize: 26,
                              fontWeight: FontWeight.w500) ,),
                          const SizedBox(height: 30,), 
                          TextFormField(
                                  controller: _emailController,
                                  style: const TextStyle(fontSize: 18),
                                  decoration: InputDecoration(
                                    filled: true,
                                    fillColor: const Color.fromARGB(255, 239, 238, 238),
                                    labelText: "Email",
                                    labelStyle: const TextStyle(
                                      // backgroundColor: Colors.white,
                                      fontSize: 15,
                                      color: Colors.black45,
                                      fontWeight: FontWeight.w700,
                                      ),
                                    hintStyle: const TextStyle(fontSize: 15),
                                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                                    floatingLabelBehavior: FloatingLabelBehavior.auto,
                                    focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.0),
                                      borderSide: const BorderSide(color: Color.fromARGB(255, 41, 28, 171), width: 2.0), // Color del borde cuando está en foco
                                    ),
                                    errorStyle:const  TextStyle(
                                      color: Colors.red,
                                      fontStyle: FontStyle.italic,
                                      fontSize: 14.0)
                                  ),
                                  validator: (value) {
                                    if(value == null || value.isEmpty){
                                      return "email requerido";
                                    }
                                    return null;
                                  },
                                ),
                          const SizedBox(height: 30,),      
                          TextFormField(
                            controller: _emailController,
                            style: const TextStyle(fontSize: 18),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: const Color.fromARGB(255, 239, 238, 238),
                              labelText: "Contraseña",
                              labelStyle: const TextStyle(
                                // backgroundColor: Colors.white,
                                fontSize: 15,
                                color: Colors.black45,
                                fontWeight: FontWeight.w700,
                                ),
                              hintStyle: const TextStyle(fontSize: 15),
                              border: OutlineInputBorder(borderRadius: BorderRadius.circular(20),borderSide: BorderSide.none),
                              floatingLabelBehavior: FloatingLabelBehavior.auto,
                              focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10.0),
                                borderSide: const BorderSide(color: Color.fromARGB(255, 41, 28, 171), width: 2.0), // Color del borde cuando está en foco
                              ),
                              
                              errorStyle:const  TextStyle(
                                color: Colors.red,
                                fontStyle: FontStyle.italic,
                                fontSize: 14.0)
                            ),
                            validator: (value) {
                              if(value == null || value.isEmpty){
                                return "Contraseña requerida";
                              }
                              return null;
                            },
                          ),
                          Container(
                            alignment: Alignment.centerRight,
                            child: const Text(
                              "Restablecer Contraseña",
                              style: TextStyle(
                                color:Color.fromARGB(255, 41, 28, 171),
                                fontSize: 16,
                                decoration: TextDecoration.underline,
                                decorationColor: Color.fromARGB(255, 41, 28, 171)),)),
                          const SizedBox(height: 20,),
                          const SizedBox(height: 30,), 
                          ElevatedButton(
                              style:ElevatedButton.styleFrom(
                                textStyle: const TextStyle(fontSize: 20),
                                foregroundColor: Colors.white,
                                backgroundColor: const Color.fromARGB(255, 41, 28, 171),
                                padding: const EdgeInsets.all(8),
                                minimumSize: const Size(350, 53),
                                shape:RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(15)),
                              ),
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  // // Suponiendo que tienes una instancia de User llamada userData con los datos correctos
                                  // User userData = User(name:_name, password: _password);
                
                                  // // Navegación con transición Slide desde la derecha
                                  // Navigator.of(context).pushReplacement(
                                  //   PageRouteBuilder(
                                  //     pageBuilder: (context, animation, secondaryAnimation) => MainScreen(userData: userData),
                                  //     transitionsBuilder: (context, animation, secondaryAnimation, child) {
                                  //       const begin = Offset(1.0, 0.0);
                                  //       const end = Offset.zero;
                                  //       const curve = Curves.ease;
                                  //       var tween = Tween(begin: begin, end: end).chain(CurveTween(curve: curve));
                                  //       var offsetAnimation = animation.drive(tween);
                
                                  //       return SlideTransition(
                                  //         position: offsetAnimation,
                                  //         child: child,
                                  //       );
                                  //     },
                                  //   ),
                                  // );
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(content: Text('Credenciales incorrectas')),
                                  );
                                }
                              },
                
                            child: const Text('Ingresar'),
                          ),
                          const SizedBox(height: 30,), 
                      ],
                    )),
                  ),
                ),
              
              ),
            ),
          ),
        )
          // child: Image.asset('assets/logo.png')),
        
      ],
    );
  }
}