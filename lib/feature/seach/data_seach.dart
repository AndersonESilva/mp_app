import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:mp_app/feature/seach/seach_bloc.dart';
import 'package:mp_app/feature/service/api_client.dart';

class DataSeach extends SearchDelegate<String>{

  ApiClient apiClient;

  DataSeach(){
    apiClient = ApiClient();
  }

  @override
  List<Widget> buildActions(BuildContext context) {
    return [
      IconButton(
        icon: Icon(Icons.clear),
        onPressed: (){
          query = "";
        },
      )
    ];
  }

  @override
  Widget buildLeading(BuildContext context) {
    return IconButton(
      icon: AnimatedIcon(
          icon: AnimatedIcons.menu_arrow,
          progress: transitionAnimation
      ),
      onPressed: (){
         close(context, null);
      },
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    return Container();
  }

  @override
  Widget buildSuggestions(BuildContext context) {

    final bloc = SearchBloc();

    if (query.isEmpty){
      return Container();
    }else{
      bloc.inSearch.add(query);

      return BlocProvider(
        blocs: [
          Bloc((i) => SearchBloc()),
        ],
        child: Consumer<SearchBloc>(
          builder: (context, searchBloc){
            return StreamBuilder(
              stream: bloc.outEvents,
              initialData: [],
              builder: (context, snapshot){
                if(!snapshot.hasData){
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }else{
                  return ListView.builder(
                    itemBuilder: (context, index){
                      var results = snapshot.data;
                      return ListTile(
                        title: Text("${results.length}"),
                        onTap: (){
                          close(context, results[index]);
                        },
                      );
                    },
                    itemCount: snapshot.data.length,
                  );
                }
              },
            );
          },
        )
      );
    }
  }

}