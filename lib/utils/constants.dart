class Constants {
  //Drawer menu titles
  static List<String> careTitles = [
    "User Profile",
    "Primary Care",
    "Maternity Care",
    "Cosmetic & Skin Care",
    "General Care",
    "Doorstep services",
    "Premium care",
    "Buy health checkup Pkg",
    "Gift loved ones"
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
      
    ],
    [],
    [],
    [],
    [],
    [],
    []
  ];

  //Collections in database
  static const String userCollection = "user";
  static const String appointmentCollection = "appointments";


  //user model data fields
  static const String userId = "userId";
  static const String name = "name";
  static const String email = "email";
  static const String phoneNumber = "phoneNumber";

  //Appointment details
  static const String doctorID = "doctorID";
  static const String date = "date";
  static const String time = "time";
  static const String bookPrice = "price";
  static const String patientID = "patientID";
  static const String patientName = "patientName";
  static const String patientEmail = "patientEmail";
  static const String patientPhoneNumber = "patientPhoneNumber";
}
