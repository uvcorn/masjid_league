import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../../utils/app_colors/app_colors.dart';
import '../../../../../utils/app_icons/app_icons.dart';
import '../../../../../utils/app_strings/app_strings.dart';
import '../../../../components/custom_button/custom_button.dart';
import '../../../../components/custom_dropdown_menu/custom_dropdown_menu.dart';
import '../../../../components/custom_image/custom_image.dart';
import '../../../../components/custom_text/custom_text.dart';
import '../../widgets/add_team_dialog.dart';

// Team data model to hold all the team information
class Team {
  String teamName;
  File? teamLogo;
  String email;
  String teamManager;
  String managerContact;
  List<String> players;

  Team({
    required this.teamName,
    this.teamLogo,
    required this.email,
    required this.teamManager,
    required this.managerContact,
    required this.players,
  });
}

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
          // Edit existing team
          _teams[index] = result;
        } else {
          // Add new team
          _teams.add(result);
        }
      });
    }
  }

  // Function to delete a team
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
          // Conditionally render the team list or the "no teams" message
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
            Container(
              decoration: BoxDecoration(
                border: Border.all(color: AppColors.primary, width: 1.5.r),
                borderRadius: BorderRadius.circular(8.r),
              ),
              child: ListView.builder(
                itemCount: _teams.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final team = _teams[index];
                  return Column(
                    children: [
                      Card(
                        margin: EdgeInsets.symmetric(vertical: 8.h),
                        elevation:
                            0, // Remove the shadow by setting elevation to 0
                        color: AppColors.white,
                        child: Padding(
                          padding: EdgeInsets.all(16.r),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Row(
                                children: [
                                  // If the team has a logo, show it, else show the default icon
                                  if (team.teamLogo != null)
                                    ClipOval(
                                      child: Image.file(
                                        team.teamLogo!,
                                        width: 40.r,
                                        height: 40.r,
                                        fit: BoxFit.cover,
                                      ),
                                    )
                                  else
                                    Icon(
                                      Icons.image,
                                      size: 40.r,
                                    ), // Default team icon
                                  SizedBox(width: 16.w),
                                  Expanded(
                                    child: CustomText(
                                      text: team.teamName,
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    icon: Icon(
                                      Icons.edit,
                                      color: AppColors.black,
                                    ),
                                    onPressed: () => _showAddEditTeamDialog(
                                      teamToEdit: team,
                                      index: index,
                                    ),
                                  ),
                                  IconButton(
                                    icon: const Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                    ),
                                    onPressed: () => _deleteTeam(index),
                                  ),
                                ],
                              ),
                              SizedBox(height: 8.h),
                              CustomText(text: 'Manager: ${team.teamManager}'),
                              CustomText(
                                text: 'Contact: ${team.managerContact}',
                              ),
                              CustomText(text: 'Email: ${team.email}'),
                              SizedBox(height: 8.h),
                              CustomText(
                                text: 'Players: ${team.players.join(', ')}',
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Add divider only between cards, not after the last card
                      if (index < _teams.length - 1)
                        Divider(
                          color: AppColors
                              .primary, // Use primary color for the divider
                          thickness: 1,
                          indent: 16.w,
                          endIndent: 16.w,
                        ),
                    ],
                  );
                },
              ),
            ),
          SizedBox(height: 24.h),
          if (_teams.isNotEmpty)
            SizedBox(
              width: double.infinity,
              child: CustomButton(
                onTap: () => _showAddEditTeamDialog(),
                text: AppStrings.addATeam,
                fontSize: 16,
              ),
            ),
        ],
      ),
    );
  }
}
