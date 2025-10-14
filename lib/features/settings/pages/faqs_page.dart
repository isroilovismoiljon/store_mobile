import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:store_mobile/core/utils/imports.dart';
import 'package:store_mobile/features/common/widgets/my_app_bar.dart';
import 'package:store_mobile/features/common/widgets/my_bottom_navigation_bar.dart';

import '../../../core/utils/styles.dart';

class FaqsPage extends StatefulWidget {
  const FaqsPage({Key? key}) : super(key: key);

  @override
  State<FaqsPage> createState() => _FaqsPageState();
}

class _FaqsPageState extends State<FaqsPage> {
  final List<String> faqsCategories = ['General', 'Account', 'Service', 'Payment'];
  final searchController = SearchController();
  int selectedCategoryIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      appBar: MyAppBar(title: 'FAQs'),
      body: Padding(
        padding: EdgeInsets.fromLTRB(24.w, 24.h, 25.w, 56.h),
        child: Column(
          spacing: 16.h,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 40.h,
              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                itemCount: faqsCategories.length,
                separatorBuilder: (_, __) => SizedBox(width: 8.w),
                itemBuilder: (context, index) {
                  final bool isActive = selectedCategoryIndex == index;
                  return GestureDetector(
                    onTap: () => setState(() => selectedCategoryIndex = index),
                    child: Container(
                      height: 36.h,
                      padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 7.h),
                      decoration: BoxDecoration(
                        color:isActive ? AppColors.black : Color(0xFFFFFFFF),
                        borderRadius: BorderRadius.circular(10.r),
                        border: BoxBorder.all(color: AppColors.borderColor),
                      ),
                      alignment: Alignment.center,
                      child: Text(
                        faqsCategories[index],
                        style: AppStyles.rating.copyWith(color: isActive ? Colors.white : Colors.black),
                      ),
                    ),
                  );
                },
              ),
            ),
            CustomTextField(controller: searchController, label: '', hintText: 'Search for questions...', onValidChanged: (bool value) {  },),
            Expanded(
              child: ListView.separated(
                itemCount: faqsCategories.length,
                separatorBuilder: (_, __) => SizedBox(height: 8.h),
                itemBuilder: (context, index) {
                  final faq = faqsCategories[index];
                  return Container(
                    decoration: BoxDecoration(
                      color: Colors.white,
                      border: Border.all(color: Colors.grey.shade300),
                      borderRadius: BorderRadius.circular(12.r),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black12,
                          blurRadius: 2,
                          offset: const Offset(0, 1),
                        ),
                      ],
                    ),
                    child: ExpansionTile(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12.r),
                      ),
                      title: Text('Question', style: AppStyles.rating),
                      childrenPadding: EdgeInsets.symmetric(horizontal: 16.w, vertical: 10.h),
                      children: [
                        Text('Answer', style: AppStyles.rating),
                      ],
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
      bottomNavigationBar: MyBottomNavigationBar(),
    );
  }
}
