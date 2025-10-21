import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/core/utils/icons.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/common/widgets/empty_page.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/home/managers/home_bloc.dart';
import 'package:store_mobile/features/home/managers/home_event.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';
import '../../../core/constants/status.dart';
import '../widgets/search_item.dart';

class SearchPage extends StatefulWidget {
  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {

  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      extendBody: true,
      appBar: MyAppBar(title: 'Search', isHaveBottomLine: false,),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) {
          return Column(
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(24.w, 5.h, 24.w, 0.h),
                child: TextFormField(
                  controller: controller,
                  inputFormatters: [],
                  onChanged: (value){
                    context.read<HomeBloc>().add(HomeEventGetSearchProducts(title: controller.text));
                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixIcon: IconButton(
                      onPressed: () {},
                      padding: EdgeInsets.zero,
                      iconSize: 24.r,
                      icon: SvgPicture.asset(AppIcons.search),
                    ),
                    constraints: BoxConstraints(maxHeight: 52.h),
                    hintText: 'Search for clothes...',
                    hintStyle: TextStyle(
                      color: Colors.grey,
                      fontSize: 14.sp,
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: AppColors.borderColor,
                        width: 1.5,
                      ),
                    ),
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.r),
                      borderSide: BorderSide(
                        color: AppColors.borderColor,
                        width: 1.5.w,
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: EdgeInsets.fromLTRB(24.w, 5.h, 24.w, 0.h),
                  child: state.statusSearch == Status.loading
                      ? const Center(child: CircularProgressIndicator())
                      : state.searchItems.isEmpty
                      ? EmptyPage(
                    icon: AppIcons.search,
                    title: 'No Results Found!',
                    subTitle: 'Try a similar word or something\nmore general.',
                  )
                      : ListView.separated(
                    padding: EdgeInsets.only(top: 20.h, bottom: 100.h),
                    itemCount: state.searchItems.length,
                    separatorBuilder: (_, __) => SizedBox(height: 20.h),
                    itemBuilder: (context, index) {
                      final product = state.searchItems[index];
                      return SearchItem(product: product);
                    },
                  ),
                ),
              ),
            ],
          );
        },
      ),
      bottomNavigationBar: const MyBottomNavigationBar(),
    );
  }
}
