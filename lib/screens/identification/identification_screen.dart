import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:flutter/foundation.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/model/identification_model.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/service/identification_service.dart';
import 'package:sehatjantungku/widgets/bottom_navigator_widget.dart';
import 'package:sehatjantungku/screens/identification/identification_view_model.dart';

class IdentificationPage extends StatelessWidget {
  const IdentificationPage({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    int currentIndex = 1;
    final IdentificationService service = IdentificationService();
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
      ),
      body: FutureBuilder<IdentificationModel>(
        future: service.fetchIdentificationModel(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data!.data.isEmpty) {
            return const Center(child: Text('No data available'));
          }

          final data = snapshot.data!.data;

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

                  Navigator.pushNamed(context, '/detailsPage');
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
          Navigator.pushNamed(context, '/identificationFormPage');
        },
        backgroundColor: ColorConstant.secondary,
        child: Icon(Icons.add,color: ColorConstant.primary,),
      ),
      bottomNavigationBar: MyBottomNavigationBar(
        currentIndex: currentIndex,
        onTap: (index) {
          if (index == 0) {
            Navigator.pushNamed(context, '/homePage');
          } else if (index == 1) {
            Navigator.pushNamed(context, '/identificationPage');
          } else if (index == 2) {
            Navigator.pushNamed(context, '/mapsPage');
          }
        },
      ),
    );
  }
}
