import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/features/3bottom/home/cubit/home.cubit.dart';
import 'package:paint_shop/features/3bottom/product/widget/category/cubit/category.product.cubit.dart';

void showFilterBottomSheet(BuildContext context) {
  bool isClicked = false;

  showModalBottomSheet(
    context: context,
    isScrollControlled: true,
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
    ),
    builder: (context) {
      return Padding(
        padding: EdgeInsets.only(
          left: 16,
          right: 16,
          top: 16,
          bottom: MediaQuery.of(context).viewInsets.bottom + 16,
        ),
        child: ConstrainedBox(
          constraints: BoxConstraints(
            maxHeight:
                MediaQuery.of(context).size.height * 0.8, // 👈 Max 80% height
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Text(
                  "Filter",
                  style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                ),
              ),
              Divider(),
              SizedBox(height: 10),
              Text(
                "Category",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
              SizedBox(height: 10),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: List.generate(HomeCubit.resuableCategory.length, (
                  index,
                ) {
                  return InkWell(
                    onTap: () async {
                      context.read<ProductCategoryCubit>().categoryVise(
                        HomeCubit.resuableCategory[index].id,
                      );
                      context.push(
                        "/cactegoryProduct",
                        extra: {
                          "category": HomeCubit.resuableCategory[index].id,
                          "screenName":
                              HomeCubit.resuableCategory[index].categoryName,
                        },
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 8,
                      ),
                      decoration: BoxDecoration(
                        color: isClicked == true ? Colors.black : Colors.white,
                        borderRadius: BorderRadius.circular(20),
                        border: Border.all(color: Colors.black),
                      ),
                      child: Text(
                        HomeCubit.resuableCategory[index].categoryName,
                      ),
                    ),
                  );
                }),
              ),
              SizedBox(height: 20),
            ],
          ),
        ),
      );
    },
  );
}
