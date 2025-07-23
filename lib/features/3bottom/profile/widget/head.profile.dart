import 'package:cached_network_image/cached_network_image.dart';
import 'package:paint_shop/app/import.dart';
import 'package:paint_shop/core/services/cache.photo.dart';
import 'package:paint_shop/features/3bottom/profile/widget/show.logout.dart';
import 'package:shimmer/shimmer.dart';

class CustomProfileHead extends StatelessWidget {
  final dynamic user;

  const CustomProfileHead({Key? key, required this.user}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ListTile(
      trailing: InkWell(
        onTap: () => showLogoutDialog(context),
        child: Icon(Icons.logout, color: AppColors.red),
      ),
      horizontalTitleGap: 10.0.w,
      minLeadingWidth: 1,
      leading: SizedBox(
        width: 48.w,
        height: 48.h,
        child: ClipOval(
          child: CachedNetworkImage(
            cacheManager: MyCacheManager.instance,
            imageUrl: user.profilePick ?? "https://dummyimage.com/100x100",
            fit: BoxFit.cover,
            errorWidget: (context, url, error) =>
                CircleAvatar(child: Icon(Icons.error)),
            progressIndicatorBuilder: (context, url, progress) => Center(
              child: Shimmer.fromColors(
                baseColor: Colors.grey[300]!,
                highlightColor: Colors.grey[100]!,
                child: CircleAvatar(radius: 80.r),
              ),
            ),
          ),
        ),
      ),
      title: AppText(
        title: user.fullName ?? '',
        fontSize: 18,
        fontWeight: FontWeight.w500,
        maxLine: 1,
        textOverflow: TextOverflow.ellipsis,
      ),
    );
  }
}
