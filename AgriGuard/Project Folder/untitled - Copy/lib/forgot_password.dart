import 'package:flutter/material.dart';

class ForgotPasswordPage extends StatefulWidget {
  const ForgotPasswordPage({Key? key}) : super(key: key);

  @override
  State<ForgotPasswordPage> createState() => _ForgotPasswordPageState();
}

class _ForgotPasswordPageState extends State<ForgotPasswordPage> {
  final formKey = GlobalKey<FormState>();
  final TextEditingController emailController = TextEditingController();
  bool isLoading = false;

  @override
  void dispose() {
    emailController.dispose();
    super.dispose();
  }

  Future<void> resetPassword() async {
    if (formKey.currentState!.validate()) {
      setState(() => isLoading = true);
      await Future.delayed(const Duration(seconds: 1));
      if (mounted) {
        setState(() => isLoading = false);
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Password reset link sent to ${emailController.text}'), backgroundColor: Theme.of(context).colorScheme.primary),
        );
        Navigator.of(context).pop(); // Go back to login
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(32.0),
          child: Form(
            key: formKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // Logo
                Container(
                  width: 130,
                  height: 130,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(12),
                    boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 0)],
                  ),
                  child: Image.asset("assets/logo.jpg", width: 28, height: 28, fit: BoxFit.contain),
                ),
                const SizedBox(height: 16),
                const Text("Forgot Password", textAlign: TextAlign.center, style: TextStyle(
                    fontSize: 28, fontWeight: FontWeight.bold, color: Color(0xFF2D3748))),
                const SizedBox(height: 8),
                const Text("Enter your email to receive a reset link", textAlign: TextAlign.center, style: TextStyle(
                    fontSize: 15, color: Color(0xFF718096))),
                const SizedBox(height: 40),

                // Email Field
                const Text("Email", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Color(0xFF2D3748))),
                const SizedBox(height: 8),
                TextFormField(
                  controller: emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: InputDecoration(
                    hintText: "farmer@example.com",
                    hintStyle: const TextStyle(color: Color(0xFFA0AEC0)),
                    filled: true, fillColor: const Color(0xFFF7FAFC),
                    border: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    enabledBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: const BorderSide(color: Color(0xFFE2E8F0))),
                    focusedBorder: OutlineInputBorder(borderRadius: BorderRadius.circular(8), borderSide: BorderSide(color: Theme.of(context).colorScheme.primary, width: 2)),
                    contentPadding: const EdgeInsets.symmetric(horizontal: 16, vertical: 14),
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) return 'Please enter your email';
                    if (!value.contains('@')) return 'Please enter a valid email';
                    return null;
                  },
                ),

                const SizedBox(height: 32),

                // Reset Button
                isLoading
                    ? Center(child: CircularProgressIndicator(valueColor: AlwaysStoppedAnimation<Color>(Theme.of(context).colorScheme.primary)))
                    : ElevatedButton(
                  onPressed: resetPassword,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Theme.of(context).colorScheme.primary,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                    elevation: 0,
                  ),
                  child: const Text("Send Reset Link", style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600)),
                ),

                const SizedBox(height: 24),
                // Back to Login
                Row(mainAxisAlignment: MainAxisAlignment.center, children: [
                  const Text("Remembered password?", style: TextStyle(fontSize: 14, color: Color(0xFF718096))),
                  GestureDetector(
                    onTap: () => Navigator.pushReplacementNamed(context, "login"),
                    child: Text(" Sign in", style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600, color: Theme.of(context).colorScheme.primary)),
                  ),
                ]),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
