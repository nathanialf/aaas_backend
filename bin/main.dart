import '../lib/aaas_backend.dart';
import 'dart:io' show Platform;

Future main() async {
  var app = new Application<AaasBackendSink>()
      ..configuration.configurationFilePath = "config.yaml"
      ..configuration.port = 8000;

  await app.start(numberOfInstances: Platform.numberOfProcessors);

  print("Application started on port: ${app.configuration.port}.");
  print("Use Ctrl-C (SIGINT) to stop running the application.");
}