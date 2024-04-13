import 'package:pharmarack/di/app_provider.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/api_services/widget_builder_services.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/endpoints_constants/widget_builder_instanceName.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/distributors/distributors_entity.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/feedback/feedback_entity.dart';
import 'package:pharmarack/view/features/dynamic_widgets/common_widgets/data/model/products/products_entity.dart';

class WidgetBuilderRepository {
  final WidgetBuilderApiService _widgetBuilderApiServices;

  WidgetBuilderRepository(this._widgetBuilderApiServices);

// Feedback Api Call
  Future<FeedbackEntity> fetchFeedbackList(
      {required int page, required int limit}) async {
    final response = await _widgetBuilderApiServices.fetchFeedbackDetails(
        page: page, limit: limit);

    return response.data;
  }

// TopPicks Api Call
  Future<ProductsEntity> fetchTopPicksList({required int limit}) async {
    final response =
        await _widgetBuilderApiServices.fetchTopPicksDetails(limit: limit);

    getIt.unregister<ProductsEntity>(instanceName: ProductsInstance.topPicks);
    getIt.registerSingleton<ProductsEntity>(response.data,
        instanceName: ProductsInstance.topPicks);

    return getIt<ProductsEntity>(instanceName: ProductsInstance.topPicks);
  }

// TopOffers Api Call
  Future<ProductsEntity> fetchTopOffersList({required int limit}) async {
    final response =
        await _widgetBuilderApiServices.fetchTopOffersDetails(limit: limit);

    getIt.unregister<ProductsEntity>(instanceName: ProductsInstance.topOffers);
    getIt.registerSingleton<ProductsEntity>(response.data,
        instanceName: ProductsInstance.topOffers);

    return getIt<ProductsEntity>(instanceName: ProductsInstance.topOffers);
  }

// RecentlyOrdered Api Call
  Future<ProductsEntity> fetchRecentlyOrderedList({required int limit}) async {
    final response = await _widgetBuilderApiServices
        .fetchRecentlyOrderedDetails(limit: limit);

    getIt.unregister<ProductsEntity>(
        instanceName: ProductsInstance.recentlyOrdered);
    getIt.registerSingleton<ProductsEntity>(response.data,
        instanceName: ProductsInstance.recentlyOrdered);

    return getIt<ProductsEntity>(
        instanceName: ProductsInstance.recentlyOrdered);
  }

// PopularNearYou Api Call
  Future<ProductsEntity> fetchPopularNearYouList({required int limit}) async {
    final response = await _widgetBuilderApiServices.fetchPopularNearYouDetails(
        limit: limit);

    getIt.unregister<ProductsEntity>(
        instanceName: ProductsInstance.popularNearYou);
    getIt.registerSingleton<ProductsEntity>(response.data,
        instanceName: ProductsInstance.popularNearYou);

    return getIt<ProductsEntity>(instanceName: ProductsInstance.popularNearYou);
  }

// FrequentlySearches Api Call
  Future<ProductsEntity> fetchFrequentlySearchesList(
      {required int limit}) async {
    final response = await _widgetBuilderApiServices
        .fetchFrequentlySearchesDetails(limit: limit);

    getIt.unregister<ProductsEntity>(
        instanceName: ProductsInstance.frequentlySearches);
    getIt.registerSingleton<ProductsEntity>(response.data,
        instanceName: ProductsInstance.frequentlySearches);

    return getIt<ProductsEntity>(
        instanceName: ProductsInstance.frequentlySearches);
  }

// YourDistributors Api Call
  Future<DistributorsEntity> fetchYourDistributorsList() async {
    final response =
        await _widgetBuilderApiServices.fetchYourDistributorsDetails();

    getIt.unregister<DistributorsEntity>(
        instanceName: DistributorsInstance.yourDistributors);
    getIt.registerSingleton<DistributorsEntity>(response.data,
        instanceName: DistributorsInstance.yourDistributors);

    return getIt<DistributorsEntity>(
        instanceName: DistributorsInstance.yourDistributors);
  }

// PreferredDistributors Api Call
  Future<DistributorsEntity> fetchPreferredDistributorsList(
      {required String orderBy}) async {
    final response = await _widgetBuilderApiServices
        .fetchPreferredDistributorsDetails(orderBy: orderBy);

    getIt.unregister<DistributorsEntity>(
        instanceName: DistributorsInstance.preferredDistributors);
    getIt.registerSingleton<DistributorsEntity>(response.data,
        instanceName: DistributorsInstance.preferredDistributors);

    return getIt<DistributorsEntity>(
        instanceName: DistributorsInstance.preferredDistributors);
  }
}
