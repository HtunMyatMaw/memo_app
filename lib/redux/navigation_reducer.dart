import 'package:choose_app/redux/navigation_action.dart';
import 'package:redux/redux.dart';

final navigationReducer = combineReducers<List<String>>([
  TypedReducer<List<String>, NavigateReplaceAction>(_navigateReplace),
  TypedReducer<List<String>, NavigatePushAction>(_navigatePush),
  TypedReducer<List<String>, NavigatePopAction>(_navigatePop),
]);

/// Navigate Replace
List<String> _navigateReplace(
        List<String> routes, NavigateReplaceAction action) =>
    [action.routeName];

/// Navigate Push
List<String> _navigatePush(List<String> routes, NavigatePushAction action) {
  var result = List<String>.from(routes);
  result.add(action.routeName);
  return result;
}

/// Navigate Pop
List<String> _navigatePop(List<String> routes, NavigatePopAction action) {
  var result = List<String>.from(routes);
  result.removeLast();
  return result;
}
