import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool rememberUser = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Container(
          margin: const EdgeInsets.all(25),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _header(),
              _buildForm(),
              // Add other widgets below if needed
            ],
          ),
        ),
        resizeToAvoidBottomInset: false,
      ),
    );
  }

  Widget _header() {
    return Container(
      color: const Color.fromARGB(255, 255, 255, 255),
      height: 100,
      width: double.infinity,
      child: Center(
        child: SizedBox(
          width: 150,
          height: 150,
          child: Image.asset(
            "assets/images/logo.png",
          ),
        ),
      ),
    );
  }

  Widget _buildForm() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Welcome back",
          style: TextStyle(
              color: Colors.pink, fontSize: 28, fontWeight: FontWeight.w600),
        ),
        const SizedBox(height: 40),
        _buildInputField(
          emailController,
          prefixIcon: Icons.email,
          hintText: "Email/Phone Number",
        ),
        const SizedBox(height: 40),
        _buildInputField(
          passwordController,
          prefixIcon: Icons.lock,
          hintText: "Password",
          isPassword: true,
        ),
        const SizedBox(height: 25),
        _buildRememberForgot(),
        const SizedBox(height: 25),
        _buildLoginButton(),
        const SizedBox(height: 25),
        _buildOtherLogin(),
        const SizedBox(height: 15),
        _buildSignUpText(),
      ],
    );
  }

  Widget _buildGreyText(String text,
      {Color color = const Color.fromARGB(255, 21, 20, 20)}) {
    return Text(
      text,
      style: TextStyle(color: color),
    );
  }

  Widget _buildInputField(TextEditingController controller,
      {isPassword = false, IconData? prefixIcon, String? hintText}) {
    return TextField(
      controller: controller,
      obscureText: isPassword,
      decoration: InputDecoration(
        prefixIcon: prefixIcon != null ? Icon(prefixIcon) : null,
        hintText: hintText,
      ),
    );
  }

  Widget _buildRememberForgot() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Checkbox(
              value: rememberUser,
              onChanged: (value) {
                setState(() {
                  rememberUser = value!;
                });
              },
              activeColor: const Color.fromARGB(255, 213, 102, 94),
            ),
            _buildGreyText("Remember me",
                color: const Color.fromARGB(255, 228, 81, 106)),
          ],
        ),
        TextButton(
            onPressed: () {},
            child: _buildGreyText("Forgot  password?",
                color: const Color.fromARGB(255, 197, 89, 107)))
      ],
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: () {
        debugPrint("Email : ${emailController.text}");
        debugPrint("Password : ${passwordController.text}");
      },
      style: ElevatedButton.styleFrom(
        shape: const StadiumBorder(),
        backgroundColor: const Color.fromARGB(255, 217, 79, 102),
        elevation: 15,
        minimumSize: const Size.fromHeight(60),
      ),
      child: const Text(
        "LOGIN",
        style: TextStyle(color: Colors.white),
      ),
    );
  }

  Widget _buildOtherLogin() {
    return Center(
      child: Column(
        children: [
          _buildGreyText("Or Login with"),
          const SizedBox(height: 15),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Tab(icon: Image.asset("assets/images/fbpn.png")),
              Tab(icon: Image.asset("assets/images/inst.jpg")),
              Tab(icon: Image.asset("assets/images/in.png")),
            ],
          )
        ],
      ),
    );
  }

  Widget _buildSignUpText() {
    return Center(
      child: GestureDetector(
        onTap: () {},
        child: RichText(
          text: const TextSpan(
            text: "Don't have  account? ",
            style: TextStyle(color: Colors.black),
            children: [
              TextSpan(
                text: "Sign up",
                style:
                    TextStyle(color: Colors.pink, fontWeight: FontWeight.bold),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

final TextEditingController emailController = TextEditingController();
final TextEditingController passwordController = TextEditingController();
