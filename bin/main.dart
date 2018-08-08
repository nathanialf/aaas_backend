import 'package:aaas_backend/aaas_backend.dart';

Future main() async {
  final app = Application<AaasBackendChannel>()
      ..options.configurationFilePath = "config.yaml"
      ..options.port = 8888;

  await app.start(numberOfInstances: Platform.numberOfProcessors);

  print("Application started on port: ${app.options.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}