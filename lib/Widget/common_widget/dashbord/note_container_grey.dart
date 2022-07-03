import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/translation/translation.dart';
import '../../../value/style.dart';

class NoteContainerGrey extends StatelessWidget {
  const NoteContainerGrey({
    Key? key,
    required this.title,
    required this.notes,
  }) : super(key: key);

  //final  kGreyTextColor,title;
  final String notes, title;

  @override
  Widget build(BuildContext context) {
    Translation translationController = Get.put(Translation());
    return Padding(
      padding: const EdgeInsets.only(top: 16, bottom: 10),
      child: Row(
        children: [
          Expanded(
            child: Container(
              color: const Color(0xffF8F8F9),
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 16),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
              //  crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    //  style: const TextStyle(color: Colors.grey),
                  ),
                  const SizedBox(
                    width: 20,
                  ),
                  Expanded(
                    child: SizedBox(
                      height: 20,
                      child: SizedBox(
                        width: MediaQuery.of(context).size.width * 0.7,
                        child: Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child: Text(
                            notes,
                            style: kTextStyle.copyWith(
                                fontWeight: FontWeight.bold),
                            maxLines: 3,
                            textDirection:translationController.isArabic.value
                                ? TextDirection.ltr
                                : TextDirection.rtl,
                            textAlign: translationController.isArabic.value
                                ? TextAlign.left
                                : TextAlign.right,
                            overflow: TextOverflow.visible,
                          ),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(height: 10),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
