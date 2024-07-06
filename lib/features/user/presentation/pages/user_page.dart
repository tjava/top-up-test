import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/utils/snack_bar.dart';
import 'package:top_up_test/core/utils/text_field_validators.dart';
import 'package:top_up_test/core/utils/uuid_generator.dart';
import 'package:top_up_test/core/widgets/column_sized_box.dart';
import 'package:top_up_test/core/widgets/generic_button.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';
import 'package:top_up_test/core/widgets/generic_text_form_field.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/features/user/presentation/cubits/create_user/create_user_cubit.dart';
import 'package:top_up_test/locator/locate.dart';

@RoutePage<dynamic>()
class UserPage extends StatefulWidget {
  const UserPage({super.key});

  @override
  State<UserPage> createState() => _UserPageState();
}

class _UserPageState extends State<UserPage> {
  late CreateUserCubit _createUserCubit;

  late TextEditingController _firstNameController;
  late TextEditingController _lastNameController;
  late TextEditingController _nicknameController;
  late TextEditingController _phoneController;

  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  @override
  void initState() {
    super.initState();
    _createUserCubit = locate<CreateUserCubit>();

    _firstNameController = TextEditingController();
    _lastNameController = TextEditingController();
    _nicknameController = TextEditingController();
    _phoneController = TextEditingController();

    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _createUserCubit.close();

    _firstNameController.dispose();
    _lastNameController.dispose();
    _nicknameController.dispose();
    _phoneController.dispose();

    _focusNode.dispose();
    super.dispose();
  }

  void clearForm() {
    _firstNameController.clear();
    _lastNameController.clear();
    _nicknameController.clear();
    _phoneController.clear();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateUserCubit>.value(
      value: _createUserCubit,
      child: Scaffold(
        body: BlocConsumer<CreateUserCubit, CreateUserState>(
          listener: (context, state) {
            if (state is Error) {
              ScaffoldMessenger.of(context).showSnackBar(
                showSnackBar(
                  context: context,
                  message: state.message,
                  color: red,
                ),
              );
            }
            if (state is Loaded) {
              ScaffoldMessenger.of(context).showSnackBar(
                showSnackBar(
                  context: context,
                  message: 'Successful.',
                  color: green,
                ),
              );
              clearForm();
            }
          },
          builder: (context, state) {
            return SafeArea(
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 15.w),
                child: SingleChildScrollView(
                  child: Form(
                    key: _formKey,
                    child: FocusScope(
                      node: _focusNode,
                      child: Column(
                        children: [
                          GenericText(
                            text: 'Create Beneficiary',
                            size: 24.sp,
                            weight: FontWeight.w700,
                          ),
                          ColumnSizedBox(30.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GenericText(
                                text: 'First Name',
                                weight: FontWeight.w700,
                              ),
                              ColumnSizedBox(5.h),
                              GenericTextFormField(
                                editingController: _firstNameController,
                                label: 'John',
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                inputType: TextInputType.text,
                              ),
                            ],
                          ),
                          ColumnSizedBox(20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GenericText(
                                text: 'Last Name',
                                weight: FontWeight.w700,
                              ),
                              ColumnSizedBox(5.h),
                              GenericTextFormField(
                                editingController: _lastNameController,
                                label: 'Doe',
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                inputType: TextInputType.text,
                              ),
                            ],
                          ),
                          ColumnSizedBox(20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GenericText(
                                text: 'Nickname',
                                weight: FontWeight.w700,
                              ),
                              ColumnSizedBox(5.h),
                              GenericTextFormField(
                                editingController: _nicknameController,
                                label: 'Johndoe',
                                isRequired: true,
                                validators: [
                                  maxValueValidator(20),
                                ],
                                isBusy: state is Loading ? true : false,
                                inputType: TextInputType.text,
                                onChanged: (value) {
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          ColumnSizedBox(20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GenericText(
                                text: 'Phone',
                                weight: FontWeight.w700,
                              ),
                              ColumnSizedBox(5.h),
                              GenericTextFormField(
                                editingController: _phoneController,
                                label: '+910987654321',
                                isRequired: true,
                                isBusy: state is Loading ? true : false,
                                inputType: TextInputType.number,
                              ),
                            ],
                          ),
                          ColumnSizedBox(30.h),
                          GenericButton(
                            label: 'Add',
                            labelStyle: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.w700,
                              color: white,
                            ),
                            width: MediaQuery.of(context).size.width,
                            backgroundColor: blue,
                            isBusy: state is Loading ? true : false,
                            fulCurve: false,
                            onClick: () async {
                              if (_formKey.currentState?.validate() ?? false) {
                                _focusNode.unfocus();
                                _createUserCubit.createUser(
                                  UserEntity(
                                    uuid: generateUuid(),
                                    firstName: _firstNameController.text,
                                    lastName: _lastNameController.text,
                                    nickname: _nicknameController.text,
                                    phone: _phoneController.text,
                                    createdAt: DateTime.now(),
                                  ),
                                );
                              }
                            },
                          ),
                          ColumnSizedBox(20.h),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
