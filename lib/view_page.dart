import 'package:flutter/material.dart';
import 'package:hngx_task2/edit_page.dart';
import 'package:hngx_task2/Utilies/view_page_model.dart';

class ViewPage extends StatelessWidget {
  const ViewPage({super.key, required this.model});
  final ViewModel model;

  @override
  Widget build(BuildContext context) {
    Size screensize = MediaQuery.of(context).size;
    double firstColumnHeight = 300;
    TextStyle textStyle1 = const TextStyle(fontSize: 16, fontWeight: FontWeight.w600);
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            onPressed: (){
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=> EditPage(model: model,)
                )
              );
            }, 
            icon: const Icon(Icons.edit)
          )
        ],
      ),

      body: Column(
        children: [

          SizedBox(
            height: firstColumnHeight,
            width: screensize.width,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const CircleAvatar(
                  radius: 100,
                  backgroundImage: AssetImage('assets/profile_pic.jpg'),
                ),
                SizedBox(
                  height: 60,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text(model.fullName, style: const TextStyle(fontSize: 20),),
                      Text(model.profession, style: const TextStyle(fontSize: 16)),
                    ],
                  ),
                ),
                const Divider()
              ],
            ),
          ),

          SizedBox(
            height: screensize.height - firstColumnHeight - 88,
            width: screensize.width,
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListView(
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text('Bio', style: textStyle1,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model.bio),
                      ),
                      const SizedBox.square(dimension: 15,),
                      Text('Slack Display Name', style: textStyle1,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model.slackName),
                      ),
                      const SizedBox.square(dimension: 15,),
                      Text('GitHub url', style: textStyle1,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model.gitHandle),
                      ),
                      const SizedBox.square(dimension: 15,),
                      Text('Email', style: textStyle1,),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(model.emailHandle),
                      ),
                      const SizedBox.square(dimension: 15,),
                    ],
                  ),
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}