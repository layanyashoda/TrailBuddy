// budget_screen.dart
import 'package:flutter/material.dart';
import 'package:iconsax/iconsax.dart';

class BudgetScreen extends StatefulWidget {
  @override
  _BudgetScreenState createState() => _BudgetScreenState();
}

class _BudgetScreenState extends State<BudgetScreen> with SingleTickerProviderStateMixin {
  double budget = 0.0;
  double accommodationBudget = 0.0;
  double equipmentBudget = 0.0;
  double otherBudget = 0.0;
  double totalSpent = 0.0;
  List<Map<String, dynamic>> expenses = [];
  List<Map<String, dynamic>> hotels = [
    {'name': 'Ravana Pool Club By 98 Acres', 'rating': 4.5, 'image': 'assets/images/hotels/hotel_a.jpg'},
    {'name': 'Green Hill Elle', 'rating': 4.0, 'image': 'assets/images/hotels/hotel_b.jpg'},
    {'name': 'Elle Mount Heaven', 'rating': 3.5, 'image': 'assets/images/hotels/hotel_c.jpg'},
  ];

  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();
  late AnimationController _controller;
  late Animation<double> _fadeAnimation;

  @override
  void initState() {
    super.initState();
    _controller = AnimationController(vsync: this, duration: Duration(seconds: 1));
    _fadeAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(_controller);
    _controller.forward();
  }

  void setBudget(double value) {
    setState(() {
      budget = value;
      accommodationBudget = value * 0.5;
      equipmentBudget = value * 0.25;
      otherBudget = value * 0.25;
    });
  }

  void addExpense(String category, double amount) {
    setState(() {
      expenses.add({'category': category, 'amount': amount});
      totalSpent += amount;
      _listKey.currentState?.insertItem(expenses.length - 1);
    });
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Budget Tracker'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            BudgetInputField(onSubmitted: setBudget),
            BudgetDisplay(
              accommodationBudget: accommodationBudget,
              equipmentBudget: equipmentBudget,
              otherBudget: otherBudget,
            ),
            ExpenseInputField(onSubmitted: addExpense),
            ExpenseList(expenses: expenses, listKey: _listKey),
            HotelSuggestions(hotels: hotels, fadeAnimation: _fadeAnimation),
            if (totalSpent > budget) BudgetAlert(),
          ],
        ),
      ),
    );
  }
}

class BudgetInputField extends StatelessWidget {
  final Function(double) onSubmitted;

  BudgetInputField({required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Set a Budget', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            keyboardType: TextInputType.number,
            decoration: InputDecoration(labelText: 'Enter your budget'),
            onSubmitted: (value) => onSubmitted(double.parse(value)),
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class BudgetDisplay extends StatelessWidget {
  final double accommodationBudget;
  final double equipmentBudget;
  final double otherBudget;

  BudgetDisplay({
    required this.accommodationBudget,
    required this.equipmentBudget,
    required this.otherBudget,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text('Accommodation: \$${accommodationBudget.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
        Text('Equipment: \$${equipmentBudget.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
        Text('Other: \$${otherBudget.toStringAsFixed(2)}', style: TextStyle(fontSize: 16)),
        const SizedBox(height: 16),
      ],
    );
  }
}

class ExpenseInputField extends StatelessWidget {
  final Function(String, double) onSubmitted;

  ExpenseInputField({required this.onSubmitted});

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: Duration(milliseconds: 500),
      curve: Curves.easeInOut,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('Track Spending', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
          TextField(
            keyboardType: TextInputType.text,
            decoration: InputDecoration(labelText: 'Enter expense category'),
            onSubmitted: (category) {
              showDialog(
                context: context,
                builder: (context) {
                  return AlertDialog(
                    title: Text('Enter amount'),
                    content: TextField(
                      keyboardType: TextInputType.number,
                      onSubmitted: (amount) {
                        onSubmitted(category, double.parse(amount));
                        Navigator.pop(context);
                      },
                    ),
                  );
                },
              );
            },
          ),
          const SizedBox(height: 16),
        ],
      ),
    );
  }
}

class ExpenseList extends StatelessWidget {
  final List<Map<String, dynamic>> expenses;
  final GlobalKey<AnimatedListState> listKey;

  ExpenseList({required this.expenses, required this.listKey});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: AnimatedList(
        key: listKey,
        initialItemCount: expenses.length,
        itemBuilder: (context, index, animation) {
          return SizeTransition(
            sizeFactor: animation,
            child: ListTile(
              title: Text(expenses[index]['category']),
              trailing: Text('\$${expenses[index]['amount'].toStringAsFixed(2)}'),
            ),
          );
        },
      ),
    );
  }
}

class HotelSuggestions extends StatelessWidget {
  final List<Map<String, dynamic>> hotels;
  final Animation<double> fadeAnimation;

  HotelSuggestions({required this.hotels, required this.fadeAnimation});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FadeTransition(
        opacity: fadeAnimation,
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
          ),
          itemCount: hotels.length,
          itemBuilder: (context, index) {
            return Card(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(hotels[index]['image'], fit: BoxFit.cover, height: 100, width: double.infinity),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(hotels[index]['name'], style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold)),
                        Row(
                          children: [
                            Icon(Iconsax.star, color: Colors.yellow, size: 16),
                            SizedBox(width: 4),
                            Text('${hotels[index]['rating']} ⭐'),
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        ),
      ),
    );
  }
}

class BudgetAlert extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text('Alert: You are over your budget!', style: TextStyle(color: Colors.red));
  }
}