import 'package:bloc_educational/Features/Users/Bloc/users_bloc.dart';
import 'package:bloc_educational/Features/Users/Bloc/users_events.dart';
import 'package:bloc_educational/Features/Users/Bloc/users_states.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class UserView extends StatelessWidget {
  const UserView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Center(
            child: Text(
              "Bloc Educational",
              style: TextStyle(color: Colors.white, fontSize: 25),
            ),
          ),
          backgroundColor: Theme.of(context).colorScheme.primary,
        ),
        body: Stack(
          children: [
            BlocBuilder<UserBloc, UserState>(
              builder: (context, state) => ListView.builder(
                padding: const EdgeInsets.all(16),
                itemCount: state.users.length,
                itemBuilder: (context, index) => Container(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    decoration: const BoxDecoration(
                        border: Border(
                            bottom:
                                BorderSide(color: Colors.black12, width: 1))),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text("${state.users[index]} ($index)"),
                        IconButton(
                            onPressed: () {
                              BlocProvider.of<UserBloc>(context).add(RemoveUser(index));
                            },
                            icon: const Icon(
                              Icons.clear,
                              size: 20,
                            ))
                      ],
                    )),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Align(
                alignment: Alignment.bottomRight,
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<UserBloc>(context)
                            .add(AddUser("Sajjad"));
                      },
                      child: const Icon(Icons.add),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    FloatingActionButton(
                      onPressed: () {
                        BlocProvider.of<UserBloc>(context).add(ClearUsers());
                      },
                      child: const Icon(Icons.delete),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
