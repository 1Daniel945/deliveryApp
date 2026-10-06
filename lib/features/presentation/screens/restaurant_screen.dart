import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/theme/app_colors.dart';
import 'package:flutter_application_1/features/presentation/widgets/delivery_metrics.dart';

class RestaurantScreen extends StatefulWidget {
  const RestaurantScreen({super.key});

  @override
  State<RestaurantScreen> createState() => _RestaurantScreenState();
}

class _RestaurantScreenState extends State<RestaurantScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      /*appBar: AppBar(
        backgroundColor: Colors.transparent,
        automaticallyImplyLeading: false,
        title: Row(
          children: [
            IconButton(
              onPressed: () {
                context.pop();
              },
              icon: Icon(
                Icons.arrow_back,
                color: AppColors.textThird,
              ),
            ),
            Text(
              'Menú',
              style: TextStyle(
                color: AppColors.textThird,
              ),
            ),
          ],
        ),
      ),*/
      body: SafeArea(
        child: Column(
          children: [
            //BannerRestaurant(),
            Expanded(
              child: CustomScrollView(
                scrollDirection: .vertical,
                /*slivers: [
                    const SliverAppBar(
                      backgroundColor: Colors.amber,
                      title: Text('Kindacode.com'),
                      expandedHeight: 150,
                      collapsedHeight: 60,
                      automaticallyImplyLeading: false,
                    ),
                    const SliverAppBar(
                      backgroundColor: Colors.green,
                      title: Text('Have a nice day'),
                      floating: true,
                      automaticallyImplyLeading: false,
                    ),
                    SliverList(
                      delegate: SliverChildBuilderDelegate(
                        (BuildContext context, int index) {
                          return Card(
                            margin: const EdgeInsets.all(15),
                            child: Container(
                              color: Colors.blue[100 * (index % 9 + 1)],
                              height: 80,
                              alignment: .center,
                              child: Text(
                                'Item $index',
                                style: const TextStyle(fontSize: 30),
                              ),
                            ),
                          );
                        },
                        childCount: 10,
                      ), 
                    ),
                  ],*/
                slivers: [
                  const SliverAppBar(
                    expandedHeight: 200,
                    pinned: true,
                    flexibleSpace: FlexibleSpaceBar(
                      background: Image(
                        image: NetworkImage(
                          'https://i.ibb.co/LDbsfygk/restaurante-de-hamburgesas.jpg',
                        ),
                        fit: .cover,
                      ),
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: Container(
                      margin: EdgeInsets.all(10),
                      child: Column(
                        spacing: 8,
                        children:[
                          Text(
                            'Hamburguesas el primo',
                            style: TextStyle(
                              fontSize: 20,
                              fontWeight: .bold,
                            ),
                          ),
                          DeliveryMetrics(),
                        ],
                      ),
                    ),
                  ),
                  SliverPersistentHeader(
                    delegate: _CategoryHeaderDelegate(
                      categories: [
                        'Tacos',
                        'Tortas',
                        'Bebidas',
                        'Tacos',
                        'Tortas',
                        'Bebidas',
                        'Tacos',
                        'Tortas',
                        'Bebidas',
                      ],
                    ),
                    pinned: true,
                  ),
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      mainAxisSpacing: 0,
                      crossAxisSpacing: 0,
                      childAspectRatio: 0.68,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (context, index) => Container(
                        margin: index & 1 == 0
                            ? EdgeInsets.fromLTRB(10, 5, 5, 5)
                            : EdgeInsets.fromLTRB(5, 5, 10, 5),
                        padding: EdgeInsets.all(10),
                        decoration: BoxDecoration(
                          color: Colors.transparent,
                          borderRadius: BorderRadius.circular(12),
                          border: Border.all(color: Colors.white),
                        ),
                        child: Column(
                          spacing: 5,
                          crossAxisAlignment: .stretch,
                          mainAxisSize: .min,
                          children: [
                            Stack(
                              clipBehavior: .none,
                              children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(12),
                                  child: AspectRatio(
                                    aspectRatio: 1.0,
                                    child: Image.network(
                                      'https://i.ibb.co/v6tX7LB9/hamburguesa.webp',
                                      errorBuilder:
                                          (context, error, stackTrace) {
                                            return Container(
                                              color: Colors.grey[900],
                                              alignment: .center,
                                              child: Column(
                                                mainAxisSize: .min,
                                                children: const [
                                                  Icon(
                                                    Icons.wifi_off,
                                                    color: Colors.grey,
                                                    size: 40,
                                                  ),
                                                  SizedBox(height: 4),
                                                  Text(
                                                    'Sin imagen',
                                                    style: TextStyle(
                                                      color: Colors.grey,
                                                      fontSize: 12,
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            );
                                          },
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Positioned(
                                  right: 2,
                                  bottom: -10,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      color: AppColors.primary,
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    child: IconButton(
                                      onPressed: () {
                                        showModalBottomSheet(
                                          useSafeArea: true,
                                          showDragHandle: true,
                                          isScrollControlled: true,
                                          context: context,
                                          builder: (context) {
                                            /*return SingleChildScrollView(
                                              child: Padding(
                                                padding: const EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisSize: .min,
                                                  crossAxisAlignment: .start,
                                                  spacing: 8,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: .circular(12,),
                                                      child: AspectRatio(
                                                        aspectRatio: 16 / 9,
                                                        child: Image.network(
                                                          'https://i.ibb.co/wrdsMjYm/images-4.jpg',
                                                          errorBuilder: (context, error, stackTrace,) {
                                                            return Container(
                                                              color: Colors.grey[900],
                                                              alignment: .center,
                                                              child: Column(
                                                                mainAxisSize: .min,
                                                                children: const [
                                                                  Icon(
                                                                    Icons.wifi_off,
                                                                    color: Colors.grey,
                                                                    size: 40,
                                                                  ),
                                                                  SizedBox(height: 4,),
                                                                  Text(
                                                                    'Sin imagen',
                                                                    style: TextStyle(
                                                                      color: Colors.grey,
                                                                      fontSize: 12,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          fit: .cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: .spaceBetween,
                                                      children: [
                                                        Text(
                                                          'Hamburguesa',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: .bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '\$45 MXN',
                                                          style: TextStyle(
                                                            color: AppColors.primary,
                                                            fontWeight: .bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    Text(
                                                      'Hamburgesa doble carne con papas y refresco',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: .normal,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    Divider(
                                                      endIndent: 5,
                                                      indent: 5,
                                                    ),
                                                    Column(
                                                      crossAxisAlignment: .start,
                                                      children: [
                                                        Text(
                                                          'Ingredientes', 
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: .bold,
                                                          ),
                                                        ),
                                                        ListView.builder(
                                                          shrinkWrap: true,
                                                          itemCount: 5,
                                                          itemBuilder: (context, index) {
                                                            return CheckboxListTile(
                                                              title: Text(
                                                                'Example ${index + 1}', 
                                                                style: TextStyle(
                                                                  color: Colors.white),
                                                                ),
                                                              value: false, 
                                                              onChanged: null,
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    Divider(
                                                      endIndent: 5,
                                                      indent: 5,
                                                    ),
                                                    Text(
                                                      'Extras', 
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: .bold,
                                                      ),
                                                    ),
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      itemCount: 5,
                                                      itemBuilder: (context, index) {
                                                        return CheckboxListTile(
                                                          title: Text(
                                                            'Example ${index + 1}', 
                                                            style: TextStyle(
                                                              color: Colors.white),
                                                            ),
                                                          value: false, 
                                                          onChanged: null,
                                                        );
                                                      },
                                                    ),
                                                    TextField(),
                                                  ],
                                                ),
                                              ),
                                            );*/
                                            final bottomInset = MediaQuery.of(context).viewInsets.bottom;
                                            return Padding(
                                              padding: EdgeInsets.only(bottom: bottomInset),
                                              child: SingleChildScrollView(
                                                padding: const EdgeInsets.all(10),
                                                child: Column(
                                                  mainAxisSize: .min,
                                                  crossAxisAlignment: .start,
                                                  spacing: 8,
                                                  children: [
                                                    ClipRRect(
                                                      borderRadius: .circular(12),
                                                      child: AspectRatio(
                                                        aspectRatio: 16 / 9,
                                                        child: Image.network(
                                                          'https://i.ibb.co/wrdsMjYm/images-4.jpg',
                                                          errorBuilder: (context, error, stackTrace) {
                                                            return Container(
                                                              color: Colors.grey[900],
                                                              alignment: .center,
                                                              child: Column(
                                                                mainAxisSize: .min,
                                                                children: const [
                                                                  Icon(
                                                                    Icons.wifi_off,
                                                                    color: Colors.grey,
                                                                    size: 40,
                                                                  ),
                                                                  SizedBox(height: 4,),
                                                                  Text(
                                                                    'Sin imagen',
                                                                    style: TextStyle(
                                                                      color: Colors.grey,
                                                                      fontSize: 12,
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            );
                                                          },
                                                          fit: .cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment: .spaceBetween,
                                                      children: [
                                                        const Text(
                                                          'Hamburguesa',
                                                          style: TextStyle(
                                                            fontSize: 20,
                                                            fontWeight: .bold,
                                                          ),
                                                        ),
                                                        Text(
                                                          '\$45 MXN',
                                                          style: TextStyle(
                                                            color: AppColors.primary,
                                                            fontWeight: .bold,
                                                            fontSize: 20,
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    const Text(
                                                      'Hamburguesa doble carne con papas y refresco',
                                                      style: TextStyle(
                                                        fontSize: 16,
                                                        fontWeight: .normal,
                                                      ),
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    const Divider(endIndent: 5, indent: 5,),
                                                    Column(
                                                      crossAxisAlignment: .start,
                                                      children: [
                                                        const Text(
                                                          'Ingredientes',
                                                          style: TextStyle(
                                                            fontSize: 18,
                                                            fontWeight: .bold,
                                                          ),
                                                        ),
                                                        ListView.builder(
                                                          shrinkWrap: true,
                                                          physics: const NeverScrollableScrollPhysics(),
                                                          itemCount: 5,
                                                          itemBuilder: (context, index) {
                                                            return CheckboxListTile(
                                                              title: Text(
                                                                'Example ${index + 1}',
                                                                style: const TextStyle(color: Colors.white),
                                                              ),
                                                              checkColor: Colors.black,
                                                              fillColor: WidgetStateProperty.all(Colors.amberAccent),
                                                              checkboxShape: CircleBorder(),
                                                              value: false,
                                                              onChanged: null,
                                                            );
                                                          },
                                                        ),
                                                      ],
                                                    ),
                                                    const Divider(endIndent: 5, indent: 5,),
                                                    const Text(
                                                      'Extras',
                                                      style: TextStyle(
                                                        fontSize: 18,
                                                        fontWeight: .bold,
                                                      ),
                                                    ),
                                                    ListView.builder(
                                                      shrinkWrap: true,
                                                      physics: const NeverScrollableScrollPhysics(),
                                                      itemCount: 5,
                                                      itemBuilder: (context, index) {
                                                        return CheckboxListTile(
                                                          title: Text('Capsu', style: TextStyle(color: Colors.white),),
                                                          checkColor: Colors.black,
                                                          fillColor: WidgetStateProperty.all(Colors.amberAccent),
                                                          checkboxShape: CircleBorder(),
                                                          value: true,
                                                          onChanged: null,
                                                        );
                                                      },
                                                    ),
                                                    const SizedBox(height: 10,),
                                                    TextField(
                                                      maxLines: 5,
                                                      decoration: InputDecoration(
                                                        hintText: 'Instrucciones especiales',
                                                        hintStyle: TextStyle(
                                                          color: AppColors.textSecondary,
                                                        ),
                                                      ),
                                                    ),
                                                    const SizedBox(height: 20,),
                                                    const Divider(endIndent: 5, indent: 5,),
                                                    Row(
                                                      mainAxisAlignment: .spaceBetween,
                                                      children: [
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: .circular(50),
                                                            border: Border.all(color: Colors.white),
                                                          ),
                                                          child: Row(
                                                            spacing: 10,
                                                            children: [
                                                              IconButton(
                                                                onPressed: () {

                                                                }, 
                                                                icon: Icon(
                                                                  Icons.remove,
                                                                ),
                                                              ),
                                                              Text(
                                                                '0',
                                                                style: TextStyle(
                                                                  fontSize: 18,
                                                                  fontWeight: .bold,
                                                                ),
                                                              ),
                                                              IconButton(
                                                                onPressed: (){
                                                                  
                                                                }, 
                                                                icon: Icon(
                                                                  Icons.add,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        Container(
                                                          decoration: BoxDecoration(
                                                            borderRadius: .circular(50),
                                                            color: AppColors.primary,
                                                          ),
                                                          child: IconButton(
                                                            onPressed: () {
                                                          
                                                            }, 
                                                            icon: Row(
                                                              spacing: 6,
                                                              crossAxisAlignment: .start,
                                                              mainAxisSize: .max,
                                                              children: [
                                                                Text(
                                                                  'Agregar al carrito \$15',
                                                                  style: TextStyle(
                                                                    fontSize: 18,
                                                                    fontWeight: .normal,
                                                                    color: Colors.black,
                                                                  ),
                                                                ),
                                                                Icon(
                                                                  Icons.add_shopping_cart,
                                                                  color: Colors.black,
                                                                  fontWeight: .normal,
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        );
                                      },
                                      icon: Icon(Icons.add),
                                      color: Colors.black,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Text(
                              'Burger King',
                              style: TextStyle(
                                fontWeight: .bold,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              'Jugosa hamburgesa con doble carne xxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxxx',
                              overflow: .ellipsis,
                              maxLines: 2,
                              style: TextStyle(
                                fontWeight: .normal,
                                color: Colors.white,
                              ),
                            ),
                            Text(
                              '\$45 MXM',
                              style: TextStyle(
                                fontWeight: .bold,
                                color: AppColors.primary,
                              ),
                            ),
                          ],
                        ),
                      ),
                      childCount: 16,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CategoryHeaderDelegate extends SliverPersistentHeaderDelegate {
  final List<String> categories;

  _CategoryHeaderDelegate({required this.categories});

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      color: Theme.of(context).scaffoldBackgroundColor,
      child: ListView.builder(
        scrollDirection: Axis.horizontal,
        itemCount: categories.length,
        itemBuilder: (context, index) => Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 8.0),
          child: Chip(label: Text(categories[index])),
        ),
      ),
    );
  }

  @override
  double get maxExtent => 60.0;

  @override
  double get minExtent => 60.0;

  @override
  bool shouldRebuild(covariant _CategoryHeaderDelegate oldDelegate) => false;
}
