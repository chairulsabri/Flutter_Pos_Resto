import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_posresto_1/core/extensions/int_ext.dart';

import '../../../../components/components.dart';
import '../../../core/constants/colors.dart';
import '../bloc/bloc/checkout_bloc.dart';
import '../models/order_item.dart';
import '../models/product_model.dart';

class OrderMenu extends StatelessWidget {
  final OrderItem data;
  const OrderMenu({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    // final qtyController = TextEditingController(text: '3');

    return Column(
      children: [
        Row(
          children: [
            Flexible(
              child: ListTile(
                contentPadding: EdgeInsets.zero,
                leading: ClipRRect(
                  borderRadius: const BorderRadius.all(Radius.circular(50.0)),
                  child: Image.asset(
                    data.product.image,
                    width: 40.0,
                    height: 40.0,
                    fit: BoxFit.cover,
                  ),
                ),
                title: Text(data.product.name,
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                    )),
                subtitle: Text(data.product.priceFormat),
              ),
            ),
            // SizedBox(
            //   width: 50.0,
            //   child: TextFormField(
            //     controller: qtyController,
            //     keyboardType: TextInputType.number,
            //     textAlign: TextAlign.center,
            //     decoration: InputDecoration(
            //       border: OutlineInputBorder(
            //         borderRadius: BorderRadius.circular(8.0),
            //       ),
            //     ),
            //   ),
            // ),
            Row(
              children: [
                GestureDetector(
                  onTap: () {
                    // if (data.quantity > 1) {
                    context
                        .read<CheckoutBloc>()
                        .add(CheckoutEvent.removeProduct(data.product));
                    //       onDeleteTap();
                    //   // data.quantity--;
                    //   // setState(() {});
                    // }
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    color: AppColors.white,
                    child: const Icon(
                      Icons.remove_circle,
                      color: AppColors.primary,
                    ),
                  ),
                ),
                SizedBox(
                  width: 30.0,
                  child: Center(
                      child: Text(
                    data.quantity.toString(),
                  )),
                ),
                GestureDetector(
                  onTap: () {
                    context
                        .read<CheckoutBloc>()
                        .add(CheckoutEvent.addProduct(data.product));
                    //     onDeleteTap();
                    // data.quantity++;
                    // setState(() {});
                  },
                  child: Container(
                    width: 30,
                    height: 30,
                    color: AppColors.white,
                    child: const Icon(
                      Icons.add_circle,
                      color: AppColors.primary,
                    ),
                  ),
                ),
              ],
            ),
            const SpaceWidth(8),
            SizedBox(
              width: 80.0,
              child: Text(
                (data.product.price * data.quantity).currencyFormatRp,
                textAlign: TextAlign.right,
                style: const TextStyle(
                  color: AppColors.primary,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
          ],
        ),
        const SpaceHeight(16),
        // Row(
        //   children: [
        //     Flexible(
        //       child: TextFormField(
        //         controller: noteController,
        //         decoration: InputDecoration(
        //           border: OutlineInputBorder(
        //             borderRadius: BorderRadius.circular(8.0),
        //           ),
        //           hintText: 'Catatan pesanan',
        //         ),
        //       ),
        //     ),
        //     const SpaceWidth(12),
        //     GestureDetector(
        //       onTap: () {},
        //       child: Container(
        //         padding: const EdgeInsets.all(16.0),
        //         height: 60.0,
        //         width: 60.0,
        //         decoration: const BoxDecoration(
        //           color: AppColors.primary,
        //           borderRadius: BorderRadius.all(Radius.circular(8.0)),
        //         ),
        //         child: Assets.icons.delete.svg(
        //           colorFilter:
        //               const ColorFilter.mode(AppColors.white, BlendMode.srcIn),
        //         ),
        //       ),
        //     ),
        //   ],
        // ),
      ],
    );
  }
}
