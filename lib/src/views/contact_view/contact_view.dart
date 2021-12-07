import 'package:flutter/material.dart';
import 'package:flutter_styled_toast/flutter_styled_toast.dart';

import '../../widgets/custom_elevated_button.dart';
import '../../widgets/custom_text_form_field.dart';
import '../../widgets/page_blueprint.dart';

class ContactPage extends StatefulWidget {
  const ContactPage({Key? key}) : super(key: key);

  @override
  _ContactPageState createState() => _ContactPageState();
}

class _ContactPageState extends State<ContactPage> {
  int _currentStep = 0;
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _textController = TextEditingController();

  _incrementStep() {
    if (_currentStep < 2) {
      if (_nameController.text.isNotEmpty &&
          _emailController.text.isNotEmpty &&
          _textController.text.isNotEmpty) {
        setState(() {
          _currentStep++;
        });
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return PageBlueprint(
      child: Center(
        child: Stepper(
          elevation: 9,
          onStepCancel: _incrementStep,
          onStepContinue: _incrementStep,
          steps: <Step>[
            Step(
              title: const Text('Name'),
              content: CustomTextFormField(
                controller: _nameController,
                hintText: 'Enter your name',
                labelText: 'Name',
                onFieldSubmitted: _incrementStep(),
                onEditingComplete: _incrementStep,
              ),
            ),
            Step(
              title: const Text('Email'),
              content: CustomTextFormField(
                controller: _emailController,
                hintText: 'Enter your email',
                labelText: 'Email',
                onFieldSubmitted: _incrementStep(),
                onEditingComplete: _incrementStep,
              ),
            ),
            Step(
              title: const Text('Text'),
              content: CustomTextFormField(
                width: MediaQuery.of(context).size.width * 0.8,
                controller: _textController,
                hintText: 'Enter your message',
                labelText: 'Text',
                onFieldSubmitted: (value) => _showDialog(context),
                onEditingComplete: () => _showDialog(context),
              ),
            ),
          ],
          currentStep: _currentStep,
          controlsBuilder: (
            BuildContext context, {
            VoidCallback? onStepContinue,
            VoidCallback? onStepCancel,
          }) {
            return Row(
              children: <Widget>[
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: CustomElevatedButton(
                    onPressed: onStepCancel,
                    label: 'Cancel',
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: CustomElevatedButton(
                    onPressed: onStepContinue,
                    label: _currentStep != 2 ? 'Continue' : 'Submit',
                  ),
                ),
              ],
            );
          },
        ),
      ),
    );
  }

  _showDialog(BuildContext context) {
    return showGeneralDialog(
      context: context,
      pageBuilder: (context, animation, secondaryAnimation) => Center(
        child: AlertDialog(
          title: const Text('Thank you!'),
          content: const Text(
            'Your message has been sent. We will get back to you as soon as possible.',
          ),
          actions: <Widget>[
            CustomElevatedButton(
              label: 'OK',
              onPressed: () => Navigator.of(context).pop(),
            ),
          ],
        ),
      ),
    );
  }
}
