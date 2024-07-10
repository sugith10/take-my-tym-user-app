part of 'app_route_packages.dart';

class AppRoute {
  AppRoute._();
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

      // Create post page
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

      // Location select page
      case RouteName.location:
        final LocationBloc locationBloc = settings.arguments as LocationBloc;
        return bottomToTop(SelectLocationPage(locationBloc: locationBloc));

      case RouteName.accountInfo:
        return rightToLeft(const AccountInfoPage());

      case RouteName.editProfile:
        return rightToLeft(const EditProfilePage());

      case RouteName.payment:
        final PaymentPageArguments arg =
            settings.arguments as PaymentPageArguments;
        return bottomToTop(PaymentPage(
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

      case RouteName.viewPost:
        final PostModel postModel = settings.arguments as PostModel;
        return rightToLeft(ViewPostPage(postModel: postModel));

      case RouteName.search:
        return bottomToTop(const SearchPage());

      case RouteName.viewContract:
        final ContractModel contractModel = settings.arguments as ContractModel;
        return leftToRight(ViewContractPage(contractModel: contractModel));

      case RouteName.coustomerService:
        return leftToRight(const CustomerServicePage());

      case RouteName.submitProposal:
        final PostModel postModel = settings.arguments as PostModel;
        return bottomToTop(SubmitProposelPage(postModel: postModel));

      case RouteName.message:
        final IndividualChatPageArguments arg =
            settings.arguments as IndividualChatPageArguments;
        return rightToLeft(IndividualChatPage(
          currentUid: arg.currentUid,
          receiverUid: arg.receiverUid,
          receiverName: arg.receiverName,
          individualMessageBloc: arg.individualMessageBloc,
        ));
    }

    return noMovement(const SplashPage());
  }
}
