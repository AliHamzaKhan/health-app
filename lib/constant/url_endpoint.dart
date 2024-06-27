abstract class UrlEndPoints {



  static const String VerifyUser = 'user/verify';
  static const String Logout = 'user/logout';
  static const String ChangePwd = 'user/changePwd';
  static const String TripReplayData = 'tripreplay/getall';
  static const String Alarms = 'Alarm/GetAll';
  static const String AlarmsClearByRecNoAndVID = 'alarm/ClearIDWise';
  static const String AlarmsClearByAlarmID = 'alarm/ClearNameWise';
  static const String LiveData = 'live/status';
  static const String VehicleCurrentLastStatus = 'live/vstatus';
  static const String LiveAlarm = 'live/alarm';
  static const String SetMainManagerNumberSOS = 'CmdSet/MainMangerNumber';
  static const String GeofenceList = 'fence/getall';
  static const String GeofenceInit = 'fence/init';
  static const String GeofenceApply = 'fence/apply';
  static const String GeofenceFinish = 'fence/finish';
  static const String GeofenceRemoval = 'fence/remove';
  static const String ReportsAssetHistory = 'Reports/AssetHistory';
  static const String ReportAssetHistoryS = 'Reports/AssetHistorys';
  static const String ReportAssetHistoryD = 'Reports/AssetHistoryd';
  static const String ReportAssetTrip = 'Reports/AssetTrip';
  static const String ReportAssetTripS = 'Reports/AssetTrips';
  static const String ReportAssetTripD = 'Reports/AssetTripd';
  static const String ReportAssetAlarmList = 'Reports/AssetAlarmList';
  static const String ReportAssetAlarmListS = 'Reports/AssetAlarmListS';
  static const String ReportAssetAlarmListD = 'Reports/AssetAlarmListd';
  static const String ReportAlarmList = 'Reports/AlarmList';
  static const String ReportIdleParkedList = 'Reports/IdleParkedList';
  static const String ReportIdleParkedListD = 'Reports/IdleParkedListd';
  static const String SingleDeviceCurrentLocation = 'live/status';
  static const String AssetFuelHistory = 'Reports/assetfuelhistory';
  static const String AssetFuelActivity = 'Reports/assetfuelactivity';
  static const String SOSAPI = 'CmdSet/SOS';
  static const String TimeIntervalSetAPI = 'CmdSet/DataUploadTcp';
  static const String VehicleUpdate = 'vehicle/update';
  static const String TextBasedCommandAPI = 'CmdSet/TextBased';
  static const String AssetBehaviourAPI = 'Reports/AssetBhaviour';
  static const String AssetHistoryFuel = 'Reports/AssetHistoryFuel';
  static const String SmsLogs = 'Reports/SmsLogs';
  static const String AssetInstallation = 'Asset/Install';
  static const String AssetUnInstallation = 'Asset/UnInstall';
  static const String AssetInstallationByVRN = 'Asset/InstallByVrn';
  static const String AssetUnInstallationByVRN = 'Asset/UnInstallByVrn';
  static const String UpdateVRNByDeviceID = 'Asset/UpdateVrnByDeviceID';
  static const String FleetEvents = 'Reports/FleetEvents';
  static const String RouteDeviation = 'route/RouteList';
  static const String GetInfo = 'route/GetInfo';
  static const String RouteApply = 'route/apply';
  static const String RouteRemoval = 'route/remove';
  static const String CmdImoblizerOff = 'CmdCtrl/ImoblizerOff';
  static const String CmdImoblizerOn = 'CmdCtrl/ImoblizerOn';
  static const String GetMovementData = 'Home/GetMovementData';

}

