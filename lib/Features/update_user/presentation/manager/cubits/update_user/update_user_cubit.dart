// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:tasks_app_eraasoft/Features/update_user/presentation/manager/cubits/update_user/update_user_states.dart';

// class UpdateUserCubit extends Cubit<UpdateUserStates> {
//   UpdateUserCubit() : super(UpdateUserInitial());

//   static UpdateUserCubit get(context) => BlocProvider.of(context);

//   void updateUser(
//       {required String name,
//       required String email,
//       required String phone,
//       required String password,
//       required String userType,
//       required String userId}) async {
//     try {
//       emit(UpdateUserLoading());
//       await UpdateUserRepo.updateUser(
//           name: name,
//           email: email,
//           phone: phone,
//           password: password,
//           userType: userType,
//           userId: userId);
//       emit(UpdateUserSuccess());
//     } on Exception catch (e) {
//       emit(UpdateUserFailure(errorMessage: e.toString()));
//     } catch (_) {
//       emit(UpdateUserFailure(errorMessage: "Something went wrong"));
//     }
//   }
// }

