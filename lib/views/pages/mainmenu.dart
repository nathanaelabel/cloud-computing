part of 'pages.dart';

class Mainmenu extends StatefulWidget {
  const Mainmenu({super.key});

  @override
  State<Mainmenu> createState() => _MainmenuState();
}

class _MainmenuState extends State<Mainmenu> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        title: Text("Hello "+FirebaseAuth.instance.currentUser!.displayName!.toString()),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
          onPressed: () async {
            await AuthService.signOut().then((value) {
              if (value){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage()));
                UiToast.toastOk("Logout successful!");
              }else{
                UiToast.toastErr("Logout failed!");
              }
            });
          },
          icon: Icon(Icons.logout))
        ],
      )
    );
  }
}