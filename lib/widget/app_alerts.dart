import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../config/size_config.dart';
import '../config/theme/app_colors.dart';
import '../config/theme/button_styles.dart';
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
        Expanded(
          child: AppButton(
              onPressed: () {
                Get.back();
                if (callback != null) {
                  callback();
                }
              },
              title:
                  okText ?? (alertTypes == AlertTypes.warning ? 'Yes' : 'OK'),
              buttonStyleClass: getButtonClass()),
        ),
        if (otherCallback != null &&
            otherActionText != null &&
            otherActionText.isNotEmpty) ...[
          const SizedBox(
            width: 8,
            height: 10,
          ),
          Expanded(
            child: AppButton(
                onPressed: () {
                  Get.back();
                  otherCallback();
                },
                title: otherActionText,
                buttonStyleClass: getButtonClass()),
          ),
        ],
        if (cancelCallback != null) ...[
          const SizedBox(
            width: 8,
            height: 10,
          ),
          Expanded(
            child: AppButton(
                onPressed: () {
                  Get.back();
                  cancelCallback();
                },
                title: cancelText ??
                    (alertTypes == AlertTypes.warning ? 'No' : 'Cancel'),
                buttonStyleClass: getButtonClass(color: AppColors.danger)),
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
        backgroundColor: AppColors.background,
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
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  // getAlertIcon(alertTypes),
                  // SizedBox(height: setHeightValue(5)),
                  if (title != null && title.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    AppText(
                      title: title,
                      maxLines: 1,
                      textType: TextTypeEnum.Medium,
                      fontSize: 18,
                      textAlign: TextAlign.center,
                    )
                  ],
                  if (subTitle != null && subTitle.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    AppText(
                      title: subTitle,
                      textAlign: TextAlign.center,
                      fontSize: 14,
                      overflow: TextOverflow.clip,
                      maxLines: 3,
                    ),
                  ],
                  if (message != null && message.isNotEmpty) ...[
                    const SizedBox(height: 5),
                    AppText(
                      title: message,
                      maxLines: 3,
                      fontSize: 14,
                      textAlign: TextAlign.center,
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

  Widget getAlertIcon(AlertTypes alertTypes) {
    switch (alertTypes) {
      case AlertTypes.warning:
        return const Icon(Icons.warning_amber, size: 40);
      case AlertTypes.error:
        return const Icon(Icons.error_outline, size: 40);
      case AlertTypes.info:
        return const Icon(Icons.info_outline, size: 40);
      case AlertTypes.connectivity:
        return const Icon(Icons.wifi, size: 40);
      case AlertTypes.success:
        return const Icon(Icons.check_circle_outline, size: 40);
      case AlertTypes.congrats:
        return const Icon(Icons.handshake_outlined, size: 40);
      case AlertTypes.logout:
        return const Icon(Icons.logout, size: 40);
      case AlertTypes.alert:
        return const Icon(Icons.add_alert_outlined, size: 40);
      default:
        return const SizedBox.shrink();
    }
  }

  ButtonStyleClass getButtonClass({color}) {
    return ButtonStyleClass(
        height: 35, backgroundColor: color, foregroundColor: color);
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
                                onPressed: () {
                                  Get.back();
                                },
                              ),
                            ),
                            setWidth(20),
                            Expanded(
                              child: AppButton(
                                title: okText ?? 'Exit',
                                onPressed: () {
                                  Get.back();
                                  onOkClick();
                                },
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

// showDebugDialogue(context,
//     {String? noText,
//     okText,
//     Color? okBtnColor,
//     Color? cancelBtnColor,
//     Color? okBtnTextColor}) async {
//   await showDialog(
//       context: context,
//       builder: (_) {
//         return AlertDialog(
//           contentPadding: EdgeInsets.zero,
//           backgroundColor: AppColors.background,
//           surfaceTintColor: AppColors.background,
//           elevation: 0,
//           shape: RoundedRectangleBorder(
//               borderRadius: BorderRadius.circular(setHeightValue(10))),
//           content: Container(
//             width: Get.width * 0.8,
//             height: Get.width * 0.6,
//             alignment: Alignment.topCenter,
//             padding: EdgeInsets.symmetric(
//               horizontal: setWidthValue(20),
//               vertical: setWidthValue(10),
//             ),
//             child: Column(
//               mainAxisAlignment: MainAxisAlignment.spaceAround,
//               crossAxisAlignment: CrossAxisAlignment.center,
//               children: [
//                 AppTextBold(
//                   text: 'we are sorry!',
//                   size: setHeightValue(25),
//                   color: Theme.of(context).primaryColor,
//                 ),
//                 setHeight(10),
//                 AppTextSemiBold(
//                     text: 'We apologize for any inconvenience caused. Please note that we are currently in the development phase for this feature. Thank you for your understanding',
//                     size: setHeightValue(20),
//                     overFlow: TextOverflow.clip,
//                     align: TextAlign.center),
//                 setHeight(20),
//               ],
//             ),
//           ),
//           actions: [
//             AppButton(
//               width: Get.width,
//               margin: EdgeInsets.symmetric(vertical: setWidthValue(10)),
//               title: 'Ok',
//               onTap: () {
//                 Get.back();
//               },
//               isOutline: false,
//               btnColor: okBtnColor ?? Theme.of(context).primaryColor,
//               textColor: okBtnTextColor,
//             ),
//           ],
//         );
//       });
// }
