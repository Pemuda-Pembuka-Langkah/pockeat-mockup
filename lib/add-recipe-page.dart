import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';

class CreateRecipePage extends StatefulWidget {
  @override
  _CreateRecipePageState createState() => _CreateRecipePageState();
}

class _CreateRecipePageState extends State<CreateRecipePage> {
  final Color primaryYellow = Color(0xFFFFE893);
  final Color primaryPink = Color(0xFFFF6B6B);
  final Color primaryGreen = Color(0xFF4ECDC4);

  final _nameController = TextEditingController();
  final _servingsController = TextEditingController();

  // Sample data untuk bahan-bahan umum
  List<Map<String, dynamic>> commonIngredients = [
    // Karbohidrat
    {
      'name': 'Nasi Putih',
      'calories': 130,
      'unit': 'gram',
      'protein': 2.7,
      'carbs': 28,
      'fat': 0.3,
      'category': 'Karbohidrat'
    },
    {
      'name': 'Kentang',
      'calories': 77,
      'unit': 'gram',
      'protein': 2.0,
      'carbs': 17,
      'fat': 0.1,
      'category': 'Karbohidrat'
    },
    {
      'name': 'Mie Instant',
      'calories': 138,
      'unit': 'gram',
      'protein': 3.0,
      'carbs': 25,
      'fat': 3.3,
      'category': 'Karbohidrat'
    },

    // Protein
    {
      'name': 'Ayam Dada',
      'calories': 165,
      'unit': 'gram',
      'protein': 31,
      'carbs': 0,
      'fat': 3.6,
      'category': 'Protein'
    },
    {
      'name': 'Telur',
      'calories': 155,
      'unit': 'butir',
      'protein': 13,
      'carbs': 1.1,
      'fat': 11,
      'category': 'Protein'
    },
    {
      'name': 'Ikan Salmon',
      'calories': 208,
      'unit': 'gram',
      'protein': 22,
      'carbs': 0,
      'fat': 13,
      'category': 'Protein'
    },
    {
      'name': 'Tahu',
      'calories': 76,
      'unit': 'gram',
      'protein': 8,
      'carbs': 1.9,
      'fat': 4.8,
      'category': 'Protein'
    },
    {
      'name': 'Tempe',
      'calories': 193,
      'unit': 'gram',
      'protein': 19,
      'carbs': 9.4,
      'fat': 11,
      'category': 'Protein'
    },

    // Sayuran
    {
      'name': 'Bayam',
      'calories': 23,
      'unit': 'gram',
      'protein': 2.9,
      'carbs': 3.6,
      'fat': 0.4,
      'category': 'Sayuran'
    },
    {
      'name': 'Wortel',
      'calories': 41,
      'unit': 'gram',
      'protein': 0.9,
      'carbs': 9.6,
      'fat': 0.2,
      'category': 'Sayuran'
    },
    {
      'name': 'Brokoli',
      'calories': 34,
      'unit': 'gram',
      'protein': 2.8,
      'carbs': 7,
      'fat': 0.4,
      'category': 'Sayuran'
    },

    // Buah
    {
      'name': 'Pisang',
      'calories': 89,
      'unit': 'buah',
      'protein': 1.1,
      'carbs': 23,
      'fat': 0.3,
      'category': 'Buah'
    },
    {
      'name': 'Apel',
      'calories': 52,
      'unit': 'buah',
      'protein': 0.3,
      'carbs': 14,
      'fat': 0.2,
      'category': 'Buah'
    },

    // Minyak dan Lemak
    {
      'name': 'Minyak Goreng',
      'calories': 884,
      'unit': 'sendok makan',
      'protein': 0,
      'carbs': 0,
      'fat': 100,
      'category': 'Minyak'
    },
    {
      'name': 'Mentega',
      'calories': 717,
      'unit': 'sendok makan',
      'protein': 0.9,
      'carbs': 0.1,
      'fat': 81,
      'category': 'Minyak'
    },
  ];

  List<Map<String, dynamic>> selectedIngredients = [];

  Map<String, double> totalNutrition = {
    'calories': 0,
    'protein': 0,
    'carbs': 0,
    'fat': 0,
  };

