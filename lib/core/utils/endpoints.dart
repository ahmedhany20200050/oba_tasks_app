class EndPoints {
  static String baseUrl = 'https://tasksapp.integration25.com/api';
  static String loginEndpoint = '/auth/login';
  static String logoutEndpoint = '/auth/logout';
  static String addDepartEndpoint = '/department/store';
  //todo: make the update work
  static String updateDepartEndpoint(int id) => '/department/update/$id';
  static String getDepartEndpoint = '/department/index';
  static String addTasksEndpoint = '/task/store';
  static String updateTasksEndpoint(int id) => '/task/update/$id';
  static String getEmpEndpoint = '/user/index';

}
