import '/backend/api_requests/api_calls.dart';
import '/flutter_flow/flutter_flow_util.dart';
import '/index.dart';
import 'all_players_widget.dart' show AllPlayersWidget;
import 'package:flutter/material.dart';
import 'package:infinite_scroll_pagination/infinite_scroll_pagination.dart';

class AllPlayersModel extends FlutterFlowModel<AllPlayersWidget> {
  ///  Local state fields for this page.

  bool isLoading = false;

  ///  State fields for stateful widgets in this page.

  // State field(s) for ListView widget.

  PagingController<ApiPagingParams, dynamic>? listViewPagingController;
  Function(ApiPagingParams nextPageMarker)? listViewApiCall;

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    listViewPagingController?.dispose();
  }

  /// Additional helper methods.
  PagingController<ApiPagingParams, dynamic> setListViewController(
    Function(ApiPagingParams) apiCall,
  ) {
    listViewApiCall = apiCall;
    return listViewPagingController ??= _createListViewController(apiCall);
  }

  PagingController<ApiPagingParams, dynamic> _createListViewController(
    Function(ApiPagingParams) query,
  ) {
    final controller = PagingController<ApiPagingParams, dynamic>(
      firstPageKey: ApiPagingParams(
        nextPageNumber: 0,
        numItems: 0,
        lastResponse: null,
      ),
    );
    return controller..addPageRequestListener(listViewGetAllPlayersPage);
  }

  void listViewGetAllPlayersPage(ApiPagingParams nextPageMarker) =>
      listViewApiCall!(nextPageMarker).then((listViewGetAllPlayersResponse) {
        final pageItems = (DashboardGroup.getAllPlayersCall.playerData(
                  listViewGetAllPlayersResponse.jsonBody,
                )! ??
                [])
            .toList();
        final newNumItems = nextPageMarker.numItems + pageItems.length;
        listViewPagingController?.appendPage(
          pageItems,
          (pageItems.length > 0)
              ? ApiPagingParams(
                  nextPageNumber: nextPageMarker.nextPageNumber + 1,
                  numItems: newNumItems,
                  lastResponse: listViewGetAllPlayersResponse,
                )
              : null,
        );
      });
}
