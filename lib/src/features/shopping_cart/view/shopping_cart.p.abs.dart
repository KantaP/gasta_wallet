import 'package:flutter/material.dart';
import 'package:gastawallet/src/features/shopping_cart/model/product.m.dart';


abstract class IShoppingCartPage {
  Widget buildProductItem(Product item);
}