import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:food_delivery_app/basket/basket_item.dart';
import 'package:food_delivery_app/bloc/basket/basket_bloc.dart';
import 'package:food_delivery_app/my_meals/meals.dart';
import 'package:food_delivery_app/my_restaurant/restaurant.dart';
import 'package:food_delivery_app/widgets/borderless_box_decoration.dart';
import 'package:food_delivery_app/widgets/custom_navigation_bar.dart';

class CartScrean extends StatefulWidget {
  const CartScrean({Key? key}) : super(key: key);

  @override
  State<CartScrean> createState() => _CartScreanState();
}

class _CartScreanState extends State<CartScrean> {
  @override
  Widget build(BuildContext context) {
    var sum = 0;
    var sumPrice = 0;

    void initState() {
      super.initState();
      sum;
      sumPrice;
    }

    for (var element in context.read<BasketBloc>().cartItems) {
      sum += element.count;
    }
    for (var element in context.read<BasketBloc>().cartItems) {
      int elementMealPrice = int.parse(element.meal.price);
      //double elementCount = double.parse(element.count);
      //restaurant = element.restaurant;
      sumPrice += elementMealPrice * element.count;
      //  * element.count;
    }
    setState(() {
      sum;
      sumPrice;
    });
    return context.read<BasketBloc>().cartItems.isEmpty
        ? Scaffold(
            body: Column(
              children: [
                Container(
                  width: double.infinity,
                  height: 200,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 120,
                        child: Image.asset(
                            'assets/images/kisspng-shopping-cart-3d-computer-graphics-pushing-a-shopping-cart-concept-villain-5a9850bd3616e4.1013427115199315812216.png'),
                      ),
                      SizedBox(
                        width: 10,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text('Your  cart is empty'),
                          SizedBox(
                            height: 10,
                          ),
                          Text(
                            'See recommendations',
                            style: TextStyle(color: Color(0xff287184)),
                          )
                        ],
                      )
                    ],
                  ),
                ),
                Divider(
                  color: Colors.grey,
                  thickness: 1,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        SizedBox(
                          width: 7,
                        ),
                        Icon(
                          Icons.error_outline,
                          size: 30,
                        ),
                        SizedBox(
                          width: 3,
                        ),
                        Text(
                          'Did you Know?',
                          style: TextStyle(
                              fontWeight: FontWeight.bold, fontSize: 20),
                        )
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10.0),
                      child: Text(
                        'Swip left on an item you saved for later to move it \nto your cart. ',
                        style: TextStyle(fontSize: 17),
                      ),
                    )
                  ],
                ),
                Expanded(
                  // Expands to use available space based on flex factor
                  flex: 1,
                  child: SizedBox(),
                ),
                CustomNavigationBar(),
              ],
            ),
          )
        : Scaffold(
            body: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                  child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(
                    height: 80,
                  ),

                  Text(
                    'Order details',
                    style: TextStyle(fontWeight: FontWeight.bold, fontSize: 38),
                  ),
                  //  customListBuildercartscrean(sum, sumPrice),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: context.read<BasketBloc>().cartItems.length,
                    itemBuilder: (context, index) {
                      MyRestaurant restaurant = context
                          .read<BasketBloc>()
                          .cartItems
                          .elementAt(index)
                          .restaurant;
                      MyMeals product = context
                          .read<BasketBloc>()
                          .cartItems
                          .elementAt(index)
                          .meal;
                      CartItem cartItem =
                          context.read<BasketBloc>().cartItems.elementAt(index);

                      return Container(
                        width: double.infinity,
                        // height: 200,
                        margin: const EdgeInsets.all(5),
                        decoration: borderLessBoxDecoration(),
                        child: ListTile(
                          leading: CachedNetworkImage(
                            height: 184 / 2,
                            imageUrl: product.picture,
                            progressIndicatorBuilder:
                                (context, url, downloadProgress) =>
                                    CircularProgressIndicator(
                                        value: downloadProgress.progress),
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                          title: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                product.name,
                                style: const TextStyle(
                                  color: Color(0xFF09041B),
                                  fontSize: 15,
                                  fontFamily: 'BentonSans Medium',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Opacity(
                                opacity: 0.30,
                                child: Text(
                                  restaurant.name,
                                  style: const TextStyle(
                                    color: Color(0xFF3B3B3B),
                                    fontSize: 14,
                                    fontFamily: 'BentonSans Regular',
                                    fontWeight: FontWeight.w400,
                                    letterSpacing: 0.50,
                                  ),
                                ),
                              ),
                              Text(
                                '\$ ${product.price}',
                                style: const TextStyle(
                                  color: Colors.greenAccent,
                                  fontSize: 22,
                                  fontFamily: 'BentonSans Bold',
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                          trailing: Container(
                            width: 115,
                            decoration: BoxDecoration(
                              border: Border.all(
                                width: 1,
                                color: Colors.grey,
                              ),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: Row(
                              children: [
                                IconButton(
                                  icon: const Icon(Icons.remove),
                                  onPressed: () {
                                    setState(() {
                                      if (cartItem.count > 1) {
                                        cartItem.count--;
                                      } else {
                                        context
                                            .read<BasketBloc>()
                                            .cartItems
                                            .remove(cartItem);
                                      }
                                    });
                                  },
                                ),
                                Text(
                                  '${cartItem.count}',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 18),
                                ), // Display the count here
                                IconButton(
                                  icon: const Icon(Icons.add),
                                  onPressed: () {
                                    setState(() {
                                      cartItem.count++;
                                    });
                                  },
                                ),
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Container(
                    height: 200,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(22),
                      boxShadow: const [
                        BoxShadow(
                            offset: Offset(0, 0),
                            color: Color(0x115a6cea),
                            spreadRadius: 25,
                            blurRadius: 25)
                      ],
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [Color(0xff48dd89), Color(0xff1cc37a)],
                      ),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 18.0, vertical: 10),
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Sub-Total',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '${sumPrice} \$',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Delivery Charge',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '10 \$',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Discount',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '20 \$',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 20,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                'Total',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 22,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              ),
                              Text(
                                '${sumPrice + 30} \$',
                                style: TextStyle(
                                    fontFamily: 'BentonSans Bold',
                                    fontSize: 29,
                                    fontWeight: FontWeight.w600,
                                    color: Colors.white),
                              )
                            ],
                          ),
                          Container(
                              height: 50,
                              width: MediaQuery.of(context).size.width * 0.9,
                              decoration: BoxDecoration(
                                color: const Color(0xffffffff),
                                border: Border.all(
                                  color: const Color(0xffffffff),
                                ),
                                borderRadius: BorderRadius.circular(12),
                              ),
                              child: Center(
                                child: Text(
                                  'Place My Order',
                                  style: TextStyle(
                                      fontFamily: 'BentonSans Bold',
                                      fontWeight: FontWeight.bold,
                                      fontSize: 20,
                                      color: Colors.greenAccent),
                                ),
                              ))
                        ],
                      ),
                    ),
                  ),
                ],
              )),
            ),
          );
  }
}
