import 'package:do_app/ui/main_screens/profil/edit_password_screen.dart';
import 'package:do_app/util/constants.dart';
import 'package:flutter/material.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}

class _ProfilScreenState extends State<ProfilScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.green,
        foregroundColor: Colors.white,
        titleTextStyle: const TextStyle(color: Colors.white),
        actions: [
          IconButton(
            icon: const Icon(Icons.edit),
            color: Colors.white,
            onPressed: () {
              Navigator.of(context).pushNamed('/edit_profil');
            },
          ),
          IconButton(
            icon: const Icon(Icons.more_vert),
            color: Colors.white,
            onPressed: () {
              // Ajouter la logique pour afficher plus d'options
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: 150,
                  color: Colors.white,
                  child: Column(
                    children:[
                      Container(
                        color: Constant.mainColor,
                        height: 100,
                        child: const Padding(
                          padding:  EdgeInsets.only(left: 20, bottom: 30),
                          child: Row(
                            children: [
                              CircleAvatar(
                                radius: 40,
                                backgroundColor: Colors.teal,
                                child: Text(
                                  'DW',
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(width: 20),
                              Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    'Docile WAKOMYA',
                                    style: TextStyle(
                                      fontSize: 16,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white,
                                    ),
                                  ),
                                  SizedBox(height: 4),
                                  Text(
                                    'IGGJ007074',
                                    style: TextStyle(
                                      fontSize: 14,
                                      color: Colors.white,
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 10,
                  bottom: 20,
                  child: ElevatedButton.icon(
                    onPressed: () {},
                    icon: const Icon(Icons.add_a_photo),
                    label: const Text('Ajouter une photo'),
                    style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(20),
                      ),
                    ),
                  ),
                ),
              ],
            ),
            coolDesignation(title: 'Nom', subTitle: 'KAGOLOMBO'),
            const SizedBox(height: 5,),
            coolDesignation(title: 'PostNom', subTitle: 'WAKOMYA'),
            const SizedBox(height: 5,),
            coolDesignation(title: 'Matricule', subTitle: 'IGGJ007074'),
            const SizedBox(height: 5,),
            coolDesignation(title: 'Password', subTitle: 'XXXX - XXXX - XXXX'),
            InkWell(
              child: const Padding(
                padding: EdgeInsets.only(right: 10),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text('Modifier Mot De Passe', style: TextStyle(color: Constant.mainColor),),
                    SizedBox(width: 10),
                    Icon(Icons.arrow_drop_down_circle, size: 30, color: Constant.mainColor,),
                  ],
                ),
              ),
              onTap: (){
                showModalBottomSheet(
                    context: context,
                    builder: (context) {
                      // return addCompteurForm(context: context);
                      // return AjoutCompteur();
                      return const EditPasswordScreen();
                    },
                  );
              },
            ),
          ],
        ),
      ),
    );
  }
}

Widget coolDesignation ({title = 'Aucun', subTitle = 'Aucun'}){
   return Padding(
      padding: const EdgeInsets.all(10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(title),
          Container(
            height: 40,
            color: Constant.secondColor,
            child: Padding(
              padding: const EdgeInsets.only(left: 20, top: 10),
              child:  Text(subTitle),
            ),
          ),
        ],
      ),
  );
}