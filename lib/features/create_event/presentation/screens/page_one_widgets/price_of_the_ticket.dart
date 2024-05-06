import 'package:eventak/core/utils/app_styles.dart';
import 'package:eventak/core/widgets/custom_text_field.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_cubit.dart';
import 'package:eventak/features/create_event/presentation/cubit/create_event_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class PriceOfTheTicket extends StatelessWidget {
  const PriceOfTheTicket({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<CreateEventCubit, CreateEventState>(
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
                            controller: context.read<CreateEventCubit>().priceInAdvanceOfEventController),
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
                            controller: context.read<CreateEventCubit>().priceAtTheDoorOfEventController),
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
              width: 150,
              height: 50,
              child: CustomTextFormField(
                  readOnly: true,
                  hint: 'Total Price:10',
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
