enum ResumeLanguageLevel {
  a1,
  a2,
  b1,
  b2,
  c1,
  c2,
  native,
}

extension ResumeLanguageLevelExtension on ResumeLanguageLevel {
  double get levelProgress => (index + 1) / ResumeLanguageLevel.values.length;
}
