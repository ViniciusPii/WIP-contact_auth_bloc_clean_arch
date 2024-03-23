import 'package:bloc/bloc.dart';
import 'package:contact_auth_bloc/src/presentation/add_contact/controller/add_contact_state.dart';

class AddContactCubit extends Cubit<AddContactState> {
  AddContactCubit() : super(const AddContactStateInitial());
}
