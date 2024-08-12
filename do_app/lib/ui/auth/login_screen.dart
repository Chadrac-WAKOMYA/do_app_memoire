// import 'dart:convert';
// import 'package:do_app/util/constants.dart';
// import 'package:http/http.dart' as http;
// import 'package:flutter/material.dart';

// class LoginScreen extends StatefulWidget {
//   const LoginScreen({super.key});

//   @override
//   State<LoginScreen> createState() => _LoginScreenState();
// }

// class _LoginScreenState extends State<LoginScreen> {
//   final _formKey = GlobalKey<FormState>();
//   final _nameController = TextEditingController();
//   final _passwordController = TextEditingController();
//   String mainUrl = Constant.mainUrl;

//   bool _isLoading = false;
//   String _errorMessage = '';

//   Future<void> _login() async {
//     if (_formKey.currentState?.validate() ?? false) {
//       setState(() {
//         _isLoading = true;
//         _errorMessage = '';
//       });

//       try {
//         final response = await http.post(
//           Uri.parse('$mainUrl/login.php'),
//           body: {
//             'nom': _nameController.text,
//             'motdepasse': _passwordController.text,
//           },
//         );

//         if (response.statusCode == 200) {
//           final data = jsonDecode(response.body);
//           final token = data['token'];
//           // Utilisez le token pour l'authentification des futures requêtes
//           // Redirigez l'utilisateur vers la page d'accueil
//           Navigator.of(context).pushNamed('/drawer_screen');
//         } else {
//           final data = jsonDecode(response.body);
//           setState(() {
//             _errorMessage = data['message'] ?? 'Erreur de connexion';
//           });
//         }
//       } catch (e) {
//         setState(() {
//           _errorMessage = 'Une erreur est survenue lors de la connexion';
//         });
//       } finally {
//         setState(() {
//           _isLoading = false;
//         });
//       }
//     }
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Container(
//         decoration: BoxDecoration(
//           color: Colors.green[900],
//         ),
//         child: Center(
//           child: SingleChildScrollView(
//             child: Padding(
//               padding: EdgeInsets.all(16.0),
//               child: Form(
//                 key: _formKey,
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.center,
//                   children: [
//                     Padding(
//                       padding: EdgeInsets.only(bottom: 32.0),
//                       child: Image.asset(
//                         'lib/assets/logo.jpg',
//                       ),
//                     ),
//                     Container(
//                       padding: EdgeInsets.all(32.0),
//                       decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(16.0),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.black.withOpacity(0.1),
//                             blurRadius: 10,
//                             offset: Offset(0, 4),
//                           ),
//                         ],
//                       ),
//                       child: Column(
//                         crossAxisAlignment: CrossAxisAlignment.stretch,
//                         children: [
//                           TextFormField(
//                             controller: _nameController,
//                             decoration: InputDecoration(
//                               hintText: 'Nom',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Veuillez entrer votre nom';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16.0),
//                           TextFormField(
//                             controller: _passwordController,
//                             obscureText: true,
//                             decoration: InputDecoration(
//                               hintText: 'Mot de passe',
//                               border: OutlineInputBorder(),
//                             ),
//                             validator: (value) {
//                               if (value?.isEmpty ?? true) {
//                                 return 'Veuillez entrer votre mot de passe';
//                               }
//                               return null;
//                             },
//                           ),
//                           const SizedBox(height: 16.0),
//                           ElevatedButton(
//                             onPressed: _isLoading ? null : _login,
//                             child: _isLoading
//                                 ? CircularProgressIndicator()
//                                 : Text('Login'),
//                           ),
//                           if (_errorMessage.isNotEmpty)
//                             Padding(
//                               padding: EdgeInsets.only(top: 16.0),
//                               child: Text(
//                                 _errorMessage,
//                                 style: TextStyle(color: Colors.red),
//                               ),
//                             ),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//           ),
//         ),
//       ),
//     );    
//   }
// }