// import 'package:get/get.dart';
// import 'package:get_storage/get_storage.dart';

// class CourseController extends GetxController {
//   final isLoading = false.obs;
//   final box = GetStorage();
//   var courses = [].obs;

//   @override
//   void onInit() {
//     getAllCourses();
//     super.onInit();
//   }

//   void getAllCourses() async {
//     try {
//       isLoading(true);
//       var courseResult = await getCourses();
//       if (courseResult != null) {
//         courses.assignAll(courseResult);
//       }
//     } catch (e) {
//       isLoading(false);
//       print(e.toString());
//     } finally {
//       isLoading(false);
//     }
//   }

//   Future<List<Course>?> getCourses() async{

//   }
// }
