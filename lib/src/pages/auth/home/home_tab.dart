import 'package:flutter/material.dart';
import 'package:shop_app/src/pages/auth/components/item_tile.dart';

import 'components/category_tile.dart';
// ignore: library_prefixes
import 'package:shop_app/src/config/app_data.dart' as appData;

// ignore: must_be_immutable
class HomeTab extends StatefulWidget {
  const HomeTab({Key? key}) : super(key: key);

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  String selectedCategory = 'Ação';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // App Bar
      appBar: AppBar(
        centerTitle: true,
        title: const Text.rich(
          TextSpan(
            style: TextStyle(
              fontSize: 30,
            ),
            children: [
              TextSpan(
                text: 'Rain',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              TextSpan(
                text: 'Store',
                style: TextStyle(
                  color: Color.fromRGBO(71, 18, 142, 1),
                ),
              ),
            ],
          ),
        ),
        actions: [
          Padding(
            padding: const EdgeInsets.only(
              top: 15,
              right: 5,
            ),
            child: GestureDetector(
              onTap: () {},
              child: const Badge(
                backgroundColor: Colors.white,
                label: Text(
                  '3',
                  style: TextStyle(
                    color: Color.fromARGB(255, 74, 3, 109),
                    fontSize: 12,
                  ),
                ),
                child: Icon(
                  Icons.shopping_cart,
                  color: Color.fromARGB(255, 74, 3, 109),
                ),
              ),
            ),
          ),
        ],
      ),

      body: Column(
        children: [
          // Campo de pesquisa
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
              vertical: 10,
            ),
            child: TextFormField(
              decoration: InputDecoration(
                filled: true,
                fillColor: Colors.white,
                isDense: true,
                hintText: 'Pesquise aqui...',
                hintStyle: TextStyle(
                  color: Colors.grey.shade400,
                  fontSize: 14,
                ),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Color.fromRGBO(157, 35, 218, 1),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(60),
                  borderSide: const BorderSide(
                    width: 0,
                    style: BorderStyle.none,
                  ),
                ),
              ),
            ),
          ),

          // Categorias
          Container(
            padding: const EdgeInsets.only(left: 25),
            height: 40,
            child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemBuilder: (_, index) {
                  return CategoryTile(
                    onPressed: () {
                      setState(() {
                        selectedCategory = appData.categorias[index];
                      });
                    },
                    category: appData.categorias[index],
                    isSelected: appData.categorias[index] == selectedCategory,
                  );
                },
                separatorBuilder: (_, index) => const SizedBox(
                      width: 10,
                    ),
                itemCount: appData.categorias.length),
          ),

          // Grid
          Expanded(
            child: GridView.builder(
                padding: const EdgeInsets.fromLTRB(16, 0, 16, 16),
                physics: const BouncingScrollPhysics(),
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                ),
                itemCount: appData.items.length,
                itemBuilder: (_, index) {
                  return ItemTile(
                    item: appData.items[index],
                  );
                }),
          ),
        ],
      ),
    );
  }
}
