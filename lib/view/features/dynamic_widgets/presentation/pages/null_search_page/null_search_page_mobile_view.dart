import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pharmarack/gen/assets.gen.dart';
import 'package:pharmarack/packages/core_flutter/dls/theme/theme_extensions.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/null_search_page_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/di/page_config_providers.dart';
import 'package:pharmarack/view/features/dynamic_widgets/presentation/cubit/null_search_page/null_search_page_state.dart';

class NullSearchPageMobileView extends StatefulWidget {
  const NullSearchPageMobileView({super.key});

  @override
  State<NullSearchPageMobileView> createState() =>
      _NullSearchPageMobileViewState();
}

class _NullSearchPageMobileViewState extends State<NullSearchPageMobileView> {
  @override
  void initState() {
    super.initState();
    clearNullSearchPageDi();
    initNullSearchPageDi();
    initPageConfigDi(pageName: "null_search_page");
    nullSearchPageScreenCubit.fetchNullSearchPage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: context.colors.screenBackground,
      body: Padding(
        padding: const EdgeInsets.symmetric(vertical: 20.0),
        child: BlocBuilder(
          bloc: nullSearchPageScreenCubit,
          buildWhen: (previous, current) {
            return (current is NullSearchPageInitialState) ||
                (current is NullSearchPageLoadingState) ||
                (current is NullSearchPageErrorState) ||
                (current is NullSearchPageDataState);
          },
          builder: (context, state) {
            if (state is NullSearchPageLoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            } else if (state is NullSearchPageErrorState) {
              return Center(
                child: Container(
                  child: AppAssets.svg.icInfoCircleError
                      .svg(width: 30, height: 30),
                ),
              );
            } else if (state is NullSearchPageDataState) {
              return ListView(
                children: state.nullSearchPageModel.widget,
              );
            } else {
              return Container();
            }
          },
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    clearNullSearchPageDi();
  }
}
