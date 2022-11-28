part of 'pages.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _loginKey = GlobalKey<FormState>();
  final ctrlEmail = TextEditingController();
  final ctrlPassword = TextEditingController();
  bool isHide = true;
  bool isLoading = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    ctrlEmail.dispose();
    ctrlPassword.dispose();
    super.dispose();
  }

  String data = '';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Sign In"),
        centerTitle: true,
      ),
      body: Stack(
        children: [
          Container(
            width: double.infinity,
            height: double.infinity,
            padding: EdgeInsets.all(24),
            child: Center(
              child: Form(
                key: _loginKey,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    TextFormField(
                      keyboardType: TextInputType.emailAddress,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlEmail,
                      decoration: InputDecoration(
                        labelText: "Email",
                        prefixIcon: Icon(Icons.mail),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                      ),
                      validator: (value) {
                        return !EmailValidator.validate(value.toString())
                            ? "Email is not valid!"
                            : null;
                      },
                    ),
                    SizedBox(height: 24),
                    TextFormField(
                      obscureText: isHide,
                      autovalidateMode: AutovalidateMode.onUserInteraction,
                      controller: ctrlPassword,
                      decoration: InputDecoration(
                        labelText: "Password",
                        prefixIcon: Icon(Icons.lock),
                        border: OutlineInputBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(16))),
                        suffixIcon: new GestureDetector(
                          onTap: () {
                            setState(() {
                              isHide = !isHide;
                            });
                          },
                          child: Icon(
                            isHide ? Icons.visibility : Icons.visibility_off,
                          ),
                        ),
                      ),
                      validator: (value) {
                        return value!.length < 6
                            ? "Password at least 6 characters"
                            : null;
                      },
                    ),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton(
                          onPressed: () async {},
                          style: ElevatedButton.styleFrom(
                              backgroundColor: Colors.blue,
                              elevation: 0,
                              padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(16),
                              )),
                          child: Text("Sign in")),
                    ),
                    SizedBox(height: 16),
                    Divider(thickness: 2),
                    SizedBox(height: 16),
                    Container(
                      width: double.infinity,
                      child: ElevatedButton.icon(
                        onPressed: () async {
                          await AuthService.signInWithGoogle().then((value) {
                            UiToast.toastOk(
                                "Welcome back ${value.user!.displayName}");
                          });
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => Mainmenu()));
                        },
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white,
                            elevation: 4,
                            textStyle: TextStyle(
                              fontSize: 16,
                            ),
                            shadowColor: Colors.green,
                            padding: EdgeInsets.fromLTRB(24, 10, 24, 10),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
                        label: Text(
                          "Sign in with Google",
                          style: TextStyle(color: Colors.green),
                        ),
                        icon: FaIcon(FontAwesomeIcons.google),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          Align(
              alignment: Alignment(0, 0.96),
              child: GestureDetector(
                onTap: () {},
                child: Text("Belum punya akun? Daftar di sini!",
                    style: TextStyle(
                      color: Colors.blue,
                      fontSize: 16,
                    )),
              ))
        ],
      ),
    );
  }
}
