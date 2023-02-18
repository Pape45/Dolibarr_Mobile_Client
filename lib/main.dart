import 'package:flutter/material.dart';
import 'package:dolibarr_mobile_client/api/user_api.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'model/user.dart';
import 'screens/home_page.dart';
import 'package:flutter/gestures.dart';


void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<String?>(
      future: FlutterSecureStorage().read(key: 'token'),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Still loading the token
          return const CircularProgressIndicator();
        } else if (snapshot.hasData && snapshot.data != null) {
          // Found the token, show the HomePage
          final user =
              User(token: snapshot.data!, code: 0, entity: 0, message: '');
          return MaterialApp(
            title: 'DOLIBARR MOBILE',
            home: HomePage(user: user),
          );
        } else {
          // Token not found, show the login form
          return const MaterialApp(
            title: 'DOLIBARR MOBILE',
            home: LoginForm(),
          );
        }
      },
    );
  }
}

class LoginForm extends StatefulWidget {
  const LoginForm({Key? key}) : super(key: key);

  @override
  LoginFormState createState() => LoginFormState();
}

class LoginFormState extends State<LoginForm> {
  final _formKey = GlobalKey<FormState>();
  late final TextEditingController _loginController;
  late final TextEditingController _passwordController;
  bool _isLoading = false;
  late String _errorMessage;
  final _storage = FlutterSecureStorage();

  @override
  void initState() {
    super.initState();
    _loginController = TextEditingController();
    _passwordController = TextEditingController();
    _errorMessage = '';
  }

  Future<void> _submitForm() async {
    if (!_formKey.currentState!.validate()) {
      return;
    }

    setState(() {
      _isLoading = true;
      _errorMessage = '';
    });

    try {
      final user = await UserApi.fetchUser(
        _loginController.text,
        _passwordController.text,
      );
      // Store the user's token
      await _storage.write(key: 'token', value: user.token);
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomePage(user: user)),
      );
    } catch (e) {
      setState(() {
        _errorMessage = 'Failed to fetch user: $e';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  void dispose() {
    // Clean up the TextEditingController instances when the widget is disposed
    _loginController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dolibarr'),
        centerTitle: true,
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 20.0),
            child: Text(
              'ERP/CRM',
              style: TextStyle(fontSize: 20),
            ),
          ),
        ],
      ),
      body: Center(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Form(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextFormField(
                    controller: _loginController,
                    decoration: InputDecoration(
                      labelText: 'Login',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your login';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  TextFormField(
                    controller: _passwordController,
                    decoration: InputDecoration(
                      labelText: 'Password',
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    obscureText: true,
                    validator: (value) {
                      if (value == null || value.isEmpty) {
                        return 'Please enter your password';
                      }
                      return null;
                    },
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: _isLoading ? null : _submitForm,
                    style: ElevatedButton.styleFrom(
                      primary: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                      minimumSize: const Size(double.infinity, 50.0),
                    ),
                    child: _isLoading
                        ? const CircularProgressIndicator()
                        : const Text('Se connecter'),
                  ),
                  if (_errorMessage.isNotEmpty)
                    Text(
                      _errorMessage,
                      style: const TextStyle(color: Colors.red),
                    ),
                  const SizedBox(height: 16),
                  Text.rich(
                    TextSpan(
                      text: 'En continuant, vous acceptez ',
                      style: TextStyle(fontSize: 10),
                      children: <TextSpan>[
                        TextSpan(
                          text: 'nos conditions générales et notre politique de confidentialité.',
                          style: TextStyle(
                            fontSize: 10,
                            decoration: TextDecoration.underline,
                            color: Colors.blue,
                            fontWeight: FontWeight.bold,
                          ),
                          recognizer: TapGestureRecognizer()
                            ..onTap = () {
                              // Mettre ici le code à exécuter quand l'utilisateur clique sur le lien
                            },
                        ),
                      ],
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
