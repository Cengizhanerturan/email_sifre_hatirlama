import 'package:email_sifre_hatirlama/constants/color.dart';
import 'package:email_sifre_hatirlama/constants/text.dart';
import 'package:email_sifre_hatirlama/controller/auth_controller.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

AuthController _authController = Get.put(AuthController());

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    //Landing page kullan
    _authController.box.writeIfNull('email', '');
    _authController.box.writeIfNull('pass', '');
    _authController.box.writeIfNull('beniHatirla', false);
    String boxEmail = _authController.box.read('email');
    String boxPass = _authController.box.read('pass');
    _authController.emailController.text = boxEmail;
    _authController.passController.text = boxPass;
    _authController.isChecked.value = _authController.box.read('beniHatirla');
    return Scaffold(
      body: SafeArea(
        child: SizedBox(
          width: double.infinity,
          height: double.infinity,
          child: Form(
            key: _authController.girisKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: Get.width / 1.4,
                  child: TextFormField(
                    controller: _authController.emailController,
                    //initialValue: boxEmail != '' ? boxEmail : '',
                    validator: (value) {
                      if (EmailValidator.validate(value!) == false) {
                        return 'Lütfen geçerli bir mail adresi giriniz.';
                      } else {
                        return null;
                      }
                    },
                    onSaved: (value) {
                      _authController.girisEmail = value;
                    },
                    keyboardType: TextInputType.emailAddress,
                    style: ConstantsText.textStyle16P,
                    cursorColor: ConstantsColor.appColorP,
                    decoration: InputDecoration(
                      prefixIcon: const Icon(
                        Icons.mail,
                        color: ConstantsColor.appColorP,
                      ),
                      labelText: 'Email',
                      labelStyle: ConstantsText.textStyle16P,
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: Colors.grey,
                        ),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: const BorderSide(
                          color: ConstantsColor.appColorP,
                        ),
                      ),
                      errorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        ),
                      ),
                      focusedErrorBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(16),
                        borderSide: BorderSide(
                          color: Colors.red.shade400,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: SizedBox(
                    width: Get.width / 1.4,
                    child: TextFormField(
                      controller: _authController.passController,
                      //initialValue: boxPass != '' ? boxPass : '',
                      validator: (value) {
                        if (value!.length < 6) {
                          return 'Lütfen şifrenizi giriniz';
                        } else {
                          return null;
                        }
                      },
                      onSaved: (value) {
                        _authController.girisSifre = value;
                      },
                      obscureText: true,
                      style: ConstantsText.textStyle16P,
                      cursorColor: ConstantsColor.appColorP,
                      decoration: InputDecoration(
                        prefixIcon: const Icon(
                          Icons.vpn_key,
                          color: ConstantsColor.appColorP,
                        ),
                        labelText: 'Şifre',
                        labelStyle: ConstantsText.textStyle16P,
                        focusedBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: Colors.grey,
                          ),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: const BorderSide(
                            color: ConstantsColor.appColorP,
                          ),
                        ),
                        errorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          ),
                        ),
                        focusedErrorBorder: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(16),
                          borderSide: BorderSide(
                            color: Colors.red.shade400,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 44.0),
                  child: Row(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Obx(
                        () => Checkbox(
                          value: _authController.isChecked.value,
                          onChanged: (isChecked) {
                            _authController.isChecked.value = isChecked!;
                          },
                          activeColor: ConstantsColor.appColorP,
                          shape: const CircleBorder(
                            side: BorderSide(
                              color: ConstantsColor.appColorP,
                              style: BorderStyle.solid,
                              width: 3.0,
                            ),
                          ),
                          side: const BorderSide(
                            color: ConstantsColor.appColorP,
                            style: BorderStyle.solid,
                            width: 3.0,
                          ),
                          checkColor: ConstantsColor.appColorW,
                        ),
                      ),
                      const Text(
                        'Beni hatırla',
                        style: ConstantsText.textStyle16B,
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: InkWell(
                    onTap: () {
                      if (_authController.girisKey.currentState!.validate()) {
                        _authController.girisKey.currentState!.save();
                        FocusScope.of(context).requestFocus(FocusNode());
                        girisYap();
                      }
                    },
                    child: Container(
                      width: 200,
                      height: 50,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        color: ConstantsColor.appColorP,
                      ),
                      child: const Center(
                        child: Text(
                          'Giriş yap',
                          style: ConstantsText.textStyle16W,
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16.0),
                  child: Column(
                    children: [
                      const Text(
                        'Hesabınız yok mu?',
                        style: ConstantsText.textStyle16B,
                      ),
                      TextButton(
                        onPressed: () {},
                        child: const Text(
                          'Kayıt ol',
                          style: ConstantsText.textStyle16P,
                        ),
                      ),
                    ],
                  ),
                ),
                Column(
                  children: [
                    const Text(
                      'Şifrenizi mi unuttunuz?',
                      style: ConstantsText.textStyle16B,
                    ),
                    TextButton(
                      onPressed: () {},
                      child: const Text(
                        'Şifre sıfırla',
                        style: ConstantsText.textStyle16P,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Future<void> girisYap() async {
    if (_authController.isChecked.value == true) {
      await sharedPrefKaydet();
    } else {
      _authController.box.remove('email');
      _authController.box.remove('pass');
      _authController.box.write('beniHatirla', _authController.isChecked.value);
    }
  }

  Future<void> sharedPrefKaydet() async {
    _authController.box.write('email', _authController.girisEmail.toString());
    _authController.box.write('pass', _authController.girisSifre.toString());
    _authController.box.write('beniHatirla', _authController.isChecked.value);
  }

  void sharedPrefSil() {}

  void sharedPrefGoster() {
    debugPrint(_authController.box.read('email').toString());
    debugPrint(_authController.box.read('pass').toString());
    debugPrint(_authController.box.read('beniHatirla').toString());
  }
}
