import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_cubit.dart';
import 'package:eventak/features/my_events/presentation/edit_event_cubit/edit_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class EditPriceOfTheTicket extends StatefulWidget {
  const EditPriceOfTheTicket({
    super.key,
  });

  @override
  State<EditPriceOfTheTicket> createState() => _PriceOfTheTicketState();
}

class _PriceOfTheTicketState extends State<EditPriceOfTheTicket> {
  int totalPrice = 0;

  @override
  void initState() {
    super.initState();
    // Calculate total price initially
    calculateTotalPrice();
  }

  void calculateTotalPrice() {
    final editEventCubit = context.read<EditEventCubit>();
    final priceInAdvance = int.tryParse(editEventCubit.editPriceInAdvanceController.text) ?? 0;
    final priceAtTheDoor = int.tryParse(editEventCubit.editPriceAtTheDoorController.text) ?? 0;
    setState(() {
      totalPrice = priceInAdvance + priceAtTheDoor;
    });
  }
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<EditEventCubit, EditEventState>(
      builder: (context, state) {
        return Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'PRICE OF THE TICKET',
              style: AppStyles.styleSemiBold14(context),
            ),
            const SizedBox(
              height: 4,
            ),
            Row(
              children: [
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                            hint: '5',
                            prefixIcon: const Icon(Icons.attach_money_outlined),
                            controller: context.read<EditEventCubit>().editPriceInAdvanceController,
                            onChanged: (_) => calculateTotalPrice()
                            ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('Price In Advance',
                            style: AppStyles.styleMedium10(context)
                                .copyWith(color: const Color(0xFF8591A0)))
                      ]),
                ),
                const SizedBox(
                  width: 16,
                ),
                Expanded(
                  child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        CustomTextFormField(
                            hint: '5',
                            prefixIcon: const Icon(Icons.attach_money_outlined),
                            controller: context.read<EditEventCubit>().editPriceAtTheDoorController,
                            onChanged: (_) => calculateTotalPrice()
                            ),
                        const SizedBox(
                          height: 4,
                        ),
                        Text('Price In The Door',
                            style: AppStyles.styleMedium10(context)
                                .copyWith(color: const Color(0xFF8591A0))),
                      ]),
                ),
              ],
            ),
            const SizedBox(
              height: 4,
            ),
            SizedBox(
              width: 170,
              height: 50,
              child: CustomTextFormField(
                
                  readOnly: true,
                  
                  hint:'Total Price:$totalPrice',
                  controller: TextEditingController()),
            ),
            const SizedBox(
              height: 4,
            ),
            Text(
              'Total price The User Has To Pay For Attendig The Event.',
              style: AppStyles.styleMedium10(context)
                  .copyWith(color: const Color(0xFF8591A0)),
            )
          ],
        );
      },
    );
  }
}
