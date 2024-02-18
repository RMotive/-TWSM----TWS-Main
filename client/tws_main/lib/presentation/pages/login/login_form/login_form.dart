part of '../login_page.dart';

class _LoginForm extends StatelessWidget {
  const _LoginForm();

  @override
  Widget build(BuildContext context) {
    final _LoginFormState state = _LoginFormState();

    return ListenableBuilder(
        listenable: state,
        builder: (BuildContext ctx, Widget? widget) {
          return Form(
            key: state.formKey,
            child: CosmosSeparatedColumn(
              crossAxisAlignment: CrossAxisAlignment.center,
              spacing: 24,
              children: <Widget>[
                Visibility(
                  visible: state.failureDisplay.isNotEmpty,
                  child: TWSDisplayFlat(
                    width: state.maxControlsWidth - 32,
                    maxHeight: 100,
                    display: state.failureDisplay,
                  ),
                ),
                TWSInputText(
                  label: 'Identity',
                  hint: 'Your solution identity 🧑‍⚕️',
                  focusNode: state.identityControl.focusController,
                  errorText: state.identityFailure,
                  width: state.maxControlsWidth,
                  isEnabled: !state.isRequesting,
                  controller: state.identityControl.textController,
                  validator: state.validateIdentityInput,
                ),
                TWSInputText(
                  label: 'Password',
                  hint: 'Your secret word 🔐',
                  isPrivate: true,
                  errorText: state.passwordFailure,
                  width: state.maxControlsWidth,
                  isEnabled: !state.isRequesting,
                  focusNode: state.passwordControl.focusController,
                  controller: state.passwordControl.textController,
                  validator: state.validatePasswordInput,
                ),
                TWSButtonFlat(
                  width: state.maxControlsWidth,
                  showLoading: state.isRequesting,
                  onTap: state.initSession,
                ),
              ],
            ),
          );
        });
  }
}
