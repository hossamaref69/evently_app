import 'package:evently_app/core/constants/event_categories.dart';
import 'package:evently_app/core/extensions/padding_ext.dart';
import 'package:evently_app/core/extensions/size_ext.dart';
import 'package:evently_app/core/theme/app_colors.dart';
import 'package:evently_app/core/widgets/custom_text_form_field.dart';
import 'package:evently_app/models/EventDM.dart';
import 'package:evently_app/ui/create_event/tab_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';

import '../../firebase_helper/firestore/firestore_helper.dart';

class CreateEventScreen extends StatefulWidget {
  const CreateEventScreen({super.key});

  @override
  State<CreateEventScreen> createState() => _CreateEventScreenState();
}

class _CreateEventScreenState extends State<CreateEventScreen> {
  final GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final _titleController = TextEditingController();
  final _descriptionController = TextEditingController();

  int selectedTap = 0;
  DateTime? selectedDate;
  TimeOfDay? selectedTime;

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);

    return Scaffold(
      appBar: AppBar(
        title: const Text("Create new event"),
      ),
      body: SingleChildScrollView(
        physics: const ClampingScrollPhysics(),
        child: Form(
          key: formKey,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                width: 1.0.width,
                height: 0.26.height,
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16.0),
                  child: Image.asset(
                    EventCategories
                        .eventCategories[selectedTap].eventCategoryImg,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              const SizedBox(height: 10),
              DefaultTabController(
                length: 8,
                child: TabBar(
                    isScrollable: true,
                    tabAlignment: TabAlignment.start,
                    indicatorPadding: EdgeInsets.zero,
                    labelPadding: const EdgeInsets.symmetric(horizontal: 6.0),
                    padding:
                        const EdgeInsets.symmetric(vertical: 10, horizontal: 0),
                    indicator: const BoxDecoration(),
                    onTap: (value) {
                      setState(() {
                        selectedTap = value;
                      });
                    },
                    tabs: EventCategories.eventCategories.map(
                      (element) {
                        return TabWidget(
                          isInHomeTab: false,
                          eventCategory: element,
                          isSelected: selectedTap ==
                              EventCategories.eventCategories.indexOf(element),
                        );
                      },
                    ).toList()),
              ),
              const SizedBox(height: 10),
              Text(
                "Title",
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _titleController,
                hint: "Event Title",
                hintColor: AppColors.grey,
                prefixIcon: const Icon(
                  Icons.edit_note_outlined,
                  color: AppColors.grey,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                "Description",
                style: theme.textTheme.titleMedium,
              ),
              const SizedBox(height: 8),
              CustomTextField(
                controller: _descriptionController,
                hint: "Event Description",
                hintColor: AppColors.grey,
                maxLines: 4,
              ),
              const SizedBox(height: 20),
              Row(
                children: [
                  const Icon(Icons.calendar_month),
                  const SizedBox(width: 10),
                  Text(
                    "Event Date",
                    style: theme.textTheme.titleMedium,
                  ),
                  const Spacer(),
                  GestureDetector(
                    onTap: () {
                      selectEventDate(context);
                    },
                    child: Text(
                      selectedDate != null
                          ? DateFormat("dd MMM yyy").format(selectedDate!)
                          : "Choose Date",
                      style: theme.textTheme.titleMedium?.copyWith(
                          color: AppColors.purpleColor,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 20),
              Text(
                "Location",
                style: theme.textTheme.titleMedium?.copyWith(),
              ),
              const SizedBox(height: 8),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 12),
                    elevation: 0,
                    backgroundColor: Colors.transparent,
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16.0),
                    ),
                    side: const BorderSide(color: AppColors.purpleColor)),
                child: Row(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(
                          color: AppColors.purpleColor,
                          borderRadius: BorderRadius.circular(8.0)),
                      child: const Icon(
                        Icons.my_location_outlined,
                        color: AppColors.whiteColor,
                      ),
                    ),
                    const SizedBox(width: 10),
                    Text(
                      "Choose Event Location",
                      style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: AppColors.purpleColor),
                    ),
                    const Spacer(),
                    const Icon(
                      Icons.arrow_forward_ios_rounded,
                      color: AppColors.purpleColor,
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 20),
              ElevatedButton(
                  onPressed: () {
                    if (formKey.currentState!.validate()) {
                      if (selectedDate != null) {
                        EventDM event = EventDM(
                          title: _titleController.text,
                          description: _descriptionController.text,
                          image:
                          EventCategories.eventCategories[selectedTap].eventCategoryImg,
                          date: selectedDate!,
                          category:
                          EventCategories.eventCategories[selectedTap].eventCategoryName,
                        );
                        try{
                          FirestoreHelper.addEvent(event);
                          EasyLoading.showSuccess("Event added successfully");
                          Navigator.pop(context);
                        }catch(e){
                          EasyLoading.showError("error");
                        }
                      } else {
                       EasyLoading.showInfo("you must select event date");
                      }
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 8, vertical: 12),
                      elevation: 0,
                      backgroundColor: AppColors.purpleColor,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(16.0),
                      ),
                      side: const BorderSide(color: AppColors.purpleColor)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Add Event",
                        style: theme.textTheme.titleMedium?.copyWith(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: AppColors.whiteColor,
                        ),
                      ),
                    ],
                  )),
              const SizedBox(height: 20),
            ],
          ).setHorizontalPadding(context, 0.04),
        ),
      ),
    );
  }

  void selectEventDate(BuildContext context) async {
    DateTime? newDate = await showDatePicker(
      context: context,
      firstDate: DateTime.now(),
      lastDate: DateTime.now().add(
        const Duration(days: 365),
      ),
    );

    if (newDate != null) {
      setState(() {
        selectedDate = newDate;
      });
      print(selectedDate);
    }
  }

  void selectEventTime(BuildContext context) async {
    TimeOfDay? newTime = await showTimePicker(
      context: context,
      initialTime: TimeOfDay.now(),
    );

    if (newTime != null) {
      setState(() {
        selectedTime = newTime;
      });
      print(selectedTime);
    }
  }
}
