import 'package:flutter/material.dart';
import 'package:foodme_backend/config/responsive.dart';
import 'package:foodme_backend/models/model.dart';

class OpenigHoursSettings extends StatelessWidget {
  final OpeningHours openingHours;
  final Function(bool?)? onCheckBoxChanged;
  final Function(RangeValues)? onSliderChanged;

  const OpenigHoursSettings({
    Key? key,
    required this.openingHours,
    required this.onCheckBoxChanged,
    required this.onSliderChanged,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double height = Responsive.isMobile(context) ? 110 : 55;
    EdgeInsets padding = Responsive.isMobile(context)
        ? const EdgeInsets.all(10)
        : const EdgeInsets.all(20);
    return Container(
      height: height,
      width: double.infinity,
      margin: const EdgeInsets.only(bottom: 10),
      padding: padding,
      color: Theme.of(context).backgroundColor,
      child: Responsive.isMobile(context)
          ? Column(
              children: [
                Row(
                  children: [
                    _buildCheckBox(context),
                    const SizedBox(width: 10),
                    _buildText(context),
                  ],
                ),
                const SizedBox(height: 10),
                Expanded(child: _buildSlider(context)),
              ],
            )
          : Row(
              children: [
                _buildCheckBox(context),
                const SizedBox(width: 10),
                Expanded(child: _buildSlider(context)),
                const SizedBox(width: 10),
                _buildText(context),
              ],
            ),
    );
  }

  Row _buildCheckBox(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: openingHours.isOpen,
          onChanged: onCheckBoxChanged,
          activeColor: Theme.of(context).primaryColor,
          fillColor: MaterialStateProperty.all(
            Theme.of(context).primaryColor,
          ),
        ),
        const SizedBox(width: 10),
        SizedBox(
          width: 100,
          child: Text(
            openingHours.day,
            style: Theme.of(context).textTheme.headline5,
          ),
        )
      ],
    );
  }

  RangeSlider _buildSlider(BuildContext context) {
    return RangeSlider(
      activeColor: Theme.of(context).primaryColor,
      inactiveColor: Colors.grey,
      divisions: 24,
      values: RangeValues(
        openingHours.openAt,
        openingHours.closeAt,
      ),
      min: 0,
      max: 24,
      onChanged: onSliderChanged,
    );
  }

  SizedBox _buildText(BuildContext context) {
    return SizedBox(
      width: 160,
      child: openingHours.isOpen
          ? Text(
              'Abierto desde ${openingHours.openAt} hasta ${openingHours.closeAt}',
              style: Theme.of(context).textTheme.headline5,
            )
          : Text(
              'Cerrado los ${openingHours.day}',
              style: Theme.of(context).textTheme.headline5,
            ),
    );
  }
}
