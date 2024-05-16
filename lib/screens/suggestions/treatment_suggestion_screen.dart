import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/screens/suggestions/suggestion_view_model.dart';

class TreatmentScreen extends StatelessWidget {
  const TreatmentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<TreatmentViewModel>(context, listen: false);
    if (viewModel.response.isEmpty && !viewModel.isLoading) {
      viewModel.getResponseGemini();
    }
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,iconTheme: IconThemeData(color: ColorConstant.primary),
        title: Text(
          'Saran Penanganan',
          style: TextStyleConstant.fontStyleHeader1,
        ),
        actions: [
          IconButton(
            icon: const Icon(Icons.refresh),
            onPressed: () {
              viewModel.clearCleanedResponse();
              viewModel.getResponseGemini();
            },
          ),
        ],
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              padding: const EdgeInsets.all(15),
              width: double.infinity,
              decoration: BoxConstant.decoration3,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Segera konsultasikan diri Anda dengan dokter atau spesialis kardiovaskular: ",
                    style: TextStyleConstant.fontStyleHeader3,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Dokter akan melakukan pemeriksaan fisik yang komprehensif, mengevaluasi riwayat kesehatan dengan teliti, dan mungkin melakukan berbagai jenis tes diagnostik seperti elektrokardiogram (EKG), analisis darah secara menyeluruh, atau pencitraan jantung untuk mengetahui kondisi Anda.",
                    style: TextStyleConstant.fontStyle1,
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
            Expanded(
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(15),
                decoration: BoxConstant.decoration3,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Tips untuk Perubahan Gaya Hidup: ",
                      style: TextStyleConstant.fontStyleHeader3,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Consumer<TreatmentViewModel>(
                          builder: (context, viewModel, child) {
                            String cleanedResponse = viewModel.response
                                .replaceAll('* ', '')
                                .replaceAll('**', '')
                                .replaceAll('*', ' ')
                                .replaceAll('  ', '');
                            return Text(
                              cleanedResponse.isEmpty
                                  ? "Memuat saran..."
                                  : cleanedResponse,
                              style: TextStyleConstant.fontStyle1,
                            );
                          },
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
