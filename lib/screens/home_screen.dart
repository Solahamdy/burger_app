import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sixth_app/blocs/app_cubit/app_cubit.dart';
import 'package:sixth_app/components/home_screen_components/custom_card%20item.dart';
import 'package:sixth_app/components/home_screen_components/menu_categories.dart';

class HomeScreen extends StatefulWidget {




  HomeScreen( {super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {



  @override
  Widget build(BuildContext context) {
    return BlocConsumer<AppCubit, AppState>(
      listener: (context, state) {
        // TODO: implement listener
      },
      builder: (context, state) {
        var cubit = AppCubit.get(context);
        return Scaffold(
          backgroundColor: Colors.white,
          drawer: const Drawer(),
          appBar: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
            leadingWidth: 22,
            leading: InkWell(
              onTap: () {},
              borderRadius: BorderRadius.circular(20),
              child: const Icon(Icons.menu, color: Colors.orange, size: 30),
            ),
            title: const Text('Home',
                style: TextStyle(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.bold)),
            actions: const [
              Icon(Icons.notifications, size: 30, color: Colors.orange),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 16,
                backgroundColor: Colors.orange,
                child: Icon(Icons.shopping_cart_outlined,
                    size: 25, color: Colors.white),
              ),
              SizedBox(
                width: 10,
              ),
              CircleAvatar(
                radius: 16,
                backgroundImage: AssetImage('assets/man1.jpg'),
              ),
              SizedBox(
                width: 10,
              ),
            ],
          ),
          body: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Overview',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  ' Hello john ,Welcome back !',
                  style: TextStyle(
                      color: Colors.grey,
                      fontSize: 15,
                      fontWeight: FontWeight.normal),
                ),
                const SizedBox(
                  height: 15,
                ),
                TextFormField(
                  decoration: InputDecoration(
                    prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.filter_list),
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(5),
                    ),
                    hintText: "Search",
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5),
                        borderSide: const BorderSide(color: Colors.grey)),
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const Text(
                  'Menu Categories',
                  style: TextStyle(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.bold),
                ),
                const SizedBox(
                  height: 15,
                ),
                SizedBox(
                  width: 340,
                  height: 85,
                  child: ListView(
                    scrollDirection: Axis.horizontal,
                    shrinkWrap: true,
                    // physics: const AlwaysScrollableScrollPhysics(),
                    children: [
                      MenuCategories(image: 'assets/menu.png', text: 'All'),
                      const SizedBox(
                        width: 10,
                      ),
                      MenuCategories(
                          image: 'assets/burger.png',
                          text: 'Burger',
                          color: Colors.orange),
                      const SizedBox(
                        width: 10,
                      ),
                      MenuCategories(
                        image: 'assets/pizza.png',
                        text: 'Pizza',
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      MenuCategories(image: 'assets/snack.png', text: 'Snacks'),
                      const SizedBox(
                        width: 10,
                      ),
                      MenuCategories(
                          image: 'assets/fried-chicken.png',
                          text: 'Fried_chicken'),
                      const SizedBox(
                        width: 10,
                      ),
                      MenuCategories(image: 'assets/salad.png', text: 'Salads'),
                      const SizedBox(
                        width: 10,
                      ),
                      MenuCategories(image: 'assets/nachos.png', text: 'Tacos'),
                      const SizedBox(
                        width: 10,
                      ),
                      MenuCategories(
                          image: 'assets/pop-corn.png', text: 'Pop_corn'),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 10,
                ),
                Expanded(
                  child: GridView.builder(
                    itemCount: cubit.gridData.length,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 11 / 16,
                    ),
                    itemBuilder: (context, index) {
                      return CustomCardItem(
                        func:(){cubit.isFavoriteChanged(index) ;},
                        isFavorite: cubit.gridData[index]['isFavorite'],
                        offer: cubit.gridData[index]['offer'],
                        isOffer: cubit.gridData[index]['isOffer'],
                        image: cubit.gridData[index]['image'],
                        name: cubit.gridData[index]['name'],
                        weight: cubit.gridData[index]['weight'],
                        price: cubit.gridData[index]['price'],
                        oldPrice: cubit.gridData[index]['oldPrice'],
                        addToTotal: cubit.addToTotal,
                      );
                    },
                  ),
                ),
                Stack(
                  children: [
                    Container(
                      height: 40,
                      width: double.infinity,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(5),
                          boxShadow: [
                            BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 2,
                              blurRadius: 5,
                              offset: const Offset(0, 3),
                            ),
                          ]),
                      child: Row(
                        children: [
                          const SizedBox(
                            width: 10,
                          ),
                          const Text(
                            "Total : ",
                            style: TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          Text(
                            '${cubit.total}',
                            style: const TextStyle(
                                color: Colors.black,
                                fontSize: 18,
                                fontWeight: FontWeight.bold),
                          ),
                          const Spacer(),
                          Container(
                            width: 80,
                            height: 40,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(5),
                              color: Colors.orange,
                            ),
                            child: const Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'Cart',
                                  style: TextStyle(
                                      color: Colors.white, fontSize: 15),
                                ),
                                SizedBox(
                                  width: 5,
                                ),
                                Icon(
                                  Icons.shopping_cart_outlined,
                                  color: Colors.white,
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )
                  ],
                )
              ],
            ),
          ),
        );
      },
    );
  }
}
