import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

import '../../../../core/shared/widgets/habit_item.dart';

class HabitsView extends StatefulWidget {
  const HabitsView({super.key});

  @override
  State<HabitsView> createState() => _HabitsViewState();
}

class _HabitsViewState extends State<HabitsView> {

  List<String> userHabits = ["Meditating", "Read Philosophy", "Journaling"];
  final Map<String, bool> habitStates = {};
  int selectedDateIndex = 0;

  @override
  void initState() {
    super.initState();
    for (var habit in userHabits) {
      habitStates[habit] = false;
    }
  }
  String _getMonthAbbreviation(int month) {
    const months = ['Jan', 'Feb', 'Mar', 'Apr', 'May', 'Jun',
      'Jul', 'Aug', 'Sep', 'Oct', 'Nov', 'Dec'];
    return months[month - 1];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: HexColor('#FCFCFF'),
      appBar: AppBar(
        backgroundColor: HexColor('#FCFCFF'),
        elevation: 0,
        title: Text(
          'Your habits',
          style: TextStyle(
            fontSize: 24.0,
            color: HexColor('#2F2F2F'),
            fontWeight: FontWeight.bold,
          ),
        ),
      ),
      body: Column(
        children: [

          Container(
              height: 66,
              margin: const EdgeInsets.symmetric(vertical: 16),

              child: ListView.separated(
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                padding: const EdgeInsets.symmetric(horizontal: 16),
                itemCount: 7,
                separatorBuilder: (context, index) => const SizedBox(width: 12),
                itemBuilder: (context, index) {
                  final now = DateTime.now();
                  final date = now.add(Duration(days: index));
                  final isSelected = index == selectedDateIndex;
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedDateIndex = index;
                      });
                    },
                    child: Container(
                        width: 59,
                        decoration: BoxDecoration(
                          color: isSelected ? HexColor('#3843FF').withValues(alpha: 0.1) : Colors.white,
                          borderRadius: BorderRadius.circular(4),
                          border: Border.all(
                            color: isSelected ? HexColor('#3843FF') : HexColor('#DDDDDD'),
                            width: 1.5, //??????  // Thin border
                          ),
                          boxShadow: [
                            BoxShadow( //??????
                              color: Colors.black.withValues(alpha: 0.05),
                              blurRadius: 10,
                              offset: const Offset(0, 2),
                            ),
                          ],
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            // Fixed: Proper text styling for day number
                            Text(
                              date.day.toString(),
                              style: TextStyle(
                                fontSize: 21,
                                fontWeight: FontWeight.bold,
                                color: isSelected ? HexColor('#3843FF') : HexColor('#2F2F2F'),
                              ),
                            ),
                            const SizedBox(height: 4),
                            // Fixed: Proper text styling for month abbreviation
                            Text(
                              _getMonthAbbreviation(date.month),
                              style: TextStyle(
                                fontSize: 14,
                                color:  isSelected ? HexColor('#3843FF') : HexColor('#2F2F2F'),
                              ),
                            )
                          ], )
                    ),
                  );
                },
              ) ),

          SizedBox(height: 20,),


          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Container(
                  width: double.infinity,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12.0)
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(14.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text('Today Habit',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 21.0,
                                  color: HexColor('2F2F2F')
                              ),
                            ),
                          ],
                        ),
                      ),
                      ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.all(10.0),
                        itemBuilder: (context, index) {
                          final habit = userHabits[index];
                          return HabitItem(
                            width: double.infinity,
                            height: 58,
                            background: HexColor('#FBFBFB'),
                            text: userHabits[index],
                            style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.bold,
                                color: HexColor('#3843FF')
                            ),
                            isChecked: habitStates[habit] ?? false,
                            onChecked: (bool? checked) {
                              setState(() {
                                habitStates[habit] = checked ?? false;
                              });
                            },
                            iconSize: 20.0,
                            iconColor: HexColor('#666666'),
                            onPressed: () {},
                            borderColor: HexColor('#3843FF').withValues(alpha: 0.1),
                            borderWidth: 0.1,
                            checkboxSize: 30.0,
                            checkColor: Colors.white,
                          );
                        },
                        separatorBuilder: (context, index) => const SizedBox(height: 10.0),
                        itemCount: userHabits.length,
                      ),
                      const SizedBox(height: 16.0),
                    ],
                  ),
                ),
              ),
            ),
          ),


        ],

      ),
    );
  }
}
