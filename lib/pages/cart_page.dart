import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../models/cart_model.dart';

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  @override
  Widget build(BuildContext context) {
    final cart = context.watch<CartModel>();

    return Scaffold(
      bottomNavigationBar: Consumer<CartModel>(
  builder: (context, cart, _) {

    return Container(
      padding: const EdgeInsets.all(16),

      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            blurRadius: 10,
            color: Colors.black12,
          ),
        ],
      ),

      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [

          // TOTAL
          Row(
            mainAxisAlignment:
                MainAxisAlignment.spaceBetween,
            children: [

              const Text(
                "Total",
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),

              Text(
                "Rp ${cart.totalPrice}",
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // TOMBOL BELI
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(

              onPressed: () {

                if (cart.totalItems == 0) return;

                ScaffoldMessenger.of(context)
                    .showSnackBar(
                  const SnackBar(
                    content:
                        Text("Pesanan berhasil dibeli 😄"),
                  ),
                );

                cart.clear(); // kosongkan cart
              },

              child: const Text(
                "Beli Sekarang",
              ),
            ),
          ),
        ],
      ),
    );
  },
),
      appBar: AppBar(
        title: const Text("Your Cart"),
        actions: [
          IconButton(
            icon: const Icon(Icons.delete_forever),
            onPressed: cart.clear,
          )
        ],
      ),
      body: cart.items.isEmpty
          ? const Center(
              child: Column(
                mainAxisAlignment:
                    MainAxisAlignment.center,
                children: [
                  Icon(Icons.shopping_cart,
                      size: 80, color: Colors.grey),
                  SizedBox(height: 12),
                  Text("Cart is empty")
                ],
              ),
            )
          : Column(
              children: [
                Expanded(
                  child: ListView(
                    children:
                        cart.items.values.map((item) {
                      return Card(
                        margin:
                            const EdgeInsets.all(8),
                        child: ListTile(
                          leading:
                              Text(item.product.emoji),
                          title:
                              Text(item.product.name),
                          subtitle: Text(
                              "Rp ${item.total}"),
                          trailing: Row(
                            mainAxisSize:
                                MainAxisSize.min,
                            children: [
                              IconButton(
                                icon: const Icon(
                                    Icons.remove),
                                onPressed: () =>
                                    cart.decrease(
                                        item.product.id),
                              ),
                              Text(
                                  item.quantity
                                      .toString()),
                              IconButton(
                                icon: const Icon(
                                    Icons.add),
                                onPressed: () =>
                                    cart.increase(
                                        item.product.id),
                              ),
                            ],
                          ),
                        ),
                      );
                    }).toList(),
                  ),
                ),
                Padding(
                  padding:
                      const EdgeInsets.all(16),
                  child: Text(
                    "Total: Rp ${cart.totalPrice}",
                    style: const TextStyle(
                        fontSize: 18,
                        fontWeight:
                            FontWeight.bold),
                  ),
                )
              ],
            ),
    );
  }
}