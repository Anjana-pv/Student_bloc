import 'package:block_todo/const/const.dart';
import 'package:block_todo/screens/form/bloc/add_bloc.dart';
import 'package:block_todo/screens/home/todo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

final titlcontroller =TextEditingController();
final discriptioncontroller=TextEditingController();
final formkey =GlobalKey<FormState>();

class ScreenAdd extends StatelessWidget {

  const ScreenAdd({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TODO'),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body:BlocConsumer<AddBloc, AddState>(
        buildWhen:(previous, current) => current is!AddActonState,
        listenWhen: (previous, current) => current is AddActonState,
        listener: (context, state) {
          if(state is AddTodoSuccessState){
            Navigator.of(context).pop();
          }
         ScaffoldMessenger.of(context)
         .showSnackBar( 
          const SnackBar(
            behavior: SnackBarBehavior.floating,
            margin:EdgeInsets.all(10), 
            duration: Duration(seconds: 1),
            backgroundColor: Colors.green,
            content: Text("Data Added Successully !!",
            style: TextStyle(color: Colors.white),
            )));
        },
        builder: (context, state) {
          return Form(
            key: formkey,
            child: Padding(
              padding:const EdgeInsets.all(10.0),
              child: ListView(
                children: [
                 TextFormField(
                  controller: titlcontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      
                    ),
                    hintText:"Title",
                    hintStyle: TextStyle(fontSize: 20)
                  ),
                  validator: (value)=>titlcontroller.text.isEmpty
                  ? "Please enter a title"
                  :null,
                 ),
                 aheight,
                 TextFormField(
                  controller: discriptioncontroller,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(
                      
                    ),
                    hintText:"Discription",
                    hintStyle: TextStyle(fontSize: 20)
                  ),
                  validator: (value)=>titlcontroller.text.isEmpty
                  ? "Please enter a discription"
                  :null,
                 ),

                  bheight,
                   ElevatedButton.icon(
                    onPressed: () {
                      if (formkey.currentState!.validate()) {
                        submitData(context);
                      }
                    },
                    icon: const Icon(Icons.save),
                    label: const Text('Save'),
                    style: const ButtonStyle(
                        elevation: MaterialStatePropertyAll(5),
                        shape: MaterialStatePropertyAll(
                            ContinuousRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(8))))),
                  ),
                  




                 
                ],
              ) ,));
        },
      )
    );
  }
}

void submitData(BuildContext context) {
  final title = titlcontroller.text;
  final description = discription.text;
  final map = {
    "title": title,
    "description": description,
    "is_completed": false
  };
  context.read<AddBloc>().add(AddTodoEvent(map: map));
  titlcontroller.text = '';
  discriptioncontroller.text = '';
}
