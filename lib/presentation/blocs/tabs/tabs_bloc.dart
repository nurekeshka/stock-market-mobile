import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:stock_market_mobile/presentation/blocs/tabs/tabs_event.dart';
import 'package:stock_market_mobile/presentation/blocs/tabs/tabs_state.dart';

class TabBloc extends Bloc<TabEvent, TabState> {
  TabBloc() : super(TabState(0)) {
    on<TabChanged>((event, emit) {
      emit(TabState(event.index));
    });
  }
}
