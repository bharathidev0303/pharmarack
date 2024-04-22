
import 'package:fpdart/fpdart.dart';
import 'package:pharmarack/packages/core_flutter/error/base_error.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/all_filter_model.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/model/status_item.dart';
import 'package:pharmarack/view/dashboard/order_history/domain/repository/order_history_repository.dart';
// import 'package:retailer/features/order_history/data/model/all_filter.dart';

class OrderHistoryFilterUseCase {
  final OrderHistoryRepository _repository;
  OrderHistoryFilterUseCase(this._repository);

  Future<Either<BaseError, AllFilterModel>> execute() {
    return _repository.allFilter();
  }

  final List<StatusItem> statusList = [
    StatusItem(name: "All", id: -1),
    // StatusItem(name: "Placed"),//Order
    // StatusItem(name: "Uploaded"),//Accepted
    // StatusItem(name: "Processed")//Invoiced
    // StatusItem(name: "Cancel"),
    // StatusItem(name: "Hold")
  ];
  final List<String> selectedList = [];


  String fromDate = '';
  String toDate = '';

  List<StatusItem> getStatusList() {
    return statusList;
  }

  List<StatusItem> updateTheStatusList(int index) {
    final statusItem = statusList;
    if (statusItem[index].name == 'All' &&
        statusItem[index].isSelected == false) {
      // Select all other items when "All" is selected
      for (var i = 1; i < statusItem.length; i++) {
        statusItem[i].isSelected = true;
        selectedList.add(statusItem[i].name);
      }
    } else if (statusItem[index].name == 'All' &&
        statusItem[index].isSelected == true) {
      // Select all other items when "All" is selected
      for (var i = 1; i < statusItem.length; i++) {
        statusItem[i].isSelected = false;
        selectedList.remove(statusItem[i].name);
      }
    }
    else {
      // Deselect "All" when any other item is selected
      statusItem[0].isSelected = false;
    }

    statusItem[index].isSelected = !statusItem[index].isSelected;
    if(!selectedList.contains(statusItem[index].name) && statusItem[index].isSelected==true && statusItem[index].name.toLowerCase()!= 'all'){
      selectedList.add(statusItem[index].name);
    }else if(selectedList.contains(statusItem[index].name) && statusItem[index].isSelected==false && statusItem[index].name.toLowerCase()!= 'all'){
      selectedList.remove(statusItem[index].name);
    }
    if(selectedList.length == statusItem.length-1 && !selectedList.contains('All')){
      statusItem[0].isSelected=true;
    }else if(selectedList.length != statusItem.length-1){
      statusItem[0].isSelected=false;
    }

    return statusItem;
  }

  List<StatusItem> resetTheStatusList() {
    final statusItem = statusList;

    // Select all other items when "All" is selected
    for (var i = 0; i < statusItem.length; i++) {
      statusItem[i].isSelected = false;
    }

    return statusItem;
  }
}
