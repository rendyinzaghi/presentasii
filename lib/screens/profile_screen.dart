import 'package:flutter/material.dart';
import 'package:masakankhas_indonesia/screens/sign_up_screen.dart';

class ProfilScreen extends StatefulWidget {
  const ProfilScreen({super.key});

  @override
  State<ProfilScreen> createState() => _ProfilScreenState();
}
class _ProfilScreenState extends State<ProfilScreen> {
  // TODO: 1. Deklarasikan variabel yang dibutuhkan
  bool isSignedIn = false;
  String fullName = '';
  String userName = '';
  int favoriteCandiCount = 0;

  // TODO: 5. Implementasi fungsi singin
  void signIn () {
    // Navigator.pushNamed(
    //   context, '/sign_in'
    // );
    // setState(() {
    //   // isSignedIn = !isSignedIn;
    // });
    Navigator.pushNamed(context, '/signin');
  }
  // TODO: 6. Implementasi fungsi singout
  void signOut () {
    setState(() {
      isSignedIn = !isSignedIn;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: 200, width: double.infinity, color: Colors.blue,
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal:16),
            child: Column(
              children: [
                // TODO: 2. Buat bagian ProfilHeader yang berisi gambar profil
                Align(
                  alignment: Alignment.topCenter,
                  child: Padding(
                    padding: const EdgeInsets.only(top: 200 - 50),
                    child: Stack(
                      alignment: Alignment.bottomRight,
                      children: [
                        Container(
                          decoration: BoxDecoration(
                            border: Border.all(color: Colors.blue, width: 2),
                            shape: BoxShape.circle,
                          ),
                          child: CircleAvatar(
                            radius: 50,
                            backgroundImage: AssetImage('images/placeholder_image.png'),
                          ),
                        ),
                        if(isSignedIn)
                          IconButton(
                            onPressed: () {},
                            icon: Icon(Icons.camera_alt, color: Colors.blue[50],),
                          ),
                      ],
                    ),
                  ),
                ),
                // TODO: 3. Buat bagian profilInfo yang berisi info profil
                SizedBox(height: 20),
                Divider(color: Colors.blue[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children:[
                          Icon(Icons.lock, color: Colors.amber),
                          SizedBox(width: 8),
                          Text('Pengguna', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),),
                    Expanded(
                      child: Text(': $userName', style: TextStyle(
                          fontSize: 18
                      ),),
                    ),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: Colors.blue[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children:[
                          Icon(Icons.person, color: Colors.blue),
                          SizedBox(width: 8),
                          Text('Nama', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),),
                    Expanded(
                      child: Text(': $fullName', style: TextStyle(
                          fontSize: 18
                      ),),
                    ),
                    if(isSignedIn) Icon(Icons.edit),
                  ],
                ),
                SizedBox(height: 4),
                Divider(color: Colors.blue[100]),
                SizedBox(height: 4),
                Row(
                  children: [
                    SizedBox(width: MediaQuery.of(context).size.width / 3,
                      child: Row(
                        children:[
                          Icon(Icons.favorite, color: Colors.red),
                          SizedBox(width: 8),
                          Text('Favorite', style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.bold,
                          ),),
                        ],
                      ),),
                    Expanded(
                      child: Text(': $fullName', style: TextStyle(
                          fontSize: 18
                      ),),
                    ),
                    if(isSignedIn) Icon(Icons.edit),
                  ],
                ),
                // TODO: 4. Buat ProfilActions yang berisi TextButton sign in/out
                SizedBox(height: 4),
                Divider(color: Colors.blue[100]),
                SizedBox(height: 20),
                isSignedIn ? TextButton(
                    onPressed: signOut,
                    child: Text('Sign Out'))
                    : TextButton(
                    onPressed: signIn,
                    child: Text('Sign In')),
              ],
            ),
          ),
        ],
      ),
    );
  }
}