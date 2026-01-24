import 'package:flutter/material.dart';
import 'package:learning/res/components/custom_button.dart';
import 'package:learning/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../common/utils/validations/edit_text_validation.dart';
import '../view_model/auth_view_model.dart';

class RegisterView extends StatefulWidget {
  const RegisterView({super.key});

  @override
  State<RegisterView> createState() => _RegisterViewState();
}

class _RegisterViewState extends State<RegisterView> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _addressController = TextEditingController();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();
  bool _obscurePassword = true;
  bool _obscureConfirmPassword = true;
  bool _privacyPolicyAccepted = false;

  final EditTextValidation _validation = EditTextValidation();

  final FocusNode nameFocusNode = FocusNode();
  final FocusNode emailFocusNode = FocusNode();
  final FocusNode addressFocusNode = FocusNode();
  final FocusNode passwordFocusNode = FocusNode();
  final FocusNode confirmPasswordFocusNode = FocusNode();

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
    _emailController.dispose();
    _addressController.dispose();
    _passwordController.dispose();
    _confirmPasswordController.dispose();

    nameFocusNode.dispose();
    emailFocusNode.dispose();
    addressFocusNode.dispose();
    passwordFocusNode.dispose();
    confirmPasswordFocusNode.dispose();
  }

  Future<void> _openPrivacyPolicy() async {
    final Uri url = Uri.parse('https://google.com');
    if (await canLaunchUrl(url)) {
      await launchUrl(url, mode: LaunchMode.externalApplication);
    }
  }

  @override
  Widget build(BuildContext context) {
    final AuthViewModel authViewModel = Provider.of<AuthViewModel>(context);

    return Scaffold(
      backgroundColor: Colors.grey[50],
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.symmetric(horizontal: 24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: 20),
                // Title
                const Text(
                  'Create Account',
                  style: TextStyle(
                    fontSize: 32,
                    fontWeight: FontWeight.bold,
                    color: Colors.black87,
                  ),
                ),
                const SizedBox(height: 8),
                const Text(
                  'Fill in your details to get started',
                  style: TextStyle(fontSize: 16, color: Colors.grey),
                ),
                const SizedBox(height: 40),
                // Name Field
                TextFormField(
                  controller: _nameController,
                  focusNode: nameFocusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Name',
                    hintText: 'Enter your full name',
                    prefixIcon: const Icon(Icons.person_outline),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.name,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(context, nameFocusNode, emailFocusNode);
                  },
                  onChanged: (value){
                    authViewModel.setName(value);
                    _formKey.currentState?.validate();
                  },
                  validator: (value){
                    return EditTextValidation.nameValidator(value);
                  },
                ),
                const SizedBox(height: 20),

                // Email Field
                TextFormField(
                  controller: _emailController,
                  focusNode: emailFocusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Email',
                    hintText: 'Enter your email address',
                    prefixIcon: const Icon(Icons.email_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.emailAddress,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(context, emailFocusNode, addressFocusNode);
                  },
                  onChanged: (value){
                    authViewModel.setEmail(value);
                    _formKey.currentState?.validate();
                  },
                  validator: (value){
                    return EditTextValidation.emailValidator(value);
                  },
                ),
                const SizedBox(height: 20),

                // Address Field
                TextFormField(
                  controller: _addressController,
                  focusNode: addressFocusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  decoration: InputDecoration(
                    labelText: 'Address',
                    hintText: 'Enter your address',
                    prefixIcon: const Icon(Icons.location_on_outlined),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.streetAddress,
                  textInputAction: TextInputAction.next,
                  maxLines: 2,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(context, addressFocusNode, passwordFocusNode);
                  },
                  onChanged: (value){
                    authViewModel.setAddress(value);
                    _formKey.currentState?.validate();
                  },
                  validator: (value){
                    return EditTextValidation.addressValidator(value);
                  },
                ),
                const SizedBox(height: 20),

                // Password Field
                TextFormField(
                  controller: _passwordController,
                  obscureText: _obscurePassword,
                  focusNode: passwordFocusNode,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    labelText: 'Password',
                    hintText: 'Enter your password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscurePassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscurePassword = !_obscurePassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.next,
                  onFieldSubmitted: (value) {
                    Utils.fieldFocusChange(context, passwordFocusNode, confirmPasswordFocusNode);
                  },
                  onChanged: (value){
                    authViewModel.setPassword(value);
                    _formKey.currentState?.validate();
                  },
                  validator: (value){
                    return EditTextValidation.passwordValidator(value);
                  },
                ),
                const SizedBox(height: 20),

                // Confirm Password Field
                TextFormField(
                  controller: _confirmPasswordController,
                  obscureText: _obscureConfirmPassword,
                  autovalidateMode: AutovalidateMode.onUserInteraction,
                  focusNode: confirmPasswordFocusNode,
                  obscuringCharacter: "*",
                  decoration: InputDecoration(
                    labelText: 'Confirm Password',
                    hintText: 'Re-enter your password',
                    prefixIcon: const Icon(Icons.lock_outline),
                    suffixIcon: IconButton(
                      icon: Icon(
                        _obscureConfirmPassword
                            ? Icons.visibility_outlined
                            : Icons.visibility_off_outlined,
                      ),
                      onPressed: () {
                        setState(() {
                          _obscureConfirmPassword = !_obscureConfirmPassword;
                        });
                      },
                    ),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                    filled: true,
                    fillColor: Colors.white,
                  ),
                  keyboardType: TextInputType.visiblePassword,
                  textInputAction: TextInputAction.done,
                  onChanged: (value){
                    authViewModel.setConfirmPassword(value);
                    _formKey.currentState?.validate();
                  },
                  validator: (value){
                    return EditTextValidation.confirmPasswordValidator(value, _passwordController.text);
                  },
                ),
                const SizedBox(height: 24),

                // Privacy Policy Checkbox
                Row(
                  children: [
                    Checkbox(
                      value: _privacyPolicyAccepted,
                      onChanged: (value) {
                        if(value == null) return;
                        authViewModel.setPrivacyPolicyAccept(value);
                        setState(() {
                          _privacyPolicyAccepted = value ?? false;
                        });
                      },
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(4),
                      ),
                    ),
                    Expanded(
                      child: GestureDetector(
                        onTap: _openPrivacyPolicy,
                        child: RichText(
                          text: const TextSpan(
                            style: TextStyle(
                              fontSize: 14,
                              color: Colors.black87,
                            ),
                            children: [
                              TextSpan(text: 'I agree to the '),
                              TextSpan(
                                text: 'Privacy Policy',
                                style: TextStyle(
                                  color: Colors.blue,
                                  decoration: TextDecoration.underline,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 32),

                CustomButton(
                  loading: authViewModel.loading,
                  isEnabled: authViewModel.registerButtonEnabled,
                  onTap: () {
                    Utils.snackBarMessage(context, "Register button pressed.");

                      authViewModel.registerApi(
                          {
                            "name": _nameController.text,
                            "email": _emailController.text,
                            "address": _addressController.text,
                            "password": _passwordController.text,
                          }
                      );
                  },
                  title: "Register",
                ),
                const SizedBox(height: 24),

                // Login Text Button
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Already have an account? ',
                      style: TextStyle(fontSize: 14, color: Colors.grey),
                    ),
                    TextButton(
                      onPressed: () {
                        // Navigate to login screen - logic will be implemented later
                      },
                      style: TextButton.styleFrom(
                        padding: const EdgeInsets.symmetric(horizontal: 8),
                        minimumSize: Size.zero,
                        tapTargetSize: MaterialTapTargetSize.shrinkWrap,
                      ),
                      child: const Text(
                        'Login',
                        style: TextStyle(
                          fontSize: 14,
                          fontWeight: FontWeight.w600,
                          color: Colors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 40),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
