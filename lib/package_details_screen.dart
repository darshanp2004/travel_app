import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:travel_app/utils/string.dart';
import 'PackageDetail_cubit/location_cubit.dart';
import 'PackageDetail_cubit/location_state.dart';

class packageDetailsScreen extends StatefulWidget {
  const packageDetailsScreen({super.key});

  @override
  State<packageDetailsScreen> createState() => _packageDetailsScreenState();
}

class _packageDetailsScreenState extends State<packageDetailsScreen> {
  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    context.read<LocationCubit>().fetchLocations();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue,
      appBar: AppBar(
        title: Text(packageDetail),
        backgroundColor: Colors.blue,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
        ),
        flexibleSpace: Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(color: Colors.white),
          child: Container(
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              color: Colors.blue,
              borderRadius: BorderRadius.only(bottomLeft: Radius.circular(30)),
            ),
          ),
        ),
      ),

      body: Stack(
        children: [
          Container(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            padding: EdgeInsets.only(top: 50),
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(topRight: Radius.circular(30)),
            ),
            child: SizedBox(
              child: Column(
                children: [
                  SizedBox(height: 30),
                  Expanded(
                    child: Scrollbar(
                      interactive: true,
                      thickness: 10,
                      radius: Radius.circular(10),
                      controller: _controller,
                      child: BlocBuilder<LocationCubit, LocationState>(
                        builder: (context, state) {
                          if (state is LocationLoading) {
                            return Center(child: CircularProgressIndicator());
                          } else if (state is LocationLoaded) {
                            return ListView.builder(
                              controller: _controller,
                              itemCount: state.locations.length,
                              itemBuilder: (context, index) {
                                return Card(
                                  surfaceTintColor: Colors.lightBlue,
                                  margin: EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                    bottom: 10,
                                  ),
                                  child: ListTile(
                                    title: Text(
                                      state.locations[index].username,
                                      style: TextStyle(fontSize: 18),
                                    ),
                                    subtitle: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(state.locations[index].name),
                                        Text(
                                          state.locations[index].address.city,
                                        ),
                                      ],
                                    ),
                                    trailing: Row(
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        IconButton(
                                          icon: Icon(
                                            state.locations[index].selected ==
                                                    true
                                                ? Icons.favorite
                                                : Icons.favorite_border,
                                            color:
                                                state
                                                            .locations[index]
                                                            .selected ==
                                                        true
                                                    ? Colors.red
                                                    : null,
                                          ),
                                          onPressed: () {
                                            context
                                                .read<LocationCubit>()
                                                .favorite(index);
                                          },
                                        ),

                                        IconButton(
                                          onPressed: () async {
                                            context.read<LocationCubit>().share(
                                              index,
                                            );
                                          },
                                          icon: Icon(Icons.share),
                                        ),
                                      ],
                                    ),
                                  ),
                                );
                              },
                            );
                          } else if (state is LocationError) {
                            return Center(child: Text(state.message));
                          }
                          return SizedBox();
                        },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(left: 30, top: 15),
            width: 300,
            height: 45,
            child: SearchBar(
              hintText: search,
              trailing: [Icon(Icons.search)],
              hintStyle: WidgetStateProperty.all(TextStyle(fontSize: 15)),
            ),
          ),
        ],
      ),
    );
  }
}
