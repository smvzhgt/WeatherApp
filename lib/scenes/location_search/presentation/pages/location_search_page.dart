import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../../core/constants.dart';
import '../../../../core/pages/empty_page.dart';
import '../../../../core/pages/error_page.dart';
import '../../../../core/pages/information_page.dart';
import '../../../../core/pages/loading_page.dart';
import '../../../../core/state.dart';
import '../../../../core/widgets/background.dart';
import '../../../../generated/l10n.dart';
import '../../domain/entities/location_search_entity.dart';
import '../riverpod/provider/location_search_providers.dart';
import '../riverpod/state/location_search_state.dart';
import '../widgets/location_search_row_item.dart';

class LocationSearchPage extends StatefulWidget {
  static const routeName = "locationSearch";

  const LocationSearchPage({
    Key? key,
  }) : super(key: key);

  @override
  _LocationSearchPageState createState() => _LocationSearchPageState();
}

class _LocationSearchPageState extends State<LocationSearchPage> {
  late final TextEditingController controller = TextEditingController();
  String _query = "";

  @override
  void initState() {
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onTapDismissTextFieldFocus,
      child: Scaffold(
        appBar: AppBar(
          title: Text(S.of(context).page_title_location_search),
        ),
        body: Stack(
          children: [
            const Background(),
            Column(
              children: [
                _buildTextField(),
                const SizedBox(height: kSizedBoxHeightSmall),
                Expanded(
                  child: Center(
                    child: Consumer(
                      builder: (context, watch, child) {
                        final state = watch(lsNotifierProvider);
                        return _buildState(state);
                      },
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }

  void _onTapDismissTextFieldFocus() {
    FocusScopeNode currentFocus = FocusScope.of(context);
    if (!currentFocus.hasPrimaryFocus) {
      currentFocus.unfocus();
    }
  }

  void _onPressedButton(String value) {
    controller.clear();
    context.read(lsNotifierProvider.notifier).fetchEarthID(query: _query);
  }

  void _onChangedValue(String value) {
    _query = value;
  }

  void _onSubmitted(String value) {
    _onPressedButton(value);
  }

  Widget _buildTextField() {
    return Container(
      margin: const EdgeInsets.all(kAppWidgetPadding),
      child: TextField(
        style: TextStyle(color: Theme.of(context).focusColor),
        controller: controller,
        decoration: InputDecoration(
          hintText: S.of(context).hint_text_input_location_search,
          prefixIcon: const Icon(Icons.search),
        ),
        onChanged: _onChangedValue,
        onSubmitted: _onSubmitted,
        textInputAction: TextInputAction.send,
      ),
    );
  }

  Widget _buildState(WeatherState state) {
    if (state is LocationSearchLoadingState) {
      return const LoadingPage();
    } else if (state is LocationSearchLoadedState) {
      final entities = state.models;
      if (entities.isEmpty) {
        return InformationPage(
          message: S.of(context).message_information_page,
        );
      }
      return _buildList(entities);
    } else if (state is LocationSearchErrorState) {
      final message = S.of(context).error_loading_weather_data;
      return ErrorPage(message: message);
    } else {
      return const EmptyPage();
    }
  }

  Widget _buildList(List<LocationSearch> locations) {
    return ListView.separated(
      itemCount: locations.length,
      itemBuilder: (BuildContext context, int index) {
        return LocationSearchRowItem(
            entity: locations[index], onClickButton: _onClickButton);
      },
      separatorBuilder: (BuildContext context, int index) => const Divider(),
    );
  }

  void _onClickButton(LocationSearch location) {
    if (location.isFavorite) {
      context
          .read(lsNotifierProvider.notifier)
          .unsetFavoriteLocationSearch(location: location);
    } else {
      context
          .read(lsNotifierProvider.notifier)
          .setFavoriteLocationSearch(location: location);
    }
  }
}
