import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/constants/box_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/screens/suggestions/suggestion_view_model.dart';

class PreventionPage extends StatelessWidget {
  const PreventionPage({super.key});

  @override
  Widget build(BuildContext context) {
    final viewModel = Provider.of<PreventionViewModel>(context, listen: false);
    if (viewModel.response.isEmpty && !viewModel.isLoading) {
      viewModel.getResponseGemini();
    }

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blue,
        centerTitle: true,
        title: Text(
          'Saran Pencegahan',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Container(
          decoration: BoxConstant.decoration3,
          child: Padding(
            padding: const EdgeInsets.all(15),
            child: ConstrainedBox(
              constraints: const BoxConstraints(minHeight: 150),
              child: IntrinsicHeight(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "Berikut ini merupakan saran pencegahan penyakit jantung atau kardiovaskular:",
                      style: TextStyleConstant.fontStyleHeader3,
                    ),
                    const SizedBox(height: 10),
                    Expanded(
                      child: SingleChildScrollView(
                        child: Consumer<PreventionViewModel>(
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
          ),
        ),
      ),
    );
  }
}
