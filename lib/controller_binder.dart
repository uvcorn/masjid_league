import 'package:get/get.dart';

import 'views/components/bottom_nav_bar/bottom_nav_controller.dart';
import 'views/screens/tournament_drawer_section/controller/drawer_controller.dart';

class ControllerBinder extends Bindings {
  @override
  void dependencies() {
    // Get.lazyPut<AuthController>(() => AuthController());
    // Get.put(AuthController());
    Get.put(BottomNavController());
    Get.put(DrawerControllerX());
    // Get.put(CreatePostController());
    // // Get.lazyPut<PostController>(() => PostController());
    // // Get.lazyPut<GroupController>(() => GroupController());
    // Get.put(GroupController());
    // Get.put(HomeController());
    // Get.put(PostController());
    // Get.put(OpenWorkshopController());
    // Get.put(ImagePickerGridController());
    // Get.put(CommentController());

    // Get.Put<HomeController>(() => HomeController());
    // Get.lazyPut<RegistrationPowerUserController>(
    //   () => RegistrationPowerUserController(),
    // );
  }
}
