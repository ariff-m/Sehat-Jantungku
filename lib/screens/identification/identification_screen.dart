import 'package:intl/intl.dart';
import 'package:flutter/material.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/model/identification_model.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/service/identification_service.dart';

class IdentificationPage extends StatelessWidget {
  const IdentificationPage({super.key});

  @override
  Widget build(BuildContext context) {
    final IdentificationService service = IdentificationService();

    return Scaffold(
      appBar: AppBar(
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
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
                  Navigator.pushNamed(
                    context,
                    '/detailPage',
                    arguments: item.id,
                  );
                },
                child: Column(
                  children: [
                    Container(
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
                                  item.result,
                                  style: item.result == 'Pemeriksaan Lanjutan'
                                      ? TextStyleConstant.fontStyle1.copyWith(
                                          color: ColorConstant.positive)
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
                  ],
                ),
              );
            }).toList(),
          );
        },
      ),
    );
  }
}
