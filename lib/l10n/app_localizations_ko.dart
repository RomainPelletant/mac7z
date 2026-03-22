// ignore: unused_import
import 'package:intl/intl.dart' as intl;
import 'app_localizations.dart';

// ignore_for_file: type=lint

/// The translations for Korean (`ko`).
class AppLocalizationsKo extends AppLocalizations {
  AppLocalizationsKo([String locale = 'ko']) : super(locale);

  @override
  String get dropZoneDrop => '아카이브 드롭';

  @override
  String get dropZoneRelease => '드롭하여 열기';

  @override
  String get dropZoneSubtitle => '또는 클릭하여 선택\n.zip .7z .rar .tar .gz…';

  @override
  String dropZoneFileCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 파일',
    );
    return '$_temp0';
  }

  @override
  String get passwordDialogTitle => '보호된 아카이브';

  @override
  String get passwordDialogSubtitle => '비밀번호 입력';

  @override
  String get passwordDialogHint => '비밀번호…';

  @override
  String get cancel => '취소';

  @override
  String get confirm => '확인';

  @override
  String get logPanelTitle => '로그';

  @override
  String logPanelEntryCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 항목',
    );
    return '$_temp0';
  }

  @override
  String get logPanelEmpty => '활동 없음';

  @override
  String get progressExtracting => '추출 중…';

  @override
  String get progressDone => '추출 완료!';

  @override
  String get treeLoading => '아카이브 읽는 중…';

  @override
  String get treeError => '오류';

  @override
  String get treeEmpty => '로드된 아카이브 없음';

  @override
  String get treeEmptyHint => '파일을 드롭하여 내용 보기';

  @override
  String get treeSearch => '검색…';

  @override
  String get treeColName => '이름';

  @override
  String get treeColSize => '크기';

  @override
  String get treeColModified => '수정됨';

  @override
  String get treeOpenTooltip => '두 번 클릭하여 열기';

  @override
  String treeItems(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 항목',
    );
    return '$_temp0';
  }

  @override
  String get sectionDestination => '대상';

  @override
  String get sectionSecurity => '보안';

  @override
  String get destinationSameFolder => '아카이브와 같은 폴더';

  @override
  String get subfolderCreate => '하위 폴더로 추출';

  @override
  String get subfolderDefault => '아카이브 이름으로 지정';

  @override
  String get passwordNone => '비밀번호 없음';

  @override
  String get passwordSetLabel => '비밀번호 설정됨';

  @override
  String get passwordEdit => '편집';

  @override
  String get passwordDefine => '설정';

  @override
  String get btnExtract => '추출';

  @override
  String get btnExtracting => '추출 중...';

  @override
  String get btnDone => '완료 ✓';

  @override
  String get btnReset => '재설정';

  @override
  String binaryWarning(String cmd) {
    return '7zip을 찾을 수 없습니다. 설치: $cmd';
  }

  @override
  String get pickFileDialogTitle => '아카이브 열기';

  @override
  String get pickOutputDialogTitle => '대상 폴더 선택';

  @override
  String logBinaryFound(String path) {
    return '7zip 찾음: $path';
  }

  @override
  String get logBinaryNotFound =>
      '⚠️ 7zip을 찾을 수 없습니다. Homebrew (macOS) 또는 7-zip.org (Windows)에서 설치하세요.';

  @override
  String get logNoArchiveRecognized => '드롭된 파일에서 인식된 아카이브가 없습니다.';

  @override
  String logUnsupportedFormat(String name) {
    return '지원되지 않는 형식: $name';
  }

  @override
  String logReadingArchive(String name) {
    return '아카이브 읽는 중: $name';
  }

  @override
  String logEntriesFound(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '아카이브에서 $count개 항목을 찾았습니다.',
    );
    return '$_temp0';
  }

  @override
  String get logPasswordRequired => '암호화된 아카이브 — 비밀번호 필요.';

  @override
  String get logFilePasswordRequired => '암호화된 파일 — 비밀번호 필요.';

  @override
  String get logPasswordDefined => '비밀번호 설정됨.';

  @override
  String get logCancelled => '취소됨.';

  @override
  String logDestination(String path) {
    return '대상: $path';
  }

  @override
  String logExtractionStarted(String path) {
    return '추출 대상: $path';
  }

  @override
  String logExtractionDone(String path) {
    return '✅ 추출 완료: $path';
  }

  @override
  String get logReset => '재설정됨.';

  @override
  String logOpening(String name) {
    return '$name 열는 중…';
  }

  @override
  String logOpened(String name) {
    return '열림: $name';
  }

  @override
  String logOpenError(String error) {
    return '열기 오류: $error';
  }

  @override
  String logExtractionError(String error) {
    return '추출 오류: $error';
  }

  @override
  String logError(String error) {
    return '오류: $error';
  }

  @override
  String get logSplitIncompleteEmpty =>
      '⚠️ 불완전한 분할 아카이브 — 누락된 부분. 내용을 표시할 수 없습니다.';

  @override
  String get logSplitIncompletePartial =>
      '⚠️ 불완전한 분할 아카이브 — 누락된 부분. 표시된 내용이 불완전할 수 있습니다.';

  @override
  String get logExtractionSplitError => '추출 실패: 누락된 부분.';

  @override
  String get errorSplitArchive => '⚠️ 불완전한 분할 아카이브 — 모든 부분이 같은 폴더에 있는지 확인하세요.';

  @override
  String get tabDecompression => '압축 해제';

  @override
  String get tabCompression => '압축';

  @override
  String get tabConsoleApi => '콘솔 API';

  @override
  String get tabComingSoon => '출시 예정';

  @override
  String get compLabelArchiveName => '아카이브 이름';

  @override
  String get compLabelDestination => '대상';

  @override
  String get compLabelFormat => '형식';

  @override
  String get compLabelCompression => '압축 수준';

  @override
  String get compLabelSecurity => '보안';

  @override
  String get compLabelAdvanced => '고급 옵션';

  @override
  String get compLabelSplit => '분할';

  @override
  String get compSizeFolder => '폴더';

  @override
  String get compDestSameFolder => '파일과 같은 폴더';

  @override
  String compLevelNotApplicable(String format) {
    return '.$format에는 적용되지 않음';
  }

  @override
  String get compHeaderEncryption => '헤더 암호화 활성화';

  @override
  String get compSplitNone => '없음';

  @override
  String get compBtnCompress => '압축';

  @override
  String get compBtnCompressing => '압축 중…';

  @override
  String get compAddFiles => '파일 추가';

  @override
  String get compAddFolder => '폴더 추가';

  @override
  String get compDropToAdd => '드래그하여 추가';

  @override
  String get compDropHint => '파일 또는 폴더를 여기로 드래그';

  @override
  String get compDropSubtitle => '파일이 아카이브에 추가됩니다';

  @override
  String compItemCount(int count) {
    String _temp0 = intl.Intl.pluralLogic(
      count,
      locale: localeName,
      other: '$count개 항목',
    );
    return '$_temp0';
  }

  @override
  String compLogStarted(String path) {
    return '압축 중 → $path';
  }

  @override
  String compLogDone(String path) {
    return '✅ 아카이브 생성: $path';
  }
}
