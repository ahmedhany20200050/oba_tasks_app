import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tasks_app_eraasoft/Features/new_user/data/repo/add_user_repo.dart';
import 'package:tasks_app_eraasoft/Features/new_user/presentation/manager/cubits/new_user/new_user_states.dart';

class NewUserCubit extends Cubit<NewUserStates> {
  NewUserCubit() : super(NewUserInitial());
  static NewUserCubit get(context) => BlocProvider.of(context);
  void addUser({required String name,required String email,required String phone,required String password,required String userType}) async{
    try {
      emit(NewUserLoading());
      await AddUserRepo.addUser(
          name: name,
          email: email,
          phone: phone,
          password: password,
          userType: userType);
      emit(NewUserSuccess());
    } on Exception catch (e) {
      emit(NewUserFailure(errorMessage: e.toString()));
    } catch (_) {
      emit(NewUserFailure(errorMessage: "Something went wrong"));
    }
  }
}
