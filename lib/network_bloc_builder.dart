library network_bloc_builder;

import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'base_network_state.dart';

class NetworkBlocBuilder<B extends Bloc<dynamic, S>, S extends BaseNetworkState>
    extends BlocBuilderBase<B, S> {
  /// The [builder] function which will be invoked on each widget build.
  /// The [builder] takes the `BuildContext` and current [state] and
  /// must return a widget.
  /// This is analogous to the [builder] function in [StreamBuilder].
  final BlocWidgetBuilder<S> builder;

  /// The loading indicator will be shown when isFetching.
  /// Defaults to a CircularProgressIndicator for Material App and
  /// CupertinoActivityIndicator for Cupertino App.
  final Widget loadingIndicator;

  /// {@macro blocbuilder}
  const NetworkBlocBuilder({
    Key key,
    @required this.builder,
    this.loadingIndicator,
    B bloc,
    BlocBuilderCondition<S> condition,
  })  : assert(builder != null),
        super(key: key, bloc: bloc, condition: condition);

  @override
  Widget build(BuildContext context, S state) {
    if (state.isFetching) {
      return this.loadingIndicator ??
          Center(
            child: Platform.isAndroid
                ? CircularProgressIndicator()
                : CupertinoActivityIndicator(),
          );
    }
    return builder(context, state);
  }
}
