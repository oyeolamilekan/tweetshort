import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get/get_state_manager/get_state_manager.dart';
import '../controller/index_controller.dart';
import '../routes/routes.dart';

import '../extentions/extentions.dart';
import '../widgets/button.dart';
import '../widgets/text_field.dart';

class Index extends StatelessWidget {
  const Index({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GetBuilder<IndexController>(
        init: IndexController(),
        builder: (controller) => Container(
          height: 100.h,
          color: Colors.white,
          padding: EdgeInsets.symmetric(
            horizontal: 10,
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Spacer(),
              Text(
                "Paste a tweet",
                style: Theme.of(context).textTheme.headline3!.copyWith(
                      fontWeight: FontWeight.w800,
                    ),
              ),
              Form(
                key: controller.formKey,
                child: STEMTextFormField(
                  fillColor: Colors.grey.withOpacity(0.2),
                  removeBorder: true,
                  textEditingController: controller.textEditingController,
                  suffixIcon: Icons.cancel,
                  suffixOnClick: controller.clearText,
                  validator: (String string) {
                    if (string.isEmpty) {
                      return 'Tweet form is empty';
                    } else if (!string.validateTweet()) {
                      return 'Please type a valid tweet link';
                    }
                    return null;
                  },
                ),
              ),
              SizedBox(
                height: 1.8.h,
              ),
              TWEETSHORTButton(
                child: Text(
                  "Short",
                  style: Theme.of(context)
                      .textTheme
                      .bodyText2!
                      .copyWith(color: Colors.white),
                ),
                color: Colors.black,
                onPressed: () {
                  if (controller.formKey.currentState!.validate()) {
                    Get.toNamed(
                      Routes.editor,
                      arguments: {
                        "tweetId": controller.textEditingController.text
                            .extractTweetId()
                      },
                    );
                  }
                },
              ),
              Spacer(),
              Padding(
                padding: EdgeInsets.symmetric(vertical: 4.6.h),
                child: InkWell(
                  onTap: () => Get.toNamed("/about_me"),
                  child: Align(
                    alignment: Alignment.center,
                    child: Text("Built by appstate."),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
