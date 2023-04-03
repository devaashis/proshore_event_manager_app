import 'package:flutter/material.dart';
import 'package:proshore_even_manager_app/provider/events_provider.dart';
import 'package:proshore_even_manager_app/util/k_colors.dart';
import 'package:proshore_even_manager_app/views/event_list_item.dart';
import 'package:proshore_even_manager_app/widgets/text_styles.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final TextEditingController cityNameTextController = TextEditingController();
  late final EventsProvider eventProvider;

  @override
  void initState() {
    eventProvider = Provider.of<EventsProvider>(context, listen: false);
    eventProvider.getEventsByAddress(context);
  }

  @override
  Widget build(BuildContext context) {
    cityNameTextController.text = "Kathmandu";
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(16),
        child: Column(
          children: [
            SizedBox(
              height: 5.h,
            ),
            buildSearchBar(context),
            buildListView(context),
          ],
        ),
      ),
    );
  }

  buildSearchBar(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      child: TextFormField(
        controller: cityNameTextController,
        textAlignVertical: TextAlignVertical.center,
        style: CustomTextStyle.myContentPrimaryTextStyle,
        cursorColor: Colors.grey,
        keyboardType: TextInputType.streetAddress,
        onChanged: (value) {},
        // onFieldSubmitted: (value) {
        //   if (eventProvider.validateFilter(context, value)) {
        //     eventProvider.getEventsByAddress(context, value);
        //   }
        // },
        decoration: InputDecoration(
          filled: true,
          fillColor: AppColors.primaryColor.withOpacity(0.2),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100)),
          border: OutlineInputBorder(
              borderSide: BorderSide.none,
              borderRadius: BorderRadius.circular(100)),
          prefixIcon: const Icon(
            Icons.filter_alt_rounded,
            color: AppColors.primaryColor,
          ),
          suffixIcon: IconButton(
            onPressed: () {
              if (eventProvider.validateFilter(
                  context, cityNameTextController.text)) {
                eventProvider.getEventsByAddress(
                    context, address: cityNameTextController.text);
              }
            },
            icon: const Icon(
              Icons.search_rounded,
              color: AppColors.primaryColor,
            ),
          ),
          hintText: "Filter by City,Start or End date...",
          hintStyle: CustomTextStyle.myContentPrimaryTextStyle,
        ),
      ),
    );
  }

  buildListView(BuildContext context) {
    return Consumer<EventsProvider>(
      builder: (context, provider, child) {
        if (provider.pageStatus == STATUS.loading) {
          return Column(
            children: [
              SizedBox(
                height: 40.h,
              ),
              CircularProgressIndicator(
                color: AppColors.primaryColor,
              ),
            ],
          );
        }
        else if (provider.pageStatus == STATUS.success) {
          return Expanded(
            child: ListView.builder(
                shrinkWrap: true,
                itemCount: provider.filterEvents.length,
                itemBuilder: (context, index) {
                  return EventListItem(provider.filterEvents[index]);
                }),
          );
        }
        return Container();
      },
    );
  }
}
