
import 'package:get/get.dart';

class MainTabController extends GetxController{
  var selected =0.obs;

  void onItemTap(int index){
    selected.value=index;
  }

  void setInitialTab(int index){
    selected.value=index;
  }

}
