enum ParamsValues {
  both,
  children,
  patient,
  upcomming,
  passed,
  missed,
  child,
}

extension ParamsValuesExtension on ParamsValues {
  String get value {
    switch (this) {
      case ParamsValues.both:
        return 'both';
      case ParamsValues.children:
        return 'children';
      case ParamsValues.patient:
        return 'patient';
      case ParamsValues.upcomming:
        return 'upcomming';
      case ParamsValues.passed:
        return 'passed';
      case ParamsValues.child:
        return 'child';
      case ParamsValues.missed:
        return 'missed';
    }
  }
}
