import 'package:block_todo/screens/bloc/home_bloc.dart';
import 'package:block_todo/screens/form/addtodo.dart';
import 'package:block_todo/screens/ui.dart/card.dart';
import 'package:block_todo/screens/ui.dart/message.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';




final title =TextEditingController();
final discription=TextEditingController();

class TodoScreeen extends StatefulWidget {
  const TodoScreeen({super.key});

  @override
  State<TodoScreeen> createState() => _TodoScreeenState();
}

class _TodoScreeenState extends State<TodoScreeen> {
  @override
  void inistate(){
      super.initState();
      context.read<HomeBloc>().add(ShowDialogEvent());
    }
      late String id;
      late Map todo;

      @override
      Widget build(BuildContext context){
        return Scaffold(
          appBar: AppBar(
            title: const Text('Todo'),
            backgroundColor: Theme.of(context).colorScheme.inversePrimary,
            ),
            body: BlocConsumer<HomeBloc, HomeState>(
             
              buildWhen: (previous,current)=> current is HomeActionsEvent,
              listenWhen: (previous,current)=> current is! HomeActionsEvent,
              listener: (context,state){
                if(state is NavigationState){
                  Navigator.push(
                    context,MaterialPageRoute(
                      builder: (context)=>const ScreenAdd(),
                    ));
                }else if(state is ShowPopState){
                  alertMessage(context, id);
                }else if(state is UpdateNavigtaionState){
                  Navigator.push(context,MaterialPageRoute(builder: (context)=>Widget()) );
                }
              },
              builder: (context, state) {
                if(state is Success){
                return GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 8,
                  crossAxisSpacing: 8,
                  children: List.generate(state.todoList.length,(index){
                    todo =state.todoList[index] as Map;
                    id=todo['_id'];
                    return TOdoCard(id: id, todo: todo);
                  }
                  ),
                  );
                }else if(state is Loading){
                  return const SizedBox.expand(
                    child:Center(child :CircularProgressIndicator())
                  );
               
                }else{
                  return const SizedBox.expand(
                    child: Center (child:Text('empty ')),
                  );
                }
                
              }),
              floatingActionButton: FloatingActionButton(
                onPressed: ()=>context.read<HomeBloc>().add(FormNativeEvent()),
              child:const Icon(Icons.add),
              ),
        );

       }
    
   }