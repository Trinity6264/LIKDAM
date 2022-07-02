import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../constant/color_pallet.dart';

class AnimatedHorizontalCalendar extends StatefulWidget {
  final DateTime? initialDate;
  final ValueChanged<DateTime> onChanged;

  const AnimatedHorizontalCalendar({
    Key? key,
    this.initialDate,
    required this.onChanged,
  }) : super(key: key);

  @override
  _CalendarState createState() => _CalendarState();
}

class _CalendarState extends State<AnimatedHorizontalCalendar> {
  DateTime? _startDate;
  DateTime? selectedCalenderDate;
  final ScrollController _scrollController = ScrollController();

  calenderAnimation() {
    _scrollController.animateTo(
      _scrollController.position.maxScrollExtent,
      duration: const Duration(seconds: 1),
      curve: Curves.easeInOut,
    );
  }

  @override
  void dispose() {
    super.dispose();
    _scrollController.dispose();
  }

  @override
  void initState() {
    super.initState();
    selectedCalenderDate = DateTime.now();
  }

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    DateTime findFirstDateOfTheWeek(DateTime dateTime) {
      if (dateTime.weekday == 7) {
        if (_scrollController.hasClients) {
          calenderAnimation();
        }
        return dateTime;
      } else {
        if (dateTime.weekday == 1 || dateTime.weekday == 2) {
          if (_scrollController.hasClients) {
            calenderAnimation();
          }
        }
        return dateTime.subtract(Duration(days: dateTime.weekday));
      }
    }

    _startDate = findFirstDateOfTheWeek(selectedCalenderDate!);

    return SingleChildScrollView(
      controller: _scrollController,
      scrollDirection: Axis.horizontal,
      reverse: true,
      child: SizedBox(
        child: Row(
          children: <Widget>[
            ListView.builder(
              itemCount: 10,
              shrinkWrap: true,
              scrollDirection: Axis.horizontal,
              physics: const NeverScrollableScrollPhysics(),
              itemBuilder: (context, index) {
                DateTime? date = _startDate?.add(Duration(days: index));
                int? diffDays = date?.difference(selectedCalenderDate!).inDays;
                return AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  width: (width - 10) * 0.13,
                  margin: const EdgeInsets.symmetric(horizontal: 5),
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: diffDays != 0 ? whiteColor : primaryColor,
                  ),
                  child: TextButton(
                    onPressed: () {
                      // widget.onDateSelected!(Utils.getDate(_date!));
                      widget.onChanged(date!);
                      setState(() {
                        selectedCalenderDate =
                            _startDate?.add(Duration(days: index));
                        _startDate = _startDate?.add(Duration(days: index));
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          Utils.getDayOfWeek(date!),
                          style: TextStyle(
                            color: diffDays != 0 ? blackColor : whiteBgColor,
                            fontSize: 12.0,
                          ),
                        ),
                        const SizedBox(height: 2.0),
                        Text(
                          Utils.getDayOfMonth(date),
                          style: TextStyle(
                            color: diffDays != 0 ? blackColor : whiteBgColor,
                            fontSize: 20.0,
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              },
            ),
            const SizedBox(width: 10),
            SizedBox(
              child: InkWell(
                onTap: () async {
                  DateTime? date = await selectDate();
                  // widget.onDateSelected!(Utils.getDate(date!));
                  widget.onChanged(date!);
                  setState(() => selectedCalenderDate = date);
                },
                child: AnimatedContainer(
                  duration: const Duration(milliseconds: 300),
                  height: double.infinity,
                  width: (width - 10) * 0.13,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(8.0),
                    color: whiteColor,
                  ),
                  child: const Icon(Icons.calendar_today),
                ),
              ),
            ),
            const SizedBox(width: 15)
          ],
        ),
      ),
    );
  }

  Future<DateTime?> selectDate() async {
    return await showDatePicker(
      context: context,
      initialDatePickerMode: DatePickerMode.day,
      initialDate: selectedCalenderDate!,
      firstDate: DateTime.now(),
      lastDate: DateTime(DateTime.now().year + 1),
    );
  }
}

class Utils {
  static String getDayOfWeek(DateTime date) => DateFormat('EEE').format(date);

  static String getDayOfMonth(DateTime date) => DateFormat('dd').format(date);

  static String getDate(DateTime date) => DateFormat('yyyy-MM-dd').format(date);
}
