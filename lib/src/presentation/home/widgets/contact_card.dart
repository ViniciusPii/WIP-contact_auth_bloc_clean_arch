import 'package:contact_auth_bloc/src/core/theme/app_styles.dart';
import 'package:contact_auth_bloc/src/core/theme/infra/app_colors.dart';
import 'package:contact_auth_bloc/src/core/theme/infra/app_dimension.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_label.dart';
import 'package:contact_auth_bloc/src/core/ui/components/app_title.dart';
import 'package:contact_auth_bloc/src/domain/entities/contact_entity.dart';
import 'package:flutter/material.dart';

class ContactCard extends StatelessWidget {
  const ContactCard({
    super.key,
    required this.contact,
    required this.deleteAction,
  });

  final ContactEntity contact;
  final Function() deleteAction;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: AppDimension.medium,
      ),
      child: Row(
        children: [
          CircleAvatar(
            backgroundColor: AppStyles.primary,
            child: AppTitle(
              title: contact.name.substring(0, 1),
              color: AppColors.white,
            ),
          ),
          const SizedBox(
            width: AppDimension.large,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                AppTitle(
                  title: contact.name,
                  type: TitleType.medium,
                ),
                AppLabel(
                  isCenter: false,
                  type: LabelType.medium,
                  label: contact.phoneNumber,
                ),
              ],
            ),
          ),
          Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              IconButton(
                // TODO implementar
                onPressed: () {},
                icon: const Icon(
                  Icons.edit_note,
                ),
              ),
              IconButton(
                onPressed: deleteAction,
                icon: const Icon(
                  Icons.delete_outlined,
                  color: AppColors.red,
                ),
              )
            ],
          ),
        ],
      ),
    );
  }
}
