import 'package:flutter/rendering.dart';
import 'package:medcaremainapp/utils/all_options.dart';

class Constants {
  //Drawer menu titles
  static List<String> careTitles = [
    userProfile,
    primaryCare,
    maternityCare,
    skinCare,
    genCare,
    doorstepServices,
    primaryCare,
    healthPkg,
    gifts
  ];
  //Drawer menu sub-titles
  static List<List<String>> healthCareList = [
    [],
    [
      "Regular checkup",
      "Gynae care",
      "Breast health care",
      "Women's heart care",
      "Women's cancer care",
      "Women's Diabetic care",
      "Menopause care",
      "Sexual health care",
      "Mental health care",
    ],
    ["During conception",
    "During pregnancy",
    "During child birth",
    "High risk obstetric care",
    "Newborn care"
    ],
    [
      "Weight management",
      "Plastic surgery",
      "Skin care"
    ],
    [
      periodTracker,
      familyPlanning,
      pillsReminder
    ],
    [
      bloodTest,
      ambulance,
      nursingCare,
      physioCare
    ],
    [],
    [],
    [],
    [],
  ];

  static List<String> settings = [
    upgradePremium,
    share,
    helpNFeedback,
    rateApp
  ];

  static const String timeStamp = "timestamp";

  //Collections in database
  static const String userCollection = "user";
  static const String appointmentCollection = "appointments";
  static const String chatCollection = "conversations";
  


  //user model data fields
  static const String userId = "userId";
  static const String name = "name";
  static const String email = "email";
  static const String phoneNumber = "phoneNumber";

  //Appointment details
  static const String doctorID = "doctorID";
  static const String dateTime = "dateTime";
  static const String bookPrice = "price";
  static const String patientID = "patientID";
  static const String patientName = "patientName";
  static const String patientEmail = "patientEmail";
  static const String patientPhoneNumber = "patientPhoneNumber";

  //Message types
  static const String typeReceiver = "receiver";
  static const String typeSender = "sender";

  //Chat message fields
  static const String chatMessageContent = "messageContent";
  static const String chatMessageType = "messageType";

  static const String formHintName = "Name";
  static const String formHintEmail = "Email";
  static const String formHintPhone = "Phone Number";

  //page titles
  static const String titleHomePage = "Home Page";
  static const String titleChats = "Chats";
  static const String titleSettings = "Settings";
  static const String titleEmergency = "Emergency services";
  static const String titleMedicineOrders = "Medicines";

  static const List<String> userMenuOptions = [
    userEditProfile,
    userOrders,
    userAppts,
    userSignOut
  ];
}
