import 'package:flutter/material.dart';
import 'package:medcaremainapp/ui/screens/edit_profile.dart';

class MedicinesPage extends StatefulWidget {
  const MedicinesPage({ Key? key }) : super(key: key);

  @override
  State<MedicinesPage> createState() => _MedicinesPageState();
}

class _MedicinesPageState extends State<MedicinesPage> {
  @override
  Widget build(BuildContext context) {
    return const EditProfile();
  }
}