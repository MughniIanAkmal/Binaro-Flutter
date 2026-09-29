import 'package:flutter/material.dart';
import '../constants/app_colors.dart';
import '../core/app_routes.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final bool showBackButton;
  final bool showSubBrand;
  final Widget? leadingIcon;
  final Widget? titleWidget;
  final VoidCallback? onBackTap;
  final bool showNotifications;
  final bool showAvatar;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;

  const CustomAppBar({
    super.key,
    required this.title,
    this.subTitle,
    this.showBackButton = true,
    this.showSubBrand = false,
    this.leadingIcon,
    this.titleWidget,
    this.onBackTap,
    this.showNotifications = true,
    this.showAvatar = true,
    this.onNotificationTap,
    this.onAvatarTap,
  });

  @override
  Size get preferredSize => const Size.fromHeight(76);

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final compact = width < 380;
    final horizontalPadding = width >= 900
        ? 48.0
        : width >= 600
            ? 32.0
            : 16.0;
    final maxContentWidth = width >= 1000 ? 980.0 : double.infinity;

    return Container(
      width: double.infinity,
      decoration: const BoxDecoration(
        color: AppColors.blue,
        boxShadow: [
          BoxShadow(
            color: Color(0x22000000),
            blurRadius: 12,
            offset: Offset(0, 5),
          ),
        ],
      ),
      child: SafeArea(
        bottom: false,
        child: SizedBox(
          height: compact ? 70 : 76,
          child: Center(
            child: ConstrainedBox(
              constraints: BoxConstraints(maxWidth: maxContentWidth),
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
                child: Row(
                  children: [
                    // Leading: Back button or school icon
                    if (showBackButton)
                      Padding(
                        padding: const EdgeInsets.only(right: 8),
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back_rounded,
                            color: Colors.white,
                            size: 26,
                          ),
                          padding: EdgeInsets.zero,
                          constraints: const BoxConstraints(),
                          onPressed: onBackTap ?? () => Navigator.of(context).maybePop(),
                        ),
                      )
                    else if (leadingIcon != null)
                      Padding(
                        padding: const EdgeInsets.only(right: 10),
                        child: leadingIcon!,
                      )
                    else
                      Container(
                        width: compact ? 42 : 48,
                        height: compact ? 42 : 48,
                        margin: const EdgeInsets.only(right: 12),
                        decoration: BoxDecoration(
                          color: AppColors.orange,
                          borderRadius: BorderRadius.circular(14),
                        ),
                        child: Icon(
                          Icons.school,
                          color: Colors.white,
                          size: compact ? 24 : 28,
                        ),
                      ),

                    // Title Section
                    Expanded(
                      child: titleWidget ??
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'BINARO',
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: AppColors.orange,
                                  fontSize: 14,
                                  fontWeight: FontWeight.w800,
                                  letterSpacing: .3,
                                ),
                              ),
                              Text(
                                title,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                                style: TextStyle(
                                  color: Colors.white,
                                  fontSize: compact ? 19 : 22,
                                  fontWeight: FontWeight.w800,
                                ),
                              ),
                            ],
                          ),
                    ),

                    // Bell Notification
                    if (showNotifications)
                      GestureDetector(
                        onTap: onNotificationTap ??
                            () {
                              Navigator.pushNamed(
                                context,
                                AppRoutes.homeworkNotifications,
                              );
                            },
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.white,
                              size: compact ? 26 : 30,
                            ),
                            Positioned(
                              right: 1,
                              top: 1,
                              child: Container(
                                width: 9,
                                height: 9,
                                decoration: const BoxDecoration(
                                  color: AppColors.orange,
                                  shape: BoxShape.circle,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),

                    if (showAvatar) ...[
                      const SizedBox(width: 14),
                      GestureDetector(
                        onTap: onAvatarTap ??
                            () {
                              Navigator.pushNamed(context, AppRoutes.profile);
                            },
                        child: Container(
                          width: compact ? 42 : 46,
                          height: compact ? 42 : 46,
                          padding: const EdgeInsets.all(2),
                          decoration: const BoxDecoration(
                            color: Colors.white,
                            shape: BoxShape.circle,
                          ),
                          child: ClipOval(
                            child: Image.asset(
                              'assets/avatar.png',
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) =>
                                  Container(
                                color: AppColors.lightOrange,
                                child: const Icon(
                                  Icons.person,
                                  color: AppColors.blue,
                                  size: 26,
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),
                    ],
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
