import 'package:flutter/material.dart';

import '../constants/app_colors.dart';
import '../core/app_routes.dart';

class TopHeader extends StatelessWidget {
  final String title;
  final bool showBackButton;
  final VoidCallback? onBackTap;
  final VoidCallback? onNotificationTap;
  final VoidCallback? onAvatarTap;

  const TopHeader({
    super.key,
    required this.title,
    this.showBackButton = false,
    this.onBackTap,
    this.onNotificationTap,
    this.onAvatarTap,
  });

  @override
  Widget build(BuildContext context) {
    final media = MediaQuery.of(context);
    final width = media.size.width;
    final compact = width < 380;
    final horizontalPadding = width >= 900
        ? 48.0
        : width >= 600
        ? 32.0
        : 20.0;
    final maxContentWidth = width >= 1000 ? 980.0 : double.infinity;

    return Container(
      height: compact ? 76 : 88,
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
      child: Center(
        child: ConstrainedBox(
          constraints: BoxConstraints(maxWidth: maxContentWidth),
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: horizontalPadding),
            child: Row(
              children: [
                if (showBackButton)
                  Padding(
                    padding: const EdgeInsets.only(right: 8),
                    child: IconButton(
                      icon: const Icon(
                        Icons.arrow_back_rounded,
                        color: Colors.white,
                        size: 28,
                      ),
                      padding: EdgeInsets.zero,
                      constraints: const BoxConstraints(),
                      onPressed: onBackTap ?? () => Navigator.of(context).maybePop(),
                    ),
                  )
                else
                  Container(
                    width: compact ? 48 : 54,
                    height: compact ? 48 : 54,
                    decoration: BoxDecoration(
                      color: AppColors.orange,
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Icon(
                      Icons.school,
                      color: Colors.white,
                      size: compact ? 26 : 30,
                    ),
                  ),
                const SizedBox(width: 14),
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        'BINARO',
                        maxLines: 1,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: AppColors.orange,
                          fontSize: 16,
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
                          fontSize: compact ? 21 : 24,
                          fontWeight: FontWeight.w800,
                        ),
                      ),
                    ],
                  ),
                ),
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
                        size: compact ? 28 : 32,
                      ),
                      Positioned(
                        right: 1,
                        top: 1,
                        child: Container(
                          width: 10,
                          height: 10,
                          decoration: const BoxDecoration(
                            color: AppColors.orange,
                            shape: BoxShape.circle,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 16),
                GestureDetector(
                  onTap: onAvatarTap ??
                      () {
                        Navigator.pushNamed(context, AppRoutes.profile);
                      },
                  child: const _Avatar(),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _Avatar extends StatelessWidget {
  const _Avatar();

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 50,
      padding: const EdgeInsets.all(2.5),
      decoration: const BoxDecoration(
        color: Colors.white,
        shape: BoxShape.circle,
      ),
      child: ClipOval(
        child: Image.asset(
          'assets/avatar.png',
          fit: BoxFit.cover,
          errorBuilder: (context, error, stackTrace) => Container(
            color: AppColors.lightOrange,
            child: const Icon(Icons.person, color: AppColors.blue, size: 30),
          ),
        ),
      ),
    );
  }
}
