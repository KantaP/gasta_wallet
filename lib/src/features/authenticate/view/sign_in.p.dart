import 'package:flutter/material.dart';
import 'package:gastawallet/generated/l10n.dart';
import 'package:gastawallet/src/features/authenticate/view/di/sign_in.vm.dart';
import 'package:gastawallet/src/view_model/view.abs.dart';


class SignInPage extends View<SignInPageViewModel> {
  SignInPage({required SignInPageViewModel viewModel, Key? key})
      : super.model(viewModel, key: key);

  @override
  _SignInPageState createState() => _SignInPageState(viewModel);
}

class _SignInPageState extends ViewState<SignInPage, SignInPageViewModel> {
  _SignInPageState(SignInPageViewModel viewModel) : super(viewModel);

  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  @override
  void initState() {
    super.initState();
    listenToRoutesSpecs(viewModel.routes);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 32.0),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: kToolbarHeight),
                  child: Center(
                    child: Text(
                      S.of(context).signInHeadline,
                      style: Theme.of(context).textTheme.headlineMedium,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.only(top: 16),
                  child: Center(
                    child: Text(
                      S.of(context).signInContent,
                      style: Theme.of(context).textTheme.headlineSmall,
                      textAlign: TextAlign.center,
                    ),
                  ),
                ),
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 32.0),
                        child: ElevatedButton(
                          onPressed: () => viewModel.goToCreateAccount(),
                          child: Text(
                            S.of(context).signInCreateAccountButton
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 52.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              S.of(context).signInAlreadyAccountContent, 
                            ),
                            const SizedBox(width: 8,),
                            GestureDetector(
                              onTap: () => viewModel.goToPhoneAuth(),
                              child: Text(
                                S.of(context).signInAlreadyAccountAction
                              ),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
