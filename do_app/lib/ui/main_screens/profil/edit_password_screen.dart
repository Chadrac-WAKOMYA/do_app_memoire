import 'package:do_app/util/constants.dart';
import 'package:do_app/widgets/customTextField.dart';
import 'package:flutter/material.dart';

class EditPasswordScreen extends StatefulWidget {
  const EditPasswordScreen({super.key});

  @override
  State<EditPasswordScreen> createState() => _EditPasswordScreenState();
}

class _EditPasswordScreenState extends State<EditPasswordScreen> {
  String err = '';
  CustomTextField aMotDePasse = CustomTextField(
    title: 'Ancien Mot De Passe',
    placeholder: 'Entrez votre ancien mot de passe',
    isPass: true,
    icon: Icons.lock,
    keyboard: TextInputType.phone
  );
  CustomTextField nMotDePasse = CustomTextField(
    title: 'Nouveau Mot De Passe',
    placeholder: 'Entrez votre nouveau mot de passe',
    icon: Icons.lock,
    isPass: true,
    keyboard: TextInputType.phone
  );
  CustomTextField cMotDePasse = CustomTextField(
    title: 'Confirme Mot De Passe',
    placeholder: 'Confirmez votre nouveau mot de passe',
    icon: Icons.lock,
    isPass: true,
    keyboard: TextInputType.phone
  );
  final _key = GlobalKey<FormState>();
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: SizedBox(
        // height: MediaQuery.of(context).size.height *9,
        // color : Colors.white,
        child: SingleChildScrollView(
          child: Form(
            key: _key,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 30),
                const Center(
                  child: Text(
                    'Modeifer Mot de Passe',
                    style: TextStyle(
                      color: Constant.mainColor,
                      fontSize: 16,
                    ),
                  )
                ),
                const SizedBox(height: 40),
                aMotDePasse.textFormField(),
                const SizedBox(height: 30),
                nMotDePasse.textFormField(),
                const SizedBox(height: 30),
                cMotDePasse.textFormField(),
                const SizedBox(height: 30),
                InkWell(
                  onTap: (){
                    if (_key.currentState!.validate()) {}                   
                  },           
                  
                  child: Material(
                    elevation: 5,
                    child: Container(
                      color: Constant.mainColor,
                      height: MediaQuery.of(context).size.width *.6 /5,
                      child: const Center(
                        child: Text(
                          'MODIFIER',
                          style: TextStyle(
                            color: Colors.white,
                            fontSize: 16,
                          ),
                        ),
                      ),
                      
                    ),
                ), ),
              ],
            )
          ),
        ),
      ),
    );
  }
}