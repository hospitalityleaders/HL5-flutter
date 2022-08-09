import 'package:flutter/material.dart';
import 'package:holedo/jobs/presentation/providers/jobs_provider.dart';
import 'package:holedo/jobs/presentation/ui/components/company_jobs_tabbar.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';
import 'package:holedo/profile/presentation/ui/components/container_with_icon.dart';
import 'package:holedo/profile/presentation/ui/components/custom_elevated_button.dart';
import 'package:holedo/profile/presentation/utill/color_resources.dart';
import 'package:holedo/profile/presentation/utill/dimensions.dart';
import 'package:holedo/profile/presentation/utill/styles.dart';

class JobsPage extends StatefulWidget {
  final String? id;
  final String? slug;
  const JobsPage({Key? key, this.id, this.slug}) : super(key: key);

  @override
  State<JobsPage> createState() => _JobsPageState();
}

class _JobsPageState extends State<JobsPage> with TickerProviderStateMixin {
  late TabController _tabController = TabController(length: 2, vsync: this);

  void _updateTabController() {
    setState(() {
      _tabController.index = Provider.of<JobsProvider>(context).currentTabIndex;
    });
  }

  @override
  void didChangeDependencies() {
    _updateTabController();
    super.didChangeDependencies();
  }

  void changeCurrentIndex(int newIndex) {
    _tabController.animateTo(newIndex);
    Provider.of<JobsProvider>(context, listen: false)
        .changeCurrentTabIndex(newIndex);
  }

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    // final appState = Provider.of<AppProvider>(context, listen: false);
    final jobsProvider = Provider.of<JobsProvider>(context, listen: false);
    // final JobsController controller = Get.put(JobsController());
    final currentTabIndex = jobsProvider.currentTabIndex;

    return PageScaffold(
        title: "Company page jobs",
        body: DecoratedBox(
          decoration: BoxDecoration(color: Cr.whiteColor),
          child: ListView(
            children: [
              // Container(
              //   height: 540,
              //   width: Di.getScreenSize(context).width,
              //   color: Cr.accentBlue1,
              // ),
              CompanyJobsTabbar(
                onTap: changeCurrentIndex,
                tabController: _tabController,
              ),
              [
                Container(
                  padding: EdgeInsets.symmetric(
                    vertical: Di.PSL,
                    horizontal: 70,
                  ),
                  child: Column(
                    children: [
                      Row(
                        children: [
                          ContainerWithIcon(
                            size: 100,
                            iconData: Icons.search,
                          ),
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: Di.PSOL),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Job search",
                                  style: h5Bold,
                                ),
                                Row(
                                  children: [
                                    // SizedBox(
                                    //   width: double.infinity,
                                    //   child: DialogTextFieldForm(),
                                    // ),
                                    CustomElevatedButton(
                                      text: "Search",
                                      onPressed: () {},
                                    ),
                                  ],
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        width: 265,
                        child: Column(
                          children: [
                            Stack(
                              children: [
                                Container(
                                  height: 145,
                                  color: Cr.accentBlue1,
                                ),
                                Positioned(
                                  left: 20,
                                  bottom: 14,
                                  child: Container(
                                    height: 70,
                                    width: 70,
                                    color: Cr.accentBlue1,
                                  ),
                                ),
                              ],
                            ),
                            Di.SBCH(34),
                            Column(
                              children: [
                                Text(
                                  "Guest services manager",
                                  style: h4Bold,
                                ),
                                Text(
                                  "Twenty Five Hours Hotels · Berlin",
                                  style: bodySmallRegular.copyWith(
                                    color: Cr.accentBlue1,
                                  ),
                                ),
                                Text(
                                  "Berlin, Germany",
                                  style: bodySmallRegular.copyWith(
                                    color: Cr.darkGrey1,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text("Media"),
              ][currentTabIndex],
            ],
          ),
        ));
  }
}
