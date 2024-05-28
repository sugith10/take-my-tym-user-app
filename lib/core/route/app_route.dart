part of 'app_route_packages.dart';

class AppRoute {
  static Route<dynamic> generateRoute(RouteSettings settings) {
    switch (settings.name) {
      case RouteName.initial:
        return noMovement(const SplashPage());
      case RouteName.welcome:
        return noMovement(const WelcomePage());
      case RouteName.signIn:
        return noMovement(const SignInPage());
      case RouteName.signUp:
        return noMovement(const SignInPage());
      case RouteName.forgotPassword:
        return noMovement(const ForgetPasswordPage());
      case RouteName.profileSetup:
        final UserModel userModel = settings.arguments as UserModel;
        return noMovement(ProfileSetupPage(userModel: userModel));
      case RouteName.home:
        return noMovement(const HomeNavigationMenu());
      case RouteName.createPostFirst:
        final PostModel? postModel = settings.arguments as PostModel?;
        return bottomToTop(CreatePostFirstPage(postModel: postModel));
      case RouteName.createPostSecond:
        final CreatePostSecondPageArguments arg =
            settings.arguments as CreatePostSecondPageArguments;
        return rightToLeft(
          CreatePostSecondPage(
              postModel: arg.postModel, bloc: arg.createPostBloc),
        );
      case RouteName.location:
        final LocationBloc locationBloc = settings.arguments as LocationBloc;
        return bottomToTop(SelectLocationPage(locationBloc: locationBloc));
      case RouteName.accountInfo:
        return rightToLeft(const AccountInfoPage());
      case RouteName.editProfile:
        return leftToRight(const EditProfilePage());
      case RouteName.payment:
        final PaymentPageArguments arg =
            settings.arguments as PaymentPageArguments;
        return leftToRight(PaymentPage(
            type: arg.type, amount: arg.amount, walletModel: arg.walletModel));
      case RouteName.success:
        final SuccessPageArguments arg =
            settings.arguments as SuccessPageArguments;
        return noMovement(SuccessPage(
            pop: arg.pop, subtitle: arg.subtitle, title: arg.title));
      case RouteName.transactions:
        final List<TransactionModel> transactions =
            settings.arguments as List<TransactionModel>;
        return leftToRight(TransactionsPage(transactios: transactions));
    }

    return noMovement(const ErrorPage());
  }
}
