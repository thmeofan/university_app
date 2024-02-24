// import 'package:flutter/material.dart';
//
// import '../../../consts/app_colors.dart';
// import '../../../consts/app_text_styles/income_text_style.dart';
// import '../../../consts/app_text_styles/synopsis_text_style.dart';
// import '../../app/widgets/chosen_action_button_widget.dart';
//
// class ConstructorScreen extends StatefulWidget {
//   @override
//   _ConstructorScreenState createState() => _ConstructorScreenState();
// }
//
// class _ConstructorScreenState extends State<ConstructorScreen> {
//   final _descriptionController = TextEditingController();
//   final _amountController = TextEditingController();
//
//   void _saveOperation() {
//     final description = _descriptionController.text;
//     final amount = double.tryParse(_amountController.text);
//
//     if (description.isEmpty || amount == null) {
//       return;
//     }
//
//     final operation = {
//       'description': description,
//       'amount': amount,
//     };
//
//     Navigator.of(context).pop(operation);
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     final screenSize = MediaQuery.of(context).size;
//     return Scaffold(
//       appBar: AppBar(
//         title: const Text(
//           'Back',
//           style: SynopsisTextStyle.appbar,
//         ),
//       ),
//       body: Column(
//         children: <Widget>[
//           Padding(
//             padding: const EdgeInsets.all(16.0),
//             child:
//                 Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
//               SizedBox(
//                 height: screenSize.height * 0.02,
//               ),
//               const Text(
//                 'Income description',
//                 style: OperationTextStyle.description,
//               ),
//               SizedBox(
//                 height: screenSize.height * 0.01,
//               ),
//               TextField(
//                 controller: _descriptionController,
//                 decoration: InputDecoration(
//                   labelText: 'Example (Salary)',
//                   labelStyle: OperationTextStyle.hint,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: screenSize.height * 0.02,
//               ),
//               const Text(
//                 'Income amount',
//                 style: OperationTextStyle.description,
//               ),
//               SizedBox(
//                 height: screenSize.height * 0.01,
//               ),
//               TextField(
//                 controller: _amountController,
//                 decoration: InputDecoration(
//                   labelText: '\$',
//                   labelStyle: OperationTextStyle.hint,
//                   border: OutlineInputBorder(
//                     borderRadius: BorderRadius.circular(10.0),
//                   ),
//                 ),
//                 keyboardType: TextInputType.numberWithOptions(decimal: true),
//               ),
//               ChosenActionButton(
//                 text: 'Add income',
//                 onTap: _saveOperation,
//               )
//             ]),
//           )
//         ],
//       ),
//     );
//   }
// }
