import 'package:GrandPolicy/controller/document_controller/document_controller.dart';
import 'package:GrandPolicy/value/loading.dart';
import 'package:GrandPolicy/value/style.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';
import 'package:open_file/open_file.dart';

import '../../Widget/common_widget/Empty_data_widget.dart';
import '../../Widget/common_widget/internet_check_connection.dart';
import '../../Widget/common_widget/shimmer_widget.dart';
import '../../controller/document_controller/base_controller.dart';
import '../../controller/internet_connection/connectivity_controller.dart';

// ignore: use_key_in_widget_constructors
class DocumentScreen extends StatelessWidget {
  final documentController = Get.put(DocumentController());
  late ConnectivityController connectivityController =
      Get.put(ConnectivityController());
  String path = "";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: kMainColor,
        appBar: AppBar(
          backgroundColor: kMainColor,
          elevation: 0.0,
          titleSpacing: 0.0,
          iconTheme: const IconThemeData(color: Colors.white),
          title: Text(
            'Document',
            maxLines: 2,
            style: kTextStyle.copyWith(
                color: Colors.white, fontWeight: FontWeight.bold),
          ),
        ),
        body: SingleChildScrollView(
            child: Container(
          width: MediaQuery.of(context).size.width,
          height: MediaQuery.of(context).size.height,
          padding: const EdgeInsets.symmetric(horizontal: 0.0, vertical: 20),
          decoration: const BoxDecoration(
            borderRadius: BorderRadius.only(
                topLeft: Radius.circular(30.0),
                topRight: Radius.circular(30.0)),
            color: kBgColor,
          ),
          child: Obx(
            () {
              //Future.delayed(const Duration(seconds: 1));

              return connectivityController.connectionStatus.value == 0
                  ? const CheckInternetWidget()
                  : Column(
                      children: [
                        const SizedBox(
                          height: 20.0,
                        ),
                        SizedBox(
                          height: MediaQuery.of(context).size.height - 60,
                          child: ListView.builder(
                              itemCount: documentController.documentLoader.value
                                  ? 10
                                  : documentController.documentModel.length,
                              itemBuilder: (context, index) {
                                return documentController.documentLoader.value
                                    ? const SimmerLoadingData()
                                    : documentController.documentModel.isEmpty
                                        ? const EmptyDataWidget()
                                        : InkWell(
                                            onTap: () {
                                              if (documentController
                                                      .documentModel[index]
                                                      .downloadState
                                                      .value ==
                                                  ViewState.retrived) {
                                                OpenFile.open(documentController
                                                    .documentModel[index]
                                                    .path
                                                    .value);
                                              }
                                            },
                                            child: SizedBox(
                                              height: 60,
                                              // color: Colors.black,
                                              child: ListTile(
                                                leading: Container(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            12),
                                                    margin: const EdgeInsets
                                                        .symmetric(vertical: 4),
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(5),
                                                        color: const Color(
                                                            0x46A4B4CE)),
                                                    child: const FaIcon(
                                                      FontAwesomeIcons.fileWord,
                                                      color: kMainColor,
                                                    )),
                                                title: Text(documentController
                                                    .documentModel[index]
                                                    .fileName!),
                                                trailing: InkWell(
                                                  child: IconButton(
                                                    onPressed: () async {
                                                      if (documentController
                                                              .documentModel[
                                                                  index]
                                                              .downloadState
                                                              .value ==
                                                          ViewState.retrived) {
                                                        OpenFile.open(
                                                            documentController
                                                                .documentModel[
                                                                    index]
                                                                .path
                                                                .value);
                                                      } else {
                                                        documentController
                                                                .documentModel[
                                                                    index]
                                                                .downloadState
                                                                .value =
                                                            ViewState.busy;
                                                        path = await documentController
                                                            .downloadFile(
                                                                documentController
                                                                    .documentModel[
                                                                        index]
                                                                    .url!);

                                                        documentController
                                                                .documentModel[
                                                                    index]
                                                                .downloadState
                                                                .value =
                                                            ViewState.retrived;
                                                      }
                                                    },
                                                    icon: Obx(
                                                      () {
                                                        if (documentController
                                                                .documentModel[
                                                                    index]
                                                                .downloadState
                                                                .value ==
                                                            ViewState.busy) {
                                                          return LoadingSpinner()
                                                              .miniFadingCircleSpinner;
                                                        } else if (documentController
                                                                .documentModel[
                                                                    index]
                                                                .downloadState
                                                                .value ==
                                                            ViewState
                                                                .retrived) {
                                                          documentController
                                                              .documentModel[
                                                                  index]
                                                              .path
                                                              .value = path;
                                                          return const Icon(
                                                            Icons
                                                                .file_download_done,
                                                            color: Colors
                                                                .blueAccent,
                                                            size: 20,
                                                          );
                                                        }
                                                        return const Icon(
                                                          Icons.download,
                                                          color: kMainColor,
                                                          size: 20,
                                                        );
                                                      },
                                                    ),
                                                    // FaIcon(Icons.download, color: Colors.grey, size: 16),
                                                  ),
                                                ),
                                              ),
                                            ),
                                          );
                              }),
                        ),
                      ],
                    );
            },
          ),
        )));
  }
}
