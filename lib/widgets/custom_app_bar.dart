import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../core/app_colors.dart';
import '../core/app_routes.dart';
import '../data/app_state.dart';

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
  });

  @override
  Size get preferredSize => const Size.fromHeight(60);

  @override
  Widget build(BuildContext context) {
    final appState = AppState();

    return Container(
      color: AppColors.primaryNavy,
      child: SafeArea(
        bottom: false,
        child: Container(
          height: 60,
          padding: const EdgeInsets.symmetric(horizontal: 14),
          child: Row(
            children: [
              // Leading Back button or Logo Icon
              if (showBackButton)
                IconButton(
                  icon: const Icon(Icons.arrow_back_rounded, color: Colors.white, size: 24),
                  padding: EdgeInsets.zero,
                  constraints: const BoxConstraints(),
                  onPressed: onBackTap ?? () => Navigator.of(context).maybePop(),
                )
              else if (leadingIcon != null)
                leadingIcon!
              else if (showSubBrand)
                Container(
                  width: 38,
                  height: 38,
                  margin: const EdgeInsets.only(right: 10),
                  decoration: BoxDecoration(
                    color: AppColors.accentOrange,
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: const Icon(Icons.school_rounded, color: Colors.white, size: 22),
                ),

              if (showBackButton && leadingIcon != null) ...[
                const SizedBox(width: 8),
                leadingIcon!,
              ],

              const SizedBox(width: 10),

              // Title Section
              Expanded(
                child: titleWidget ??
                    Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        if (showSubBrand)
                          Text(
                            'BINARO',
                            style: GoogleFonts.plusJakartaSans(
                              fontSize: 10,
                              fontWeight: FontWeight.w800,
                              color: AppColors.accentGold,
                              letterSpacing: 0.5,
                            ),
                          ),
                        Text(
                          title,
                          style: GoogleFonts.plusJakartaSans(
                            fontSize: 17,
                            fontWeight: FontWeight.w700,
                            color: Colors.white,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ],
                    ),
              ),

              // Bell Notification Icon with red/yellow dot
              if (showNotifications)
                AnimatedBuilder(
                  animation: appState,
                  builder: (context, _) {
                    final unread = appState.unreadHomeworkCount;
                    return InkWell(
                      borderRadius: BorderRadius.circular(20),
                      onTap: () {
                        Navigator.pushNamed(context, AppRoutes.homeworkNotifications);
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(6),
                        child: Stack(
                          clipBehavior: Clip.none,
                          children: [
                            const Icon(
                              Icons.notifications_none_rounded,
                              color: Colors.white,
                              size: 24,
                            ),
                            if (unread > 0)
                              Positioned(
                                right: 1,
                                top: 1,
                                child: Container(
                                  width: 9,
                                  height: 9,
                                  decoration: const BoxDecoration(
                                    color: AppColors.accentOrange,
                                    shape: BoxShape.circle,
                                  ),
                                ),
                              ),
                          ],
                        ),
                      ),
                    );
                  },
                ),

              const SizedBox(width: 8),

              // Student Avatar
              if (showAvatar)
                Container(
                  width: 36,
                  height: 36,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white.withValues(alpha: 0.8), width: 1.5),
                    color: const Color(0xFFFDE68A),
                  ),
                  child: ClipOval(
                    child: Container(
                      color: const Color(0xFFFFFBEB),
                      child: Stack(
                        alignment: Alignment.center,
                        children: [
                          Positioned(
                            top: 4,
                            child: Container(
                              width: 18,
                              height: 18,
                              decoration: const BoxDecoration(
                                color: Color(0xFF8B5A2B), // hair
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 8,
                            child: Container(
                              width: 16,
                              height: 16,
                              decoration: const BoxDecoration(
                                color: Color(0xFFFFD1A4), // face
                                shape: BoxShape.circle,
                              ),
                            ),
                          ),
                          Positioned(
                            bottom: -4,
                            child: Container(
                              width: 24,
                              height: 14,
                              decoration: BoxDecoration(
                                color: AppColors.primaryNavy, // uniform
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
            ],
          ),
        ),
      ),
    );
  }
}
