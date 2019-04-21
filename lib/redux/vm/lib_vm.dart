import 'package:flutter_yyts/api/api.dart';
import 'package:flutter_yyts/models/lib_resource_info.dart';
import 'package:flutter_yyts/redux/states/main_state.dart';
import 'package:flutter_yyts/redux/vm/main_vm.dart';
import 'package:redux/src/store.dart';

class LibViewModel extends ViewModel {
  LibViewModel(Store<ReduxState> store) : super(store);

  List<LibResourceVo> get resourceList => this.store.state.lib.resourceList;

  List<LibResourceVo> get filtedResourceList =>
      this.store.state.lib.filtedResourceList;

  List<String> get years => ["All"]..addAll(this.store.state.lib.category.year);

  List<String> get categories =>
      ["All"]..addAll(this.store.state.lib.category.category);

  List<String> get tvs => ["All"]..addAll(this.store.state.lib.category.tv);

  bool get isloading => this.store.state.lib.isloading;

  String selectedCategory = "";
  String selectedYear = "";
  String selectedTv = "";
  String sort = "itemupdate";
  String area = "";

  void refreshResourceList() {
    final category = selectedCategory == "All" ? "" : selectedCategory;
    final year = selectedYear == "All" ? "" : selectedYear;
    final tv = selectedTv == "All" ? "" : selectedTv;
    RestfulApi.fetchLibResourceList(
        category: category, year: year, tv: tv, sort: sort, area: area);
  }
}
