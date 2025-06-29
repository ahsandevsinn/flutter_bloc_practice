import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc_practice/bloc/counter_bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_bloc_practice/bloc/counter_event.dart';
import 'package:flutter_bloc_practice/bloc/counter_state.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => CounterBloc(),
      child :  const MaterialApp(
          title: 'Flutter Demo',
          
          home: MyHomePage(title: 'Flutter Demo Home Page'),
        )
    );
    
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});


  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(

        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
     
        title: Text(widget.title),
      ),
      body: Center(
       
        child: Column(
         
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            
            BlocBuilder<CounterBloc,CounterState>(builder: (context,state){
              return Text(
              state.count.toString(),
              style: Theme.of(context).textTheme.headlineMedium,
            );
            }),
            SizedBox(height: 10,),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
context.read<CounterBloc>().add(IncrementEvent());
                }, child: Text(
              "Add",
              style: Theme.of(context).textTheme.headlineMedium,
            ),),
              ElevatedButton(onPressed: (){

                }, child: Text(
              "Remove",
              style: Theme.of(context).textTheme.headlineMedium,
            ),)
              ],
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
      Person person =   Person(name: "Ahsan",age: 10);
      Person person1 =   Person(name: "Ahsan",age: 10);
      print(person.hashCode.toString());
      print(person1.hashCode.toString());
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}

class Person  extends Equatable{
  final String? name ;
  final int? age;
  Person({this.name,this.age});
  
  @override
  List<Object?> get props => [name,age];
  
}