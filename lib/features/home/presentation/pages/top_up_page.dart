import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:top_up_test/core/constants/colors_constant.dart';
import 'package:top_up_test/core/utils/context_extension.dart';
import 'package:top_up_test/core/utils/snack_bar.dart';
import 'package:top_up_test/core/utils/uuid_generator.dart';
import 'package:top_up_test/core/widgets/column_sized_box.dart';
import 'package:top_up_test/core/widgets/drop_down_form.dart';
import 'package:top_up_test/core/widgets/generic_button.dart';
import 'package:top_up_test/core/widgets/generic_text.dart';
import 'package:top_up_test/core/widgets/generic_text_form_field.dart';
import 'package:top_up_test/features/home/domain/entities/transaction_entity.dart';
import 'package:top_up_test/features/home/presentation/cubits/create_transaction/create_transaction_cubit.dart';
import 'package:top_up_test/features/user/domain/entities/user_entity.dart';
import 'package:top_up_test/locator/locate.dart';

@RoutePage<dynamic>()
class TopUpPage extends StatefulWidget {
  final UserEntity userEntity;
  const TopUpPage({super.key, required this.userEntity});

  @override
  State<TopUpPage> createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  late CreateTransactionCubit _createTransactionCubit;

  late TextEditingController _fullNameController;
  late TextEditingController _nicknameController;

  late GlobalKey<FormState> _formKey;
  late FocusScopeNode _focusNode;

  final List<DropDownItem> _topUpOptions = const [
    DropDownItem(title: 'AED 5'),
    DropDownItem(title: 'AED 10'),
    DropDownItem(title: 'AED 20'),
    DropDownItem(title: 'AED 30'),
    DropDownItem(title: 'AED 50'),
    DropDownItem(title: 'AED 75'),
    DropDownItem(title: 'AED 100'),
  ];
  String? _topUpValue;

  @override
  void initState() {
    super.initState();
    _createTransactionCubit = locate<CreateTransactionCubit>();

    _fullNameController =
        TextEditingController(text: '${widget.userEntity.firstName} ${widget.userEntity.lastName}');
    _nicknameController = TextEditingController(text: widget.userEntity.nickname);

    _formKey = GlobalKey<FormState>();
    _focusNode = FocusScopeNode();
  }

  @override
  void dispose() {
    _createTransactionCubit.close();
    _fullNameController.dispose();
    _nicknameController.dispose();
    _focusNode.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider<CreateTransactionCubit>.value(
      value: _createTransactionCubit,
      child: Scaffold(
        appBar: AppBar(),
        body: BlocConsumer<CreateTransactionCubit, CreateTransactionState>(
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
              context.back();
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
                            text: 'Top Up Beneficiary',
                            size: 24.sp,
                            weight: FontWeight.w700,
                          ),
                          ColumnSizedBox(40.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GenericText(
                                text: 'Full Name',
                                weight: FontWeight.w700,
                              ),
                              ColumnSizedBox(5.h),
                              GenericTextFormField(
                                editingController: _fullNameController,
                                label: '',
                                isBusy: true,
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
                                label: '',
                                isBusy: true,
                                inputType: TextInputType.text,
                              ),
                            ],
                          ),
                          ColumnSizedBox(20.h),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const GenericText(
                                text: 'Top-up options',
                                weight: FontWeight.w700,
                              ),
                              ColumnSizedBox(5.h),
                              DropDownForm(
                                items: _topUpOptions,
                                selected:
                                    _topUpValue == null ? null : DropDownItem(title: _topUpValue!),
                                onChange: (String value) {
                                  _topUpValue = value;
                                  setState(() {});
                                },
                              ),
                            ],
                          ),
                          ColumnSizedBox(30.h),
                          GenericButton(
                            label: 'Top Up',
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
                                if (_topUpValue == null || _topUpValue == '') return;
                                _createTransactionCubit.createTransaction(
                                  transactionEntity: TransactionEntity(
                                    uuid: generateUuid(),
                                    user: widget.userEntity,
                                    topUpOption: _topUpValue!,
                                    createdAt: DateTime.now(),
                                  ),
                                  currentBalance: context.currentUser!.accountBalance,
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
