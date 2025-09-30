import 'package:flutter/material.dart';
import 'package:quis_124230037/models/animal_data.dart';
import 'package:quis_124230037/pages/detail_page.dart';
import 'package:quis_124230037/pages/login_page.dart';

class HomePage extends StatelessWidget {
  final String username;
  const HomePage({super.key, required this.username});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xFFFE7F2D),
        title: Text(
          "Animal List",
          style: const TextStyle(
            color: Color(0xFF233D4D),
            fontWeight: FontWeight.bold,
          ),
        ),
        actions: [
          IconButton(
            onPressed: (){
              Navigator.pushAndRemoveUntil(
                context,
                MaterialPageRoute(builder: (context){
                  return LoginPage();
                }),
                (route)=> false);
            },
            icon: Icon(Icons.logout_outlined, 
              color: Color(0xFF233D4D),)),
          
        ],
      ),

      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 20.0),
            child: Center(
              child: Text(
                "Welcome, $username!",
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF233D4D),
                ),
              ),
            ),
          ),

          Expanded(
            child: ListView.builder(
              itemCount: dummyAnimals.length,
              itemBuilder: (context, index) {
                return _animalCard(context, index);
              },
            ),
          ),
        ],
      ),
    );
  }
  


      Widget _animalCard(BuildContext context, int index) {
        final animals = dummyAnimals[index];
        return InkWell(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => DetailPage(index: index),
              ),
            );
          },
          child: Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15),
            ),
            margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
            elevation: 5,
            child: Row(
              children: [
                ClipRRect(
                  borderRadius: const BorderRadius.horizontal(
                    left: Radius.circular(12),
                  ),
                  child: Image.network(
                    animals.image,
                    fit: BoxFit.cover,
                    width: 100,
                    height: 140,
                  ),
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(12.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          animals.name,
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0xFF233D4D),
                          ),
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                        ),
                        const SizedBox(height: 8),

                   
                        Row(
                          children: [
                            const SizedBox(width: 4),
                            Text(
                              animals.type,
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF233D4D),
                              ),
                            ),
                          ],
                        ),

                        Row(
                          children: [
                            const SizedBox(width: 4),
                            Text(
                              animals.habitat.join(', '),
                              style: const TextStyle(
                                fontSize: 15,
                                color: Color(0xFF233D4D),
                              ),
                            ),
                          ],
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



   