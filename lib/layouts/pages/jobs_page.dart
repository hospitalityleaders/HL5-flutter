import 'package:flutter/material.dart';
import 'package:holedo/models/holedoapi/job.dart';
import 'package:holedo/models/models.dart';
import 'package:holedo/layouts/page_scaffold.dart';

class JobsPage extends StatelessWidget {
  final String? id;
  final String? slug;
  const JobsPage({Key? key, this.id, this.slug}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final JobsController controller = Get.put(JobsController());
    return PageScaffold(
        title: "Job Content",
        body: FutureBuilder(
            future: controller.getJob(slug: slug),
            builder: (context, AsyncSnapshot<Job> snapshot) {
              if (!snapshot.hasData) {
                return Center(
                  child: CircularProgressIndicator(),
                );
              } else
                return ListView.builder(
                  itemCount: 1,
                  itemBuilder: (BuildContext context, index) => Card(
                    margin: const EdgeInsets.all(10),
                    child: ListTile(
                      contentPadding: const EdgeInsets.all(10),
                      title: Text(snapshot.data!.title.toString()),
                      subtitle: Text(snapshot.data!.companyName.toString()),
                    ),
                  ),
                );
            }));
  }
}
