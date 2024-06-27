
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import 'app_button.dart';
import 'app_text.dart';

typedef SuccessCallback = void Function(dynamic data);
typedef OnChangeCallback = void Function(bool? val);
typedef AlertSuccessCallback = void Function();

enum AlertTypes {
  info,
  warning,
  error,
  alert,
  connectivity,
  congrats,
  success,
  logout,
}

class AppAlerts {
  customAlert({
    String? title,
    String? subTitle,
    String? message,
    AlertSuccessCallback? callback,
    AlertSuccessCallback? cancelCallback,
    AlertSuccessCallback? otherCallback,
    AlertTypes alertTypes = AlertTypes.info,
    String? cancelText,
    String? okText,
    String? otherActionText,
    bool showCheckbox = false,
    bool checkBoxValue = false,
    WillPopCallback? onWillPop,
    OnChangeCallback? onChangeCallback,
  }) async {
    List<Widget> getBtns(BuildContext context) {
      return [
        AppButton(
            onTap: () {
              Get.back();
              if (callback != null) {
                callback();
              }
            },
            title: okText ?? (alertTypes == AlertTypes.warning ? 'Yes' : 'OK'),
            width: 80),
        if (otherCallback != null &&
            otherActionText != null &&
            otherActionText.isNotEmpty) ...[
          const SizedBox(
            width: 8,
            height: 10,
          ),
          AppButton(
            onTap: () {
              Get.back();
              otherCallback();
            },
            title: otherActionText,
            textColor: AppColors.background,
            btnColor: AppColors.danger,
            width: setWidthValue(100),
          ),
        ],
        if (cancelCallback != null) ...[
          const SizedBox(
            width: 8,
            height: 10,
          ),
          AppButton(
            onTap: () {
              Get.back();
              cancelCallback();
            },
            title: cancelText ??
                (alertTypes == AlertTypes.warning ? 'No' : 'Cancel'),
            textColor: AppColors.background,
            btnColor: AppColors.danger,
            width: setWidthValue(100),
          ),
        ],
      ];
    }

    if (Get.isDialogOpen == false) {
      await Get.defaultDialog(
        radius: 10,
        barrierDismissible: false,
        onWillPop: onWillPop,
        title: '',
        titlePadding: const EdgeInsets.all(0),
        contentPadding: EdgeInsets.symmetric(
          horizontal: setWidthValue(10),
        ),
        content: StatefulBuilder(
          builder: (context, setState) {
            return Container(
              padding: const EdgeInsets.all(5),
              width: Get.width,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(height: 5),
                  if (alertTypes == AlertTypes.warning) ...[
                    const Icon(
                      Icons.warning_amber,
                      size: 40,
                    )
                  ] else if (alertTypes == AlertTypes.error) ...[
                    const Icon(
                      Icons.error_outline,
                      size: 40,
                    )
                  ] else if (alertTypes == AlertTypes.info) ...[
                    const Icon(
                      Icons.info_outline,
                      size: 40,
                    )
                  ] else if (alertTypes == AlertTypes.connectivity) ...[
                    const Icon(
                      Icons.wifi,
                      size: 40,
                    )
                  ] else if (alertTypes == AlertTypes.success) ...[
                    const Icon(
                      Icons.check_circle_outline,
                      size: 40,
                    )
                  ] else if (alertTypes == AlertTypes.congrats) ...[
                    const Icon(
                      Icons.handshake_outlined,
                      size: 40,
                    )
                  ] else if (alertTypes == AlertTypes.logout) ...[
                    const Icon(
                      Icons.logout,
                      size: 40,
                    )
                  ] else if (alertTypes == AlertTypes.alert) ...[
                    const Icon(
                      Icons.add_alert_outlined,
                      size: 40,
                    )
                  ],
                  SizedBox(height: setHeightValue(10)),
                  if (title != null && title.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    Text(
                      title,
                      maxLines: 2,
                      textAlign: TextAlign.center,
                      style: appTextStyleBold(context, size: 18),
                    ),
                  ],
                  if (subTitle != null && subTitle.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    AppTextBold(
                        text: subTitle,
                        align: TextAlign.center,
                        size: setHeightValue(15),
                        overFlow: TextOverflow.clip,
                        maxLines: 3),
                  ],
                  if (message != null && message.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    Text(
                      message,
                      maxLines: 3,
                      style: appTextStyleMedium(context, size: 18),
                      textAlign: TextAlign.center,
                    ),
                  ],
                  SizedBox(height: setHeightValue(10)),
                  if (showCheckbox) ...[
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Checkbox(
                            value: checkBoxValue,
                            onChanged: (val) {
                              setState(() {
                                checkBoxValue = !checkBoxValue;
                              });
                              onChangeCallback!.call(val);
                            }),
                        const Text('Enable Recurring Payment'),
                      ],
                    )
                  ],
                  SizedBox(height: setHeightValue(10)),
                  getBtns(context).length > 4
                      ? isWeb()
                          ? Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getBtns(context),
                            )
                          : Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: getBtns(context),
                            )
                      : Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: getBtns(context),
                        )
                ],
              ),
            );
          },
        ),
      );
    }
  }

  bool isWeb() {
    return kIsWeb;
  }
}

