import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HabitItem extends StatelessWidget {
  final double? width;
  final double? height;
  final Color background;
  final String text;
  final TextStyle style;

  final bool isChecked;
  final Function(bool?) onChecked;

  final Icon icon;
  final double iconSize;
  final Color iconColor;
  final Function() onPressed;

  final Color checkColor;
  final Color? fillColor;
  final Color borderColor;
  final double? borderWidth;
  final double checkboxSize;


  final Function()? onEdit;
  final Function()? onDelete;


  const HabitItem({super.key,
    this.width,
    this.height,
    required this.background,
    required this.text,
    required this.style,
    this.isChecked=false,
    required this.onChecked,
    this.icon=const Icon(Icons.more_vert),
    required this.iconSize,
    required this.iconColor,
    required this.onPressed,
    required this.borderColor,

    this.borderWidth,
    this.fillColor, required this.checkboxSize,
    required this.checkColor, this.onEdit, this.onDelete,

  });

  @override

  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.0),
        color:isChecked ? HexColor('#3843FF').withValues(alpha: 0.1) : background,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(text,
              style: style,
            ),
          ),
          Spacer(),
          Row(
            children: [
              Transform.scale(
                scale: 1.5,
                child: Checkbox(value: isChecked,
                  onChanged: onChecked,
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                    side: BorderSide(color: borderColor, width: borderWidth??0.1),
                  ),
                  activeColor:HexColor('#3843FF'),
                  checkColor: checkColor ,),
              ),
              SizedBox(width: 2.0,),
              PopupMenuButton(
                icon: Icon( Icons.more_vert,
                    size: iconSize,
                    color: iconColor),
                color: Colors.white,
                onSelected: (value) {
                  if (value == 'edit' && onEdit != null) {
                    onEdit!();
                  } else if (value == 'delete' && onDelete != null) {
                    onDelete!();
                  }
                },
                itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
                  PopupMenuItem<String>(
                    value: 'edit',
                    child: Text('Edit', style: TextStyle(
                      color: HexColor('#838383'),
                    ),),),
                  PopupMenuItem<String>(
                    value: 'delete',
                    child:Text('Delete', style: TextStyle(
                      color: HexColor('#838383'),) ,
                    ),
                  ),],)
            ],
          ),


        ],
      ),
    );
  }
}
