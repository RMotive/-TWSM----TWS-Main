import 'package:cosmos_foundation/server/server_module.dart';
import 'package:tws_main/data/repositories/tws_administration/services/inputs/init_session_input.dart';
import 'package:tws_main/data/repositories/tws_administration/services/outputs/init_session_output.dart';
import 'package:tws_main/data/resolvers/twsa_resolver.dart';

typedef SResult<TSuccess> = TWSAResolver<TSuccess>;

abstract class TWSASecurityServiceBase extends CSMServiceBase {
  TWSASecurityServiceBase(super.host, super.servicePath);

  Future<SResult<InitSessionOutput>> initSession(InitSessionInput account);
}