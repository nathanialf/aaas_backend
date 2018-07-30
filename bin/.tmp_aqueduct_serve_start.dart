import 'dart:async';
import 'dart:io';

import 'package:aqueduct/aqueduct.dart';
import 'package:aaas_backend/aaas_backend.dart';

main() async {
  try {
    var app = new Application<AaasBackendSink>();
    var config = new ApplicationConfiguration()
      ..port = 8081
      
      
      
      ..configurationFilePath = r"/store/home_extension/n/Projects/aaas_backend/config.yaml"
      ..isIpv6Only = false;

    app.configuration = config;

    await app.start(numberOfInstances: 3);

    var signalFile = new File(".${pid}.aqueduct.pid");
		await signalFile.writeAsString("ok");
  } catch (e, st) {
    await writeError("$e\n $st");
  }
}

Future writeError(String error) async {
  	var signalFile = new File(".${pid}.aqueduct.pid");
	await signalFile.writeAsString(error);
}
    