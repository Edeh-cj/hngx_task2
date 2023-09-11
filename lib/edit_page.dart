import 'package:flutter/material.dart';
import 'package:hngx_task2/Utilies/string_modification.dart';
import 'package:hngx_task2/view_page.dart';

import 'Utilies/view_page_model.dart';

class EditPage extends StatefulWidget {
  const EditPage({super.key, required this.model});
  final ViewModel model;

  @override
  State<EditPage> createState() => _EditPageState();
}

class _EditPageState extends State<EditPage> {

  final formKey = GlobalKey<FormState>();
  final TextEditingController _fullNameCtrl = TextEditingController();
  final TextEditingController _slackNameCtrl = TextEditingController();
  final TextEditingController _bioCtrl = TextEditingController();
  final TextEditingController _emailCtrl = TextEditingController();
  final TextEditingController _gitCtrl = TextEditingController();
  final TextEditingController _professionCtrl = TextEditingController();
  
  @override
  void initState() {
    _fullNameCtrl.text = widget.model.fullName;
    _slackNameCtrl.text = widget.model.slackName;
    _professionCtrl.text = widget.model.profession;
    _bioCtrl.text = widget.model.bio;
    _emailCtrl.text = widget.model.emailHandle;
    _gitCtrl.text = widget.model.gitHandle;
    
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double formPadding = 50;
    TextStyle textStyle1 = TextStyle();
    double columnSpacing = 20;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit'),
      ),
      body: ListView(
        children: [

          Form(
            key: formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [

                SizedBox.square(dimension: columnSpacing,),

                SizedBox(
                  width: screensize.width - formPadding,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _fullNameCtrl,
                      ),
                      Text('Full Name', style: textStyle1,)
                    ],
                  ),                  
                ),

                SizedBox.square(dimension: columnSpacing,),

                SizedBox(
                  width: screensize.width - formPadding,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _professionCtrl,
                        
                      ),
                      Text('Profession', style: textStyle1,)
                    ],
                  ),                  
                ),

                SizedBox.square(dimension: columnSpacing,),

                SizedBox(
                  width: screensize.width - formPadding,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _bioCtrl,
                        maxLines: 2,
                       
                      ),
                      Text('Bio', style: textStyle1,)
                    ],
                  ),                  
                ),

                SizedBox.square(dimension: columnSpacing,),

                SizedBox(
                  width: screensize.width - formPadding,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _slackNameCtrl,
                      ),
                      Text('Slack Display Name', style: textStyle1,)
                    ],
                  ),                  
                ),

                SizedBox.square(dimension: columnSpacing,),

                SizedBox(
                  width: screensize.width - formPadding,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _gitCtrl,
                        
                      ),
                      Text('GitHub Url', style: textStyle1,)
                    ],
                  ),                  
                ),

                SizedBox.square(dimension: columnSpacing,),

                SizedBox(
                  width: screensize.width - formPadding,
                  child: Column(
                    children: [
                      TextFormField(
                        controller: _emailCtrl,
                        keyboardType: TextInputType.emailAddress,
                          validator: (value) {
                            if (value == null || !value.isValidEmail) {
                              return 'Please enter valid email';
                            } else{
                              return null;
                            }                                
                          },
                          decoration: const InputDecoration(
                              hintText: 'janedoe@who.com',
                        )
                      ),
                      Text('Email Address', style: textStyle1,)
                    ],
                  ),                  
                ),

              ],
            ),
          ),

          Padding(
            padding: const EdgeInsets.symmetric(vertical: 30, horizontal: 20),
            child: ElevatedButton(
              onPressed: (){
                FocusManager.instance.primaryFocus?.unfocus();
                if (formKey.currentState!.validate()) {
                  Navigator.of(context).pushAndRemoveUntil(
                    MaterialPageRoute(
                      builder: (context)=> ViewPage(
                        model: ViewModel(
                          fullName: _fullNameCtrl.text, 
                          profession: _professionCtrl.text, 
                          bio: _bioCtrl.text, 
                          slackName: _slackNameCtrl.text, 
                          gitHandle: _gitCtrl.text, 
                          emailHandle: _emailCtrl.text
                        )
                      )
                    ), 
                    (route) => false);
                }
              }, 
              child: const Text('Save')
            ),
          )
        ],
      ),
    );
  }
}