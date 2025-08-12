import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../utils/app_colors/app_colors.dart';
import '../../../../utils/app_const/app_const.dart';
import '../../../../utils/app_strings/app_strings.dart';
import '../../../components/custom_text/custom_text.dart';
import '../../../components/image_preview_box/image_preview_box.dart';
import '../../../components/image_utils/image_utils.dart';
import '../../../components/custom_network_image/custom_network_image.dart';
import '../models/team_model.dart';
import 'add_player_dialog.dart';

class AddTeamDialog extends StatefulWidget {
  final Team? teamToEdit;
  const AddTeamDialog({super.key, this.teamToEdit});

  @override
  State<AddTeamDialog> createState() => _AddTeamDialogState();
}

class _AddTeamDialogState extends State<AddTeamDialog> {
  File? teamLogo;
  final List<Player> _players = []; // Changed to List<Player>

  final _teamNameCtrl = TextEditingController();
  final _teamTypeCtrl = TextEditingController(); // New controller for teamType
  final _emailCtrl = TextEditingController();
  final _managerCtrl = TextEditingController();
  final _managerContactCtrl = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (widget.teamToEdit != null) {
      final team = widget.teamToEdit!;
      _teamNameCtrl.text = team.teamName;
      teamLogo = team.teamLogo;
      _emailCtrl.text = team.email;
      _managerCtrl.text = team.teamManager;
      _managerContactCtrl.text = team.managerContact;
      _players.addAll(team.players);
    }
  }

  Widget _buildLabeledTextField({
    required String label,
    required TextEditingController controller,
    TextInputType keyboardType = TextInputType.text,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextField(
          controller: controller,
          keyboardType: keyboardType,
          style: const TextStyle(fontSize: 14),
          decoration: InputDecoration(
            hintText: label,
            hintStyle: TextStyle(
              color: AppColors.mediumGray,
              fontSize: 14.sp,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        SizedBox(height: 32.h),
      ],
    );
  }

  Widget _playerPill(Player player, int index) {
    // Changed to accept Player object
    return Container(
      margin: EdgeInsets.only(right: 8.w, bottom: 8.h),
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6.r),
        border: Border.all(color: AppColors.primary),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          CustomText(
            text: player.name, // Display player's name
            fontSize: 12,
            textAlign: TextAlign.left,
          ),
          SizedBox(width: 8.w),
          GestureDetector(
            onTap: () => setState(() => _players.removeAt(index)),
            child: Icon(Icons.close, size: 14.r, color: AppColors.secPrimary),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _teamNameCtrl.dispose();
    _teamTypeCtrl.dispose();
    _emailCtrl.dispose();
    _managerCtrl.dispose();
    _managerContactCtrl.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      backgroundColor: AppColors.white,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12.r)),
      contentPadding: EdgeInsets.all(16.r),
      content: SizedBox(
        width: 360.w,
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              CustomText(
                text: widget.teamToEdit != null
                    ? AppStrings.editTeam
                    : AppStrings.addTeam,
                fontSize: 20,
                fontWeight: FontWeight.w600,
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 24.h),
              _buildLabeledTextField(
                label: AppStrings.teamName,
                controller: _teamNameCtrl,
              ),
              // New field for team type
              // _buildLabeledTextField(
              //   label: 'Team Type',
              //   controller: _teamTypeCtrl,
              // ),
              // Team Logo Picker
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CustomText(
                    text: AppStrings.teamLogo,
                    fontSize: 12,
                    textAlign: TextAlign.left,
                  ),
                  GestureDetector(
                    onTap: () {
                      pickImage((file) {
                        setState(() {
                          teamLogo = file;
                        });
                      });
                    },
                    child: Container(
                      height: 20.h,
                      width: 80.w,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        border: Border.all(color: AppColors.mediumGray),
                        borderRadius: BorderRadius.circular(6.r),
                      ),
                      child: CustomText(
                        textAlign: TextAlign.center,
                        text: AppStrings.chooseFile,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
              if (teamLogo != null) ...[
                SizedBox(height: 8.h),
                ImagePreviewBox(
                  imageFile: teamLogo!,
                  onRemove: () => setState(() => teamLogo = null),
                ),
              ],
              SizedBox(height: 16.h),
              _buildLabeledTextField(
                label: AppStrings.email,
                controller: _emailCtrl,
                keyboardType: TextInputType.emailAddress,
              ),
              Row(
                children: [
                  Expanded(
                    child: _buildLabeledTextField(
                      label: AppStrings.teamManager,
                      controller: _managerCtrl,
                    ),
                  ),
                  SizedBox(width: 16.w),
                  Expanded(
                    child: _buildLabeledTextField(
                      label: AppStrings.managerContact,
                      controller: _managerContactCtrl,
                      keyboardType: TextInputType.phone,
                    ),
                  ),
                ],
              ),
              // Player section
              if (_players.isNotEmpty) ...[
                Wrap(
                  children: List.generate(
                    _players.length,
                    (i) => _playerPill(_players[i], i),
                  ),
                ),
                SizedBox(height: 16.h),
              ],
              SizedBox(
                height: 40.h,
                width: 160.w,
                child: InkWell(
                  onTap: () async {
                    final newPlayer = await showDialog<Player>(
                      // Await a Player object
                      context: context,
                      builder: (_) => const AddPlayerDialog(),
                    );
                    if (newPlayer != null) {
                      setState(() => _players.add(newPlayer));
                    }
                  },
                  child: Container(
                    alignment: Alignment.center,
                    decoration: BoxDecoration(
                      border: Border.all(color: AppColors.mediumGray),
                      borderRadius: BorderRadius.circular(8.0.r),
                    ),
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: AppStrings.addAnotherPlayer,
                      fontSize: 14,
                      color: AppColors.black,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 32.h),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  CustomText(
                    text: AppStrings.teamQrCode,
                    fontSize: 16,
                    textAlign: TextAlign.left,
                  ),
                  const Spacer(),
                  CustomNetworkImage(imageUrl: AppConstants.qrCode, size: 64),
                ],
              ),
              SizedBox(height: 32.h),
              Row(
                children: [
                  const Spacer(),
                  GestureDetector(
                    onTap: () => Navigator.of(context).pop(),
                    child: CustomText(
                      text: AppStrings.cancel,
                      fontSize: 16,
                      color: AppColors.secPrimary,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(width: 24.w),
                  ElevatedButton(
                    onPressed: () {
                      final newTeam = Team(
                        teamName: _teamNameCtrl.text,
                        teamLogo: teamLogo,
                        email: _emailCtrl.text,
                        teamManager: _managerCtrl.text,
                        managerContact: _managerContactCtrl.text,
                        players: _players, // This is now a List<Player>
                      );
                      Navigator.of(context).pop(newTeam);
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.primary,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8.0.r),
                      ),
                      minimumSize: Size(80.w, 40.h),
                    ),
                    child: CustomText(
                      textAlign: TextAlign.center,
                      text: widget.teamToEdit != null
                          ? 'Update'
                          : AppStrings.add,
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                      color: AppColors.white,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
