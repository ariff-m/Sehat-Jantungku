import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/foundation.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/widgets/bottom_navigator_widget.dart';
import 'package:sehatjantungku/screens/identification/identification_view_model.dart';

class IdentificationScreen extends StatelessWidget {
  const IdentificationScreen({super.key});

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;

    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.primary),
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
        automaticallyImplyLeading: false,
        title: Text(
          'Identification',
          style: TextStyleConstant.fontStyleHeader1,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              Provider.of<IdentificationViewModel>(context, listen: false)
                  .fetchIdentificationModel();
            },
          ),
        ],
      ),
      body: Consumer<IdentificationViewModel>(
        builder: (context, viewModel, child) {
          if (viewModel.identificationModel == null) {
            viewModel.fetchIdentificationModel();
            return const Center(child: CircularProgressIndicator());
          }

          final data = viewModel.identificationModel!.data;

          if (data.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          return ListView(
            padding: const EdgeInsets.all(20.0),
            children: data.map((item) {
              final formattedDate = DateFormat('dd-MM-yyyy').format(item.date);
              final timeParts = item.time.split(':');
              final formattedTime = '${timeParts[0]}:${timeParts[1]}';

              return GestureDetector(
                onTap: () {
                  if (kDebugMode) {
                    print('Selected item: ${item.name}');
                  }
                  Provider.of<IdentificationViewModel>(context, listen: false)
                      .selectIdentification = item;

                  Navigator.pushNamed(context, '/detailsScreen').then((_) {
                    viewModel.fetchIdentificationModel();
                  });
                },
                child: Container(
                  height: 90,
                  decoration: BoxConstant.decoration3WithThinBorder,
                  margin: const EdgeInsets.symmetric(vertical: 10),
                  child: Column(
                    children: [
                      const SizedBox(
                        height: 5,
                      ),
                      ListTile(
                        title: Text(item.name,
                            style: TextStyleConstant.fontStyleHeader4),
                        subtitle: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              item.result ?? '',
                              style: item.result == 'Pemeriksaan Lanjutan'
                                  ? TextStyleConstant.fontStyle1
                                      .copyWith(color: ColorConstant.positive)
                                  : TextStyleConstant.fontStyle1,
                            ),
                            Row(
                              children: [
                                Text(
                                  formattedDate,
                                  style: TextStyleConstant.fontStyle1,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  formattedTime,
                                  style: TextStyleConstant.fontStyle1,
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }).toList(),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.pushNamed(context, '/identificationFormScreen').then((_) {
            Provider.of<IdentificationViewModel>(context, listen: false)
                .fetchIdentificationModel();
          });
        },
        backgroundColor: ColorConstant.secondary,
        child: Icon(
          CupertinoIcons.add,
          color: ColorConstant.primary,
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homeScreen');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/identificationScreen');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/mapsScreen');
          }
        },
      ),
    );
  }
}
