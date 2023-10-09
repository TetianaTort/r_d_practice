import 'package:flutter/material.dart';
import 'package:flutter_slidable/flutter_slidable.dart';
import 'package:r_d_practice/recipes/data.dart';

class RecipesScreen extends StatefulWidget {
  const RecipesScreen({super.key});

  @override
  State<RecipesScreen> createState() => _RecipesScreenState();
}

class _RecipesScreenState extends State<RecipesScreen> {
  bool isListView = true;

  void toggleView() {
    setState(() {
      isListView = !isListView;
    });
  }

  void deleteMeal({required int index}) {
    meals.removeAt(index);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 228, 167, 252),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text('My Recepies'),
        backgroundColor: Colors.transparent,
      ),
      floatingActionButton: FloatingActionButton(
          onPressed: toggleView,
          child: isListView ? const Icon(Icons.grid_view) : const Icon(Icons.list)),
      body: BackgroundScreen(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: isListView
                ? ListView.builder(
                    itemCount: meals.length,
                    itemBuilder: ((context, index) {
                      return Slidable(
                        key: ValueKey(index),
                        endActionPane: ActionPane(
                          dismissible: DismissiblePane(onDismissed: () => deleteMeal(index: index)),
                          motion: const ScrollMotion(),
                          children: [
                            SlidableAction(
                              onPressed: (context) {
                                setState(() => deleteMeal(index: index));
                              },
                              backgroundColor: const Color.fromARGB(255, 166, 46, 46),
                              foregroundColor: Colors.white,
                              icon: Icons.delete,
                              label: 'Delete',
                            ),
                          ],
                        ),
                        child: RecipesCard(
                          meal: meals[index],
                          isList: isListView,
                        ),
                      );
                    }),
                  )
                : GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                    ),
                    itemCount: meals.length,
                    itemBuilder: ((context, index) {
                      return RecipesCard(
                        meal: meals[index],
                        isList: isListView,
                      );
                    }),
                  ),
          ),
        ),
      ),
    );
  }
}

class RecipesCard extends StatelessWidget {
  const RecipesCard({super.key, required this.meal, required this.isList});
  final Meal meal;
  final bool isList;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10.0),
      child: Container(
        clipBehavior: Clip.hardEdge,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          color: Colors.grey[300],
        ),
        height: isList ? 250 : 100,
        child: Column(
          children: [
            Expanded(
              child: Image.network(
                meal.imageUrl,
                height: isList ? 200 : null,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            ),
            Text(
              meal.title,
              style: const TextStyle(fontSize: 11, fontWeight: FontWeight.bold),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Icon(
                  Icons.access_time_rounded,
                  size: 16,
                ),
                const SizedBox(width: 5),
                Text('${meal.duration.toString()} min'),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class BackgroundScreen extends StatelessWidget {
  const BackgroundScreen({super.key, required this.child});
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Colors.blue, Colors.green],
        ),
      ),
      child: child,
    );
  }
}