  String formatNumber(double number) {
    return number.toStringAsFixed(1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black87),
          onPressed: () => Navigator.pop(context),
        ),
        title: Text(
          'Buat Resep',
          style: TextStyle(
            color: Colors.black87,
            fontSize: 18,
            fontWeight: FontWeight.w600,
          ),
        ),
        actions: [
          TextButton(
            onPressed: _saveRecipe,
            child: Text(
              'Simpan',
              style: TextStyle(
                color: primaryGreen,
                fontWeight: FontWeight.w600,
              ),
            ),
          ),
        ],
      ),
      body: Column(
        children: [
          _buildBasicInfo(),
          _buildIngredientsList(),
          _buildNutritionSummary(),
        ],
      ),
    );
  }

  Widget _buildBasicInfo() {
    return Container(
      padding: EdgeInsets.all(16),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Informasi Resep',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          Row(
            children: [
              Expanded(
                flex: 2,
                child: TextField(
                  controller: _nameController,
                  decoration: InputDecoration(
                    labelText: 'Nama Resep',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                ),
              ),
              SizedBox(width: 12),
              Expanded(
                child: TextField(
                  controller: _servingsController,
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    labelText: 'Porsi',
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  onChanged: (value) {
                    if (value.isNotEmpty) {
                      _calculateTotalNutrition();
                    }
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildIngredientsList() {
    return Expanded(
      child: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Bahan-bahan',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.w600,
                    color: Colors.black87,
                  ),
                ),
                TextButton.icon(
                  onPressed: _showIngredientPicker,
                  icon: Icon(Icons.add, color: primaryGreen),
                  label: Text(
                    'Tambah Bahan',
                    style: TextStyle(color: primaryGreen),
                  ),
                ),
              ],
            ),
            SizedBox(height: 12),
            Expanded(
              child: ListView.builder(
                itemCount: selectedIngredients.length,
                itemBuilder: (context, index) {
                  final ingredient = selectedIngredients[index];
                  return Card(
                    margin: EdgeInsets.only(bottom: 8),
                    child: Padding(
                      padding: EdgeInsets.all(12),
                      child: Row(
                        children: [
                          Expanded(
                            flex: 2,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  ingredient['name'],
                                  style: TextStyle(
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                                SizedBox(height: 4),
                                Text(
                                  '${formatNumber(ingredient['calories'].toDouble())} kcal / ${ingredient['unit']}',
                                  style: TextStyle(
                                    color: Colors.black54,
                                    fontSize: 12,
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Expanded(
                            child: TextField(
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                suffixText: ingredient['unit'],
                                border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(8),
                                ),
                              ),
                              onChanged: (value) {
                                _updateIngredientAmount(index, value);
                              },
                            ),
                          ),
                          IconButton(
                            icon: Icon(Icons.delete, color: primaryPink),
                            onPressed: () => _removeIngredient(index),
                          ),
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildNutritionSummary() {
    return Container(
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.05),
            blurRadius: 10,
            offset: Offset(0, -5),
          ),
        ],
      ),
      child: Column(
        children: [
          Text(
            'Total Nutrisi per Porsi',
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w600,
              color: Colors.black87,
            ),
          ),
          SizedBox(height: 16),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              _nutritionItem('Kalori', totalNutrition['calories']!, 'kcal', primaryPink),
              _nutritionItem('Protein', totalNutrition['protein']!, 'g', primaryGreen),
              _nutritionItem('Karbo', totalNutrition['carbs']!, 'g', primaryYellow),
              _nutritionItem('Lemak', totalNutrition['fat']!, 'g', Colors.blue),
            ],
          ),
        ],
      ),
    );
  }

  Widget _nutritionItem(String label, double value, String unit, Color color) {
    return Column(
      children: [
        Text(
          label,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
        SizedBox(height: 4),
        Text(
          formatNumber(value),
          style: TextStyle(
            color: color,
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        Text(
          unit,
          style: TextStyle(
            color: Colors.black54,
            fontSize: 12,
          ),
        ),
      ],
    );
  }

  List<Map<String, dynamic>> getIngredientsByCategory(String category) {
    return commonIngredients.where((ingredient) => ingredient['category'] == category).toList();
  }

  void _showIngredientPicker() {
 showModalBottomSheet(
   context: context,
   isScrollControlled: true,
   shape: RoundedRectangleBorder(
     borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
   ),
   builder: (context) => Container(
     height: MediaQuery.of(context).size.height * 0.8,
     padding: EdgeInsets.all(16),
     child: Column(
       crossAxisAlignment: CrossAxisAlignment.start,
       children: [
         Text(
           'Pilih Bahan',
           style: TextStyle(
             fontSize: 18,
             fontWeight: FontWeight.w600,
           ),
         ),
         SizedBox(height: 16),
         TextField(
           decoration: InputDecoration(
             hintText: 'Cari bahan...',
             prefixIcon: Icon(Icons.search),
             border: OutlineInputBorder(
               borderRadius: BorderRadius.circular(12),
             ),
           ),
         ),
         SizedBox(height: 16),
         Expanded(
           child: DefaultTabController(
             length: 5,
             child: Column(
               children: [
                 TabBar(
                   isScrollable: true,
                   labelColor: primaryGreen,
                   unselectedLabelColor: Colors.black54,
                   tabs: [
                     Tab(text: 'Karbohidrat'),
                     Tab(text: 'Protein'), 
                     Tab(text: 'Sayuran'),
                     Tab(text: 'Buah'),
                     Tab(text: 'Minyak'),
                   ],
                 ),
                 Expanded(
                   child: TabBarView(
                     children: [
                       _buildIngredientList('Karbohidrat'),
                       _buildIngredientList('Protein'),
                       _buildIngredientList('Sayuran'), 
                       _buildIngredientList('Buah'),
                       _buildIngredientList('Minyak'),
                     ],
                   ),
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

Widget _buildIngredientList(String category) {
 final ingredients = getIngredientsByCategory(category);
 return ListView.builder(
   itemCount: ingredients.length,
   itemBuilder: (context, index) {
     final ingredient = ingredients[index];
     return ListTile(
       title: Text(ingredient['name']),
       subtitle: Text(
         '${formatNumber(ingredient['calories'].toDouble())} kcal/${ingredient['unit']}\n'
         'P: ${formatNumber(ingredient['protein'].toDouble())}g | '
         'K: ${formatNumber(ingredient['carbs'].toDouble())}g | '
         'L: ${formatNumber(ingredient['fat'].toDouble())}g',
       ),
       trailing: Icon(Icons.add),
       onTap: () {
         setState(() {
           selectedIngredients.add(Map.from(ingredient)..['amount'] = 0.0);
         });
         Navigator.pop(context);
         _calculateTotalNutrition();
       },
     );
   },
 );
}

void _updateIngredientAmount(int index, String value) {
 setState(() {
   double amount = double.tryParse(value) ?? 0;
   selectedIngredients[index]['amount'] = amount;
   _calculateTotalNutrition();
 });
}

void _removeIngredient(int index) {
 setState(() {
   selectedIngredients.removeAt(index);
   _calculateTotalNutrition();
 });
}

void _calculateTotalNutrition() {
 double totalCalories = 0;
 double totalProtein = 0;
 double totalCarbs = 0;
 double totalFat = 0;
 int servings = int.tryParse(_servingsController.text) ?? 1;

 for (var ingredient in selectedIngredients) {
   double amount = ingredient['amount'] ?? 0;
   totalCalories += (ingredient['calories'] * amount) / 100;
   totalProtein += (ingredient['protein'] * amount) / 100;
   totalCarbs += (ingredient['carbs'] * amount) / 100;
   totalFat += (ingredient['fat'] * amount) / 100;
 }

 setState(() {
   totalNutrition = {
     'calories': totalCalories / servings,
     'protein': totalProtein / servings,
     'carbs': totalCarbs / servings,
     'fat': totalFat / servings,
   };
 });
}

void _saveRecipe() {
 // Implement save logic
 Navigator.pop(context);
}}