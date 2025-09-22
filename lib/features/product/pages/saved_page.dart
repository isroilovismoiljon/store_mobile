import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';
import 'package:store_mobile/features/common/widgets/empty_page.dart';
import 'package:store_mobile/features/home/managers/home_bloc.dart';
import 'package:store_mobile/features/home/managers/home_state.dart';
import 'package:store_mobile/features/saved/widgets/saved_product.dart';
import '../../../core/constants/status.dart';
import '../../common/widgets/app_bar/my_app_bar.dart';

class SavedPage extends StatelessWidget {
  const SavedPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MyAppBar(isHaveBottomLine: false, title: 'Saved Items', ),
      body: BlocBuilder<HomeBloc, HomeState>(
        builder: (context, state) => Padding(
          padding: EdgeInsets.symmetric(horizontal: 24.w),
          child: state.statusSavedProducts == Status.loading
              ? Center(child: CircularProgressIndicator())
              : state.savedProducts.isNotEmpty
              ? GridView.builder(
                  padding: EdgeInsets.zero,
                  gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    mainAxisExtent: 172.h,
                    mainAxisSpacing: 24.h,
                    crossAxisSpacing: 19.w,
                    childAspectRatio: 0.87,
                  ),
                  itemCount: state.savedProducts.length,
                  itemBuilder: (BuildContext context, int index) {
                    return SavedProduct(
                      id: state.savedProducts[index].id,
                      title: state.savedProducts[index].title,
                      image: state.savedProducts[index].image,
                      isLiked: state.savedProducts[index].isLiked,
                      price: state.savedProducts[index].price,
                    );
                  },
                )
              : EmptyPage(
                  icon: AppIcons.heartDuotone,
                  title: 'No Saved Items!',
                  subTitle: "You don’t have any saved items.\nGo to home and add some.",
                ),
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