AppAlerts appAlerts = AppAlerts();

showDialogueApp(context,
    {required String title,
    required String description,
    String? noText,
    okText,
    onOkClick,
    Color? okBtnColor,
    Color? cancelBtnColor,
    Color? okBtnTextColor}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
            contentPadding: EdgeInsets.zero,
            backgroundColor: Theme.of(context).scaffoldBackgroundColor,
            surfaceTintColor: Theme.of(context).scaffoldBackgroundColor,
            elevation: 0,
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(setHeightValue(10))),
            content: StatefulBuilder(
              builder: (context, setState) {
                return Container(
                  width: Get.width * 0.8,
                  height: Get.width * 0.5,
                  alignment: Alignment.topCenter,
                  padding: EdgeInsets.symmetric(
                    horizontal: setWidthValue(10),
                    vertical: setWidthValue(10),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      AppTextBold(
                        text: title,
                        size: setHeightValue(25),
                        color: Theme.of(context).primaryColor,
                      ),
                      setHeight(10),
                      AppTextSemiBold(
                          text: description,
                          size: setHeightValue(20),
                          overFlow: TextOverflow.clip,
                          align: TextAlign.center),
                      setHeight(20),
                      Padding(
                        padding:
                            EdgeInsets.symmetric(horizontal: setWidthValue(30)),
                        child: Row(
                          children: [
                            Expanded(
                              child: AppButton(
                                title: noText ?? 'No',
                                onTap: () {
                                  Get.back();
                                },
                                isOutline: true,
                                borderColor: cancelBtnColor ??
                                    Theme.of(context).primaryColor,
                                textColor: Theme.of(context).primaryColor,
                              ),
                            ),
                            setWidth(20),
                            Expanded(
                              child: AppButton(
                                title: okText ?? 'Exit',
                                onTap: () {
                                  Get.back();
                                  onOkClick();
                                },
                                isOutline: false,
                                btnColor: okBtnColor ??
                                    Theme.of(context).primaryColor,
                                textColor: okBtnTextColor,
                              ),
                            ),
                          ],
                        ),
                      )
                    ],
                  ),
                );
              },
            ));
      });
}

showDebugDialogue(context,
    {String? noText,
    okText,
    Color? okBtnColor,
    Color? cancelBtnColor,
    Color? okBtnTextColor}) async {
  await showDialog(
      context: context,
      builder: (_) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          backgroundColor: AppColors.background,
          surfaceTintColor: AppColors.background,
          elevation: 0,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(setHeightValue(10))),
          content: Container(
            width: Get.width * 0.8,
            height: Get.width * 0.6,
            alignment: Alignment.topCenter,
            padding: EdgeInsets.symmetric(
              horizontal: setWidthValue(20),
              vertical: setWidthValue(10),
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                AppTextBold(
                  text: 'we are sorry!',
                  size: setHeightValue(25),
                  color: Theme.of(context).primaryColor,
                ),
                setHeight(10),
                AppTextSemiBold(
                    text: 'We apologize for any inconvenience caused. Please note that we are currently in the development phase for this feature. Thank you for your understanding',
                    size: setHeightValue(20),
                    overFlow: TextOverflow.clip,
                    align: TextAlign.center),
                setHeight(20),
              ],
            ),
          ),
          actions: [
            AppButton(
              width: Get.width,
              margin: EdgeInsets.symmetric(vertical: setWidthValue(10)),
              title: 'Ok',
              onTap: () {
                Get.back();
              },
              isOutline: false,
              btnColor: okBtnColor ?? Theme.of(context).primaryColor,
              textColor: okBtnTextColor,
            ),
          ],
        );
      });
}

