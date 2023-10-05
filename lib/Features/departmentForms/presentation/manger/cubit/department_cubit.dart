// ignore_for_file: missing_required_param
import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:tasks_app_eraasoft/Features/departmentForms/presentation/manger/cubit/department_cubit_state.dart';
import 'package:tasks_app_eraasoft/Features/login/presentation/manger/cubit/login_cubit_cubit.dart';
import 'package:tasks_app_eraasoft/core/helpers/api.dart';
import 'package:tasks_app_eraasoft/core/utils/endpoints.dart';

import '../../../data/DepartmentsModel.dart';
import 'package:flutter/material.dart';
class DepartmentCubitCubit extends Cubit<DepartmentCubitState> {
  DepartmentCubitCubit() : super(DepartmentCubitInitial());
  var storage=  FlutterSecureStorage();
  late Depts depts;
  List<Department>dropDownItems=[];
  Future addDept({required String name}) async {
    emit(AddDepartmentCubitLoading());
    String? token = await storage.read(key: "token");
    try {
      var data = await Api().post(
        url: EndPoints.baseUrl + EndPoints.addDepartEndpoint,
        token: token,
        body: {
          'name': name,
        },
      );
      emit(AddDepartmentCubitSuccess());
      if (kDebugMode) {
        print(data.toString());
      }
    } on Exception catch (e) {
      emit(AddDepartmentCubitFailure(errmsg: e.toString()));
    }

  }

  Future updateDept({required String name,required String ManagerID,required int deptID}) async {
    emit(UpdateDepartmentCubitLoading());
    String? token = await storage.read(key: "token");
    try {
      //todo: make the post right
      var data = await Api().post(
        url: EndPoints.baseUrl + EndPoints.updateDepartEndpoint(deptID),
        token: token,
        body: {
          'name': name,
          'manager_id':ManagerID,
        },
      );
      emit(UpdateDepartmentCubitSuccess());
      if (kDebugMode) {
        print(data.toString());
      }
    } on Exception catch (e) {
      emit(UpdateDepartmentCubitFailure(errmsg: e.toString()));
    }
  }

  Future deleteDept({required int deptID}) async {
    emit(DeleteDepartmentCubitLoading());
    String? token = await storage.read(key: "token");
    try {
      var data = await Api().delete(
        url: EndPoints.baseUrl + EndPoints.deleteDepartEndpoint(deptID),
        token: token,
      );
      emit(DeleteDepartmentCubitSuccess());
      if (kDebugMode) {
        print(data.toString());
      }
    } on Exception catch (e) {
      emit(DeleteDepartmentCubitFailure(errmsg: e.toString()));
    }
  }

  Future getDept()async{
    emit(GetDepartmentCubitLoading());
    String? token = await storage.read(key: "token");
    try {
      print(token);
      var data = await Api().get(
        url: EndPoints.baseUrl + EndPoints.getDepartEndpoint,
        token: token,
      );
      depts= Depts.fromJson(data);

      depts.data?.forEach((element) {
        dropDownItems.add(
           element
        );
      });
      dropDownItems=dropDownItems.reversed.toList();
      emit(GetDepartmentCubitSuccess());
      if (kDebugMode) {
        print(data.toString());
        print("\n\nprinting Depts:\n\n");
        print(depts.data.toString());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
      emit(GetDepartmentCubitFailure(errmsg: e.toString()));
    }
  }
}
