import 'dart:developer';
import 'dart:io';
import 'package:GrandPolicy/model/document_model/document_model.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';
import '../../controller/exuse_during_duty_controller/excuse_during_duty_controller.dart';
import 'package:flutter_gen/gen_l10n/app_localizations.dart';

class ExcuseDocument extends StatelessWidget {
  final excuseController = Get.put(ExcuseDuringDutyController());

  ExcuseDocument({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var language = AppLocalizations.of(context);

    return GetX<ExcuseDuringDutyController>(builder: (controller) {
      return Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            InkWell(
              onTap: () {
                pickFiles(controller.fileType.value);
              },
              child: Container(
                width: double.infinity,
                height: 50,
                padding: const EdgeInsets.only(left: 4, right: 4),
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(4.0)),
                  border: Border.all(
                    color: kBorderColorTextField,
                    width: 1,
                  ),
                ),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        language!.uploadDocuments,
                      ),
                      IconButton(
                          onPressed: () {},
                          icon: const Icon(Icons.upload_file,
                              color: kGreyTextColor))
                    ]),
              ),
            ),
            controller.result.isNotEmpty
                ? Column(
                    children: [
                      const SizedBox(
                        height: 20.0,
                      ),
                      SingleChildScrollView(
                        child: SizedBox(
                          child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: controller.result[0].files.length,
                              itemBuilder: (context, index) {
                                final file = controller.result[0].files[index];
                                log("++++++++++++++++++++++++$file");

                                return buildFile(file);
                              }),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 290),
                        child: TextButton(
                          onPressed: () {
                            controller.files.clear();
                            controller.result.clear();
                          },
                          child: const Text("clear"),
                        ),
                      ),
                    ],
                  )
                : Container()
          ],
        ),
      );
    });
  }

  //?----------------------------------------------------------------------- buildFiles ---------------
  Widget buildFile(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return InkWell(
      onTap: () => {excuseController.viewFile(file)},
      child: ListTile(
        leading: (file.extension == 'jpg' || file.extension == 'png')
            ? Image.file(
                File(file.path.toString()),
                width: 80,
                height: 80,
              )
            : (file.extension == 'pdf')
                ? const SizedBox(
                    child: FaIcon(
                      FontAwesomeIcons.filePdf,
                      color: Color(0xff18A0FB),
                    ),
                  )
                : (file.extension == 'doc' || file.extension == 'docx')
                    ? const SizedBox(
                        child: FaIcon(
                          FontAwesomeIcons.fileWord,
                          color: Color(0xff18A0FB),
                        ),
                      )
                    : (file.extension == 'xls' || file.extension == 'xlsx')
                        ? const SizedBox(
                            child: FaIcon(FontAwesomeIcons.fileExcel,
                                color: Color(0xff18A0FB)),
                          )
                        : (file.extension == 'zip' || file.extension == 'rar')
                            ? const SizedBox(
                                child: FaIcon(FontAwesomeIcons.fileArchive,
                                    color: Color(0xff18A0FB)),
                              )
                            : const SizedBox(
                                child: FaIcon(FontAwesomeIcons.fileAlt,
                                    color: Color(0xff18A0FB)),
                              ),
        title: Text(file.name),
        subtitle: Text('${file.extension}'),
        trailing: Text(
          size,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
      ),
    );
  }

  Widget fileDetails(PlatformFile file) {
    final kb = file.size / 1024;
    final mb = kb / 1024;
    final size = (mb >= 1)
        ? '${mb.toStringAsFixed(2)} MB'
        : '${kb.toStringAsFixed(2)} KB';
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text('File Name: ${file.name}'),
          Text('File Size: $size'),
        ],
      ),
    );
  }

  void pickFiles(String? filetype) async {
    if (excuseController.result.isNotEmpty) {
      excuseController.result[0] =
          (await FilePicker.platform.pickFiles(allowMultiple: true))!;
    } else {
      excuseController.result
          .add((await FilePicker.platform.pickFiles(allowMultiple: true))!);
    }

    excuseController.files.value =
        excuseController.result[0].files.cast<DocumentModel>();
    if (excuseController.result == null) return;

    ListView.builder(
        itemCount: excuseController.result[0].files.length,
        itemBuilder: (context, index) {
          final file = excuseController.result[0].files[index];
          log("++++++++++++++++++++++++$file");

          return buildFile(file);
        });
  }

  // open the picked file
  void viewFile(PlatformFile file) {
    OpenFile.open(file.path.toString());
  }
}
