import 'package:flutter/material.dart';
import 'package:quis_124230037/models/animal_data.dart';
import 'package:url_launcher/url_launcher.dart';


class DetailPage extends StatefulWidget {
  final int index;

  const DetailPage({super.key, required this.index});

  @override
  State<DetailPage> createState() => _DetailPageState();
}

class _DetailPageState extends State<DetailPage> {
  @override
  Widget build(BuildContext context) {
    final animals = dummyAnimals[widget.index]; 
    bool _liked = false;

    return Scaffold(
      appBar: AppBar(
        backgroundColor:  Color(0xFFFE7F2D),
        title: Text(
          animals.name,
          style: const TextStyle(
            color: Color(0xFF233D4D),
            fontWeight: FontWeight.bold,
          ),
        ),
         actions: [
          IconButton(
            onPressed: (){ 
              setState(() {
                _liked = !_liked;
              });
            },
            icon: Icon(_liked ? Icons.favorite : Icons.favorite_border_outlined, color: Colors.red,) ),
          
        ],
      ),

      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(5),
                  child: Image.network(
                    animals.image,
                    width: 120,
                    height: 180,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        animals.name,
                        style: const TextStyle(
                          fontSize: 20,
                          fontWeight: FontWeight.bold,
                          color: Color(0xFF233D4D),
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 5),
                      Text(
                        animals.type,
                        style: const TextStyle(
                          fontSize: 14,
                          color: Color(0xFF233D4D),
                          height: 1.5,
                        ),
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        textAlign: TextAlign.justify,
                      ),
                      const SizedBox(height: 8),
                    ],
                  ),
                ),
              ],
            ),

            const SizedBox(height: 24),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: const Text(
                        "Habitat",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF233D4D),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        animals.habitat.join(', '),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFE7F2D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: 80,
                      child: const Text(
                        "Aktivitas",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF233D4D),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        animals.activities.join(', '),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFE7F2D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: const Text(
                        "Height",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF233D4D),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        animals.height.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFE7F2D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 8),

                Row(
                  children: [
                    SizedBox(
                      width: 80,
                      child: const Text(
                        "Weight",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 16,
                          color: Color(0xFF233D4D),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Text(
                        animals.weight.toString(),
                        style: const TextStyle(
                          fontSize: 16,
                          color: Color(0xFFFE7F2D),
                        ),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 24),
                

                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton.icon(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFFFE7F2D),
                      foregroundColor: Colors.white,
                      padding: const EdgeInsets.symmetric(vertical: 14),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    icon: const Icon(Icons.link),
                    label: const Text(
                      "More Information",
                      style: TextStyle(fontSize: 16),
                    ),
                    onPressed: () async {
                      final Uri url = Uri.parse(animals.wikipedia);
                      if (await canLaunchUrl(url)) {
                        await launchUrl(
                          url,
                          mode: LaunchMode.externalApplication,
                        );
                      } else {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text("Tidak bisa membuka URL"),
                          ),
                        );
                      }
                    },
                  ),
                ),
              ],
            ),
          ],
        ),

      ),
    );
  }
}



