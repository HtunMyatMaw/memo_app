class NavigateReplaceAction {
  final String routeName;

  NavigateReplaceAction(this.routeName);
}

class NavigatePushAction {
  final String routeName;
  final Object argument;
  NavigatePushAction(this.routeName, {this.argument});
}

class NavigatePopAction {
  final Object returnData;
  NavigatePopAction({this.returnData});
}
