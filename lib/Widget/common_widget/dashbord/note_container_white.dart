import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controller/translation/translation.dart';
import '../../../value/style.dart';

class NoteContainerWhite extends StatelessWidget {
  
  const NoteContainerWhite({
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
      padding: const EdgeInsets.only(top: 10, bottom: 0),
      child: Container(
        //  color: const Color(0xffF8F8F9),
        width: double.infinity,
        padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 0),
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
                  child: Text(
                    notes,
                    style: kTextStyle.copyWith(fontWeight: FontWeight.bold),
                    maxLines:5,
                    textDirection: translationController.isArabic.value
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
            const SizedBox(
              height: 10,
            ),
          ],
        ),
      ),
    );
  }
}
