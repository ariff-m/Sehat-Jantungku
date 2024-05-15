import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';

import 'package:sehatjantungku/screens/identification/identification_view_model.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
        iconTheme: IconThemeData(color: ColorConstant.primary),
        title: Text(
          'Identification Detail',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Consumer<IdentificationViewModel>(
          builder: (context, identificationViewModel, child) {
            final selectedIdentification =
                identificationViewModel.selectedIdentification;

            if (selectedIdentification == null) {
              return const Center(
                child: Text('No identification selected'),
              );
            }

            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('Name: ${selectedIdentification.name}'),
                Text('Result: ${selectedIdentification.result}'),
                Text(
                  'Date: ${DateFormat('dd-MM-yyyy').format(selectedIdentification.date)}',
                ),
                Text('Time: ${selectedIdentification.time}'),
                const SizedBox(height: 20),
              ],
            );
          },
        ),
      ),
    );
  }
}
