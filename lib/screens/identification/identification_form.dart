import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sehatjantungku/constants/color_constant.dart';
import 'package:sehatjantungku/constants/text_style_constant.dart';
import 'package:sehatjantungku/screens/identification/identification_view_model.dart';

class IdentificationFormScreen extends StatelessWidget {
  const IdentificationFormScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        iconTheme: IconThemeData(color: ColorConstant.primary),
        backgroundColor: ColorConstant.secondary,
        centerTitle: true,
        title: Text(
          'Identification Form',
          style: TextStyleConstant.fontStyleHeader1,
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Consumer<IdentificationViewModel>(
          builder: (context, formViewModel, child) {
            return Form(
              key: formViewModel.formKey,
              child: ListView.builder(
                itemCount: formFields.length,
                itemBuilder: (context, index) {
                  return KeepAliveWrapper(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 8.0),
                      child: formFields[index](formViewModel),
                    ),
                  );
                },
              ),
            );
          },
        ),
      ),
    );
  }
}

List<Widget Function(IdentificationViewModel)> formFields = [
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Name',
          hintText: 'Enter a name',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        onChanged: (value) => formViewModel.name = value,
        validator: (value) => value!.isEmpty ? 'Enter a name' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Age',
          hintText: 'Enter an age',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) => formViewModel.age = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter an age' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Sex',
          hintText: 'Enter sex',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) => formViewModel.sex = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter sex' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Chest Pain Type',
          hintText: 'Enter chest pain type',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            formViewModel.chestPainType = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter chest pain type' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Resting BP',
          hintText: 'Enter resting BP',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            formViewModel.restingBp = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter resting BP' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Cholesterol',
          hintText: 'Enter cholesterol',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            formViewModel.cholesterol = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter cholesterol' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Fasting BS',
          hintText: 'Enter fasting BS',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            formViewModel.fastingBs = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter fasting BS' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Resting ECG',
          hintText: 'Enter resting ECG',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            formViewModel.restingEcg = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter resting ECG' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Max HR',
          hintText: 'Enter max HR',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) => formViewModel.maxHr = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter max HR' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Exercise Angina',
          hintText: 'Enter exercise angina',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            formViewModel.exerciseAngina = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter exercise angina' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'Oldpeak',
          hintText: 'Enter oldpeak',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) =>
            formViewModel.oldpeak = double.tryParse(value) ?? 0.0,
        validator: (value) => value!.isEmpty ? 'Enter oldpeak' : null,
      ),
  (formViewModel) => TextFormField(
        decoration: InputDecoration(
          labelText: 'ST Slope',
          hintText: 'Enter ST slope',
          labelStyle: TextStyleConstant.fontStyle1,
          border: const OutlineInputBorder(),
        ),
        style: TextStyleConstant.fontStyle1,
        keyboardType: TextInputType.number,
        onChanged: (value) => formViewModel.stSlope = int.tryParse(value) ?? 0,
        validator: (value) => value!.isEmpty ? 'Enter ST slope' : null,
      ),
  (formViewModel) => ElevatedButton(
        onPressed: () async {
          await formViewModel.submitForm();
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: ColorConstant.secondary,
        ),
        child: Text(
          'Submit',
          style: TextStyleConstant.buttonMaps,
        ),
      ),
];

class KeepAliveWrapper extends StatefulWidget {
  final Widget child;

  const KeepAliveWrapper({super.key, required this.child});

  @override
  KeepAliveWrapperState createState() => KeepAliveWrapperState();
}

class KeepAliveWrapperState extends State<KeepAliveWrapper>
    with AutomaticKeepAliveClientMixin<KeepAliveWrapper> {
  @override
  Widget build(BuildContext context) {
    super.build(context);
    return widget.child;
  }

  @override
  bool get wantKeepAlive => true;
}
