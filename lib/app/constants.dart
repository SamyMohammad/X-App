class Constants {
  static const String baseUrl = 'http://136.243.225.45/api/';

  static const String signInUrl = 'auth/login';
  static const String signUpUrl = 'auth/register';
  static const String logOutUrl = 'auth/logout';

  static const String updateName = 'user/profile/change_name';
  static const String addCourses = 'user/profile/add_courses';
  static const String getCourses = 'user/profile/get_courses';
  static const String updateCourses = 'user/profile/update_course';
  static const String deleteCourses = 'user/profile/delete_course';
  static const String getAllJobsList = 'user/jobs/list';
  static const String getJobsStatusList = 'user/jobs/jobs_history';

  static const String getProfileCompilation =
      'user/profile/profile_compilation';
  static const String applyJob = 'user/jobs/apply';

  static const String getEducation = 'user/profile/get_education';
  static const String updateEducation = 'user/profile/update_education';

  static const String getSpecialization = 'user/profile/get_specialization';
  static const String updateSpecialization =
      'user/profile/update_specialization';
  static const String getLevel = 'user/profile/get_level';
  static const String updateLevel = 'user/profile/update_level';
  static const String getEducationState = 'user/profile/get_education_state';
  static const String updateEducationState =
      'user/profile/update_education_state';
  static const String getUserImage = 'user/profile/get_user_image';
  static const String updateUserImage = 'user/profile/update_user_image';
  static const String changePassword = 'auth/change_password';
  static const String userProfile = 'user/profile/user_profile';

  static const String empty = "";
  static const String token = "SEND TOKEN HERE";
  static const int zero = 0;
  static const int apiTimeOut = 60000;
}
