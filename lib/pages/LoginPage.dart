import 'package:flutter/material.dart';
import 'package:skl_pertama_for_real/pages/Register.dart';


class Loginpage extends StatelessWidget {
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(bottom: 16, left: 16, right: 16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 10,),
            Image.asset(
              'images/1.png', 
              height: 300,
            ),
            const SizedBox(height: 20,),
            const Align(
              alignment: Alignment.centerLeft, 
              child: Text(
                'Login',
                style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
              ),
            ),
            const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                'Login to access your account',
                style: TextStyle(fontSize: 15),
              ),
            ),
            const SizedBox(height: 20),
            _buildTextField(controller: _nameController, label: 'Name', icon: Icons.person),
            const SizedBox(height: 20),
            _buildTextField(controller: _emailController, label: 'Email', keyboardType: TextInputType.emailAddress, icon: Icons.email),
            const SizedBox(height: 20),
            _buildTextField(controller: _passwordController, label: 'Password', obscureText: true, icon: Icons.lock),
            const SizedBox(height: 20),
           
            ElevatedButton(
              onPressed: () {
                Navigator.pushNamed(context, '/Homepage');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: const Color(0xFF1C4997), 
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0), 
                ),
                minimumSize: const Size(double.infinity, 50),
              ),
              child: const Text(
                'Login In',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
            const SizedBox(height: 20),

            
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  'Dont have an account yet?',
                  style: TextStyle(color: Colors.grey, fontSize: 14),
                ),
                TextButton(
                  onPressed: () {
                    Navigator.push(
                      context, MaterialPageRoute(builder: (context) => Registerpage()
                      ),
                    );
                  },
                  child: const Text(
                    'Register',
                    style: TextStyle(
                      color: Color(0xFF172B4D), 
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTextField({
    required TextEditingController controller,
    required String label,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    IconData? icon,
  }) {
    return TextField(
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText,
      decoration: InputDecoration(
        prefixIcon: icon != null ? Icon(icon) : null,
        labelText: label,
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(30),
        ),
      ),
    );
  }
}
