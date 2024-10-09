


enum AiRequestTypeEnum {
  bloodTest("Blood Test"),
  radiologyReport("Radiology Report"),
  ecgReport("ECG Report"),
  eegReport("EEG Report"),
  none("none");

  final String value;
  const AiRequestTypeEnum(this.value);
}

AiRequestTypeEnum getAiRequestTypeEnum(String value){
  switch(value){
    case 'Blood_Test':
      return AiRequestTypeEnum.bloodTest;
    case 'Radiology_Report':
      return AiRequestTypeEnum.radiologyReport;
    case 'ECG_Report':
      return AiRequestTypeEnum.ecgReport;
    case 'EEG_Report':
      return AiRequestTypeEnum.eegReport;
    default:
      return AiRequestTypeEnum.bloodTest;

  }
}

