import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:gas_receipt/features/receipt/bloc/receipt_bloc.dart';
import 'package:gas_receipt/features/receipt/model/receipt_model.dart';
import 'package:gas_receipt/routes/bloc/receipt_routes_bloc.dart';

class CreateReceiptPage extends StatelessWidget {
  CreateReceiptPage({
    Key? key,
    GlobalKey<FormBuilderState>? formKey,
  })  : _formKey = formKey ?? GlobalKey<FormBuilderState>(),
        super(key: key);

  final GlobalKey<FormBuilderState> _formKey;
  final GasReceipt _receipt = GasReceipt();

  static Page page() => MaterialPage<void>(child: CreateReceiptPage());

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 32),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    context.read<ReceiptRoutesBloc>().add(
                          const RoutesChanged(
                              status: ReceiptRoutesStatus.overview),
                        );
                  },
                  icon: const Icon(Icons.arrow_back),
                ),
                Text(
                  'Create Receipt',
                  style: Theme.of(context).textTheme.headline5,
                ),
              ],
            ),
            FormBuilder(
              key: _formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  FormBuilderDateTimePicker(
                    name: 'gasDate',
                    decoration: const InputDecoration(
                      labelText: 'Date',
                    ),
                    timePickerInitialEntryMode: TimePickerEntryMode.input,
                    inputType: InputType.date,
                    onChanged: (value) => _receipt.gasDate = value.toString(),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'volume',
                    decoration: const InputDecoration(
                      labelText: 'Volume',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (value) =>
                        _receipt.volume = double.parse(value!),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'gasPrice',
                    decoration: const InputDecoration(
                      labelText: 'Gas Price',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (value) =>
                        _receipt.gasPrice = double.parse(value!),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'total',
                    decoration: const InputDecoration(
                      labelText: 'Total',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (value) => _receipt.total = double.parse(value!),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'btw',
                    decoration: const InputDecoration(
                      labelText: 'Btw',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (value) => _receipt.btw = double.parse(value!),
                  ),
                  const SizedBox(height: 16),
                  FormBuilderTextField(
                    name: 'netto',
                    decoration: const InputDecoration(
                      labelText: 'Netto',
                    ),
                    validator: FormBuilderValidators.compose([
                      FormBuilderValidators.required(),
                    ]),
                    onChanged: (value) => _receipt.netto = double.parse(value!),
                  ),
                  const SizedBox(height: 16),
                  ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.saveAndValidate()) {
                        context
                            .read<ReceiptBloc>()
                            .add(CreateReceipt(_receipt));
                      }
                    },
                    child: const Text('Save'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
