import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:salt_test/module/homepage/bloc/home_cubit.dart';
import 'package:salt_test/module/homepage/models/user_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  HomeCubit cubit = HomeCubit();

  @override
  void initState() {
    cubit.getUsers();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Homepage"),
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
      ),
      body: BlocConsumer(
          listener: (context, state) {
            if (state is IsError) {
              ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)),
                backgroundColor: Colors.red,
                content: Text(
                  state.errorMsg ?? "something went wrong",
                  style: const TextStyle(fontSize: 16),
                ),
              ));
            }
          },
          bloc: cubit,
          builder: (context, state) {
            if (state is IsLoading) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is IsError) {
              return const SizedBox();
            } else {
              return ListView.builder(
                  shrinkWrap: true,
                  itemCount: cubit.users.length,
                  itemBuilder: (context, index) {
                    Users item = cubit.users[index];
                    return Container(
                      margin: const EdgeInsets.all(16),
                      width: MediaQuery.sizeOf(context).width / 1,
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          ClipRRect(
                              borderRadius: BorderRadius.circular(4),
                              child: Image.network(
                                item.avatar ?? "",
                                scale: 1.5,
                              )),
                          const SizedBox(
                            width: 8,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                (item.firstName ?? "") + (item.lastName ?? ""),
                                style: const TextStyle(
                                    fontSize: 16, fontWeight: FontWeight.w500),
                              ),
                              Text(item.email ?? "")
                            ],
                          )
                        ],
                      ),
                    );
                  });
            }
          }),
    );
  }
}
