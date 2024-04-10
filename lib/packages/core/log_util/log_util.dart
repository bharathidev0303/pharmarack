import 'package:logger/logger.dart';

///
/// This class should initialized as singleton class In caller site
/// [_logger] Logger instance
///
class LogUtil {
  static Logger? _logger;

  LogUtil._();

  ///
  /// This method should call before calling any of the below method
  /// Otherwise we face exception
  /// [shouldEnableLogs] This flag denotes logs are enable or not
  ///
  static void initializeLogger({bool shouldEnableLogs = true}) {
    _logger = Logger(
      filter: _CustomLoggerFilter(shouldEnableLogs: shouldEnableLogs),
      printer: PrettyPrinter(methodCount: 0, errorMethodCount: 20),
    );
  }

  /// Log a message at level [Level.debug].
  static void debug(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _checkLoggerInitialized();
    _logger?.d(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.error].
  static void error(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _checkLoggerInitialized();
    _logger?.e(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.warning].
  static void warn(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _checkLoggerInitialized();
    _logger?.w(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.info].
  static void info(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _checkLoggerInitialized();
    _logger?.i(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.trace].
  static void trace(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _checkLoggerInitialized();
    _logger?.t(message, time: time, error: error, stackTrace: stackTrace);
  }

  /// Log a message at level [Level.fatal].
  static void fatal(
    dynamic message, {
    DateTime? time,
    Object? error,
    StackTrace? stackTrace,
  }) {
    _checkLoggerInitialized();
    _logger?.f(message, time: time, error: error, stackTrace: stackTrace);
  }

  static void _checkLoggerInitialized() {
    if (_logger == null) {
      initializeLogger(shouldEnableLogs: false);
    }
  }
}

class _CustomLoggerFilter extends LogFilter {
  final bool shouldEnableLogs;

  _CustomLoggerFilter({required this.shouldEnableLogs});

  @override
  bool shouldLog(LogEvent event) {
    return shouldEnableLogs;
  }
}
