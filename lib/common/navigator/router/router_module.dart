

import 'package:flutter/material.dart';

abstract class RouterModule {
  Map<String, MaterialPageRoute> getRoutes(RouteSettings settings);
}