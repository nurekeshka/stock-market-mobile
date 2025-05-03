import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_mobile/presentation/blocs/events/tabs_event.dart';
import 'package:stock_market_mobile/presentation/blocs/states/tabs_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState(0)) {
    on<TabChange>((event, emit) {
      emit(TabState(event.index));
    });
  }
}
