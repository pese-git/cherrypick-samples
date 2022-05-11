import 'package:cherrypick/cherrypick.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:form_builder_validators/form_builder_validators.dart';
import 'package:sample_app/bloc/user_bloc.dart';
import 'package:sample_app/bloc/user_bloc_event.dart';
import 'package:sample_app/bloc/user_bloc_state.dart';
import 'package:sample_app/di/scopes.dart';
import 'package:sample_app/user.dart';

class UserPage extends StatelessWidget {
  UserPage({Key? key, required this.title}) : super(key: key);

  final String title;

  final _formKey = GlobalKey<FormBuilderState>();

  @override
  Widget build(BuildContext context) {
    return BlocProvider<UserBloc>(
      create: (context) {
        return CherryPick.openScope(scopeName: Scopes.APP_SCOPE)
            .resolve<UserBloc>();
      },
      child: BlocBuilder<UserBloc, UserBlocState>(
        builder: ((context, state) {
          return Scaffold(
            appBar: AppBar(
              title: const Text('Sample App'),
            ),
            body: Column(
              children: [
                Text(state.user.toString()),
                const SizedBox(width: 20),
                FormBuilder(
                  key: _formKey,
                  child: Column(
                    children: [
                      FormBuilderTextField(
                        name: 'name',
                        decoration: const InputDecoration(labelText: 'Name'),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required<String>(),
                        ]),
                      ),
                      FormBuilderTextField(
                        name: 'email',
                        decoration: const InputDecoration(labelText: 'Email'),
                        keyboardType: TextInputType.text,
                        validator: FormBuilderValidators.compose([
                          FormBuilderValidators.required<String>(),
                        ]),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 20),
                MaterialButton(
                  color: Theme.of(context).colorScheme.secondary,
                  child: const Text(
                    "Save",
                    style: TextStyle(color: Colors.white),
                  ),
                  onPressed: () {
                    _formKey.currentState?.saveAndValidate();
                    BlocProvider.of<UserBloc>(context).add(
                      UserBlocEvent.saveUser(
                        User(
                          name: _formKey.currentState?.fields['name']?.value ??
                              '',
                          email:
                              _formKey.currentState?.fields['email']?.value ??
                                  '',
                        ),
                      ),
                    );
                  },
                ),
              ],
            ),
          );
        }),
      ),
    );
  }
}
