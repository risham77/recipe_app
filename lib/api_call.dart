import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

class ApiCall extends StatefulWidget {
  const ApiCall({super.key});

  @override
  State<ApiCall> createState() => _ApiCallState();
}

class _ApiCallState extends State<ApiCall> {
  //First Create a list to store the recipes
  List<dynamic> recipe_data = [];
  //Now ceate a functio to fetch the data from API
  //like getting data from the internet without stopping the app screen
  void fetchData() async {
    try {
      final dio = Dio(); //create object for Dio class
      //now this variable store the response from API
      //get method get the data from API
      final response = await dio.get(
        'https://www.themealdb.com/api/json/v1/1/search.php?s=chicken',
      );
      //now store the data in variable meal
      final meal = response.data['meals'];
      if (meal is List) {
        setState(() {
          recipe_data = meal;
        });
      } else {
        print("Error in fetching");
      }
    } catch (e) {
      print("Error in fetching data: $e"); //catch it and show the error
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Recipe List Displaying'),
        backgroundColor: Colors.deepPurple,
      ),
      body: Column(
        children: [
          ElevatedButton(
            onPressed: () => fetchData(),
            child: Text('Fetch Recipe'),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: recipe_data.length,
              itemBuilder: (context, index) {
                final recipe = recipe_data[index];
                return ListTile(
                  leading: ClipRRect(
                    borderRadius: BorderRadius.circular(60),
                    child: Image.network(
                      recipe['strMealThumb'],

                      fit: BoxFit.cover,
                    ),
                  ),

                  title: Text(
                    recipe['strMeal'],
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                  ),
                  subtitle: Text(
                    recipe['strArea'],
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w300),
                  ),
                  trailing: Icon(
                    Icons.arrow_forward_ios,
                    color: Colors.deepPurple,
                    size: 20,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
