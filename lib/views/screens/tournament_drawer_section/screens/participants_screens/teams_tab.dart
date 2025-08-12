// ignore_for_file: deprecated_member_use

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../models/team_model.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../widgets/add_team_dialog.dart';

class TeamsTab extends StatefulWidget {
  const TeamsTab({super.key});

  @override
  State<TeamsTab> createState() => _TeamsTabState();
}

class _TeamsTabState extends State<TeamsTab> {
  String? selectedDivision;
  final List<Team> _teams = [];

  void _showAddEditTeamDialog({Team? teamToEdit, int? index}) async {
    final result = await showDialog<Team?>(
      context: context,
      builder: (_) => AddTeamDialog(teamToEdit: teamToEdit),
    );

    if (result != null) {
      setState(() {
        if (index != null) {
          _teams[index] = result;
        } else {
          _teams.add(result);
        }
      });
    }
  }

  void _deleteTeam(int index) {
    setState(() {
      _teams.removeAt(index);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 16.w),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(height: 16.h),
          SizedBox(
            width: 160.w,
            child: CustomDropdownMenu(
              hint: AppStrings.selectDivision,
              options: const [
                AppStrings.division,
                AppStrings.division1,
                AppStrings.division2,
              ],
              selectedValue: selectedDivision,
              onSelected: (val) {
                setState(() {
                  selectedDivision = val;
                });
              },
            ),
          ),
          SizedBox(height: 16.h),
          if (_teams.isEmpty)
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CustomImage(imageSrc: AppIcons.tShirt, size: 60.r),
                  SizedBox(height: 16.h),
                  CustomText(text: AppStrings.noTeamsAddedYet, fontSize: 16.sp),
                  SizedBox(height: 8.h),
                  CustomText(
                    text: AppStrings.addTeamsToThisDivision,
                    fontSize: 16.sp,
                    textAlign: TextAlign.center,
                  ),
                  SizedBox(height: 24.h),
                  SizedBox(
                    width: 170.w,
                    child: CustomButton(
                      onTap: () => _showAddEditTeamDialog(),
                      text: AppStrings.addATeam,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            )
          else
            Expanded(
              child: ListView.builder(
                itemCount: _teams.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final team = _teams[index];
                  return TeamCard(
                    team: team,
                    onEditTeam: () =>
                        _showAddEditTeamDialog(teamToEdit: team, index: index),
                    onDeleteTeam: () => _deleteTeam(index),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}

class TeamCard extends StatelessWidget {
  final Team team;
  final VoidCallback onEditTeam;
  final VoidCallback onDeleteTeam;

  const TeamCard({
    super.key,
    required this.team,
    required this.onEditTeam,
    required this.onDeleteTeam,
  });

  Widget _buildPlayerPill(Player player) {
    return Container(
      margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      // decoration: BoxDecoration(
      //   borderRadius: BorderRadius.circular(6.r),
      //   border: Border.all(color: AppColors.primary),
      // ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          player.photo != null
              ? ClipOval(
                  child: CustomImage(
                    imageFile: player.photo,
                    size: 32.r,
                    fit: BoxFit.cover,
                  ),
                )
              : Icon(Icons.person, size: 32.r, color: AppColors.mediumGray),
          SizedBox(width: 8.w),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: player.name,
                fontSize: 16,
                textAlign: TextAlign.left,
              ),
              CustomText(
                text: player.email,
                fontSize: 12,
                textAlign: TextAlign.left,
              ),
            ],
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final managerPhoto =
        team.players.isNotEmpty && team.players.first.photo != null
        ? team.players.first.photo
        : null;

    return Container(
      margin: EdgeInsets.only(bottom: 16.h),
      // ,decoration: BoxDecoration(
      //             color: AppColors.white,
      //             borderRadius: BorderRadius.circular(8),
      //           ),
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Padding(
        padding: EdgeInsets.all(16.r),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                ClipOval(
                  child: team.teamLogo != null
                      ? CustomImage(
                          imageFile: team.teamLogo,
                          size: 40.r,
                          fit: BoxFit.cover,
                        )
                      : Icon(Icons.image, size: 40.r),
                ),
                SizedBox(width: 16.w),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      CustomText(
                        text: team.teamName,
                        fontSize: 18,
                        fontWeight: FontWeight.w600,
                      ),
                      CustomText(
                        text: team.email,
                        fontSize: 12,
                        fontWeight: FontWeight.w600,
                      ),
                    ],
                  ),
                ),
                IconButton(
                  icon: Icon(Icons.edit, size: 20.r, color: AppColors.black),
                  onPressed: onEditTeam,
                ),
                IconButton(
                  icon: Icon(Icons.delete, size: 20.r, color: AppColors.black),
                  onPressed: onDeleteTeam,
                ),
              ],
            ),
            Divider(color: AppColors.primary, thickness: 1.r, height: 32.h),
            CustomText(
              text: "Manager",
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            Row(
              children: [
                managerPhoto != null
                    ? ClipOval(
                        child: CustomImage(
                          imageFile: managerPhoto,
                          size: 32.r,
                          fit: BoxFit.cover,
                        ),
                      )
                    : Icon(
                        Icons.person,
                        size: 32.r,
                        color: AppColors.mediumGray,
                      ),
                SizedBox(width: 8.w),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    CustomText(
                      text: "Name: ${team.teamManager}",
                      fontSize: 16.sp,
                    ),
                    CustomText(
                      text: "Contact: ${team.managerContact}",
                      fontSize: 12.sp,
                    ),
                  ],
                ),
              ],
            ),

            Divider(color: AppColors.mediumGray, thickness: 1.r, height: 32.h),
            CustomText(
              text: AppStrings.players,
              fontSize: 16.sp,
              fontWeight: FontWeight.w600,
              color: AppColors.black,
            ),
            SizedBox(height: 8.h),
            Wrap(
              children: team.players
                  .map((player) => _buildPlayerPill(player))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
