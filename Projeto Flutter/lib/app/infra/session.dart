import 'package:get/get.dart';
import 'package:pluto_grid/pluto_grid.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:nfe/app/data/provider/api/empresa_api_provider.dart';
import 'package:nfe/app/data/provider/api/lookup_api_provider.dart';
import 'package:nfe/app/data/provider/drift/lookup_drift_provider.dart';
import 'package:nfe/app/data/repository/lookup_repository.dart';
import 'package:nfe/app/controller/controller_imports.dart';
import 'package:nfe/app/data/provider/drift/database/database.dart';
import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/infra/constants.dart';
import 'package:nfe/app/routes/app_routes.dart';

class Session {
	Session._();

	static String tokenJWT = '';
	static AppDatabase database = Get.find();

  static Map<String, List<String>> modulosBlocos = {};
  static Map<String, List<String>> modulosLinks = {};

	static bool waitDialogIsOpen = false;
  static List<ViewControleAcessoModel> accessControlList = []; 
  static ViewPessoaUsuarioModel loggedInUser = ViewPessoaUsuarioModel();
  static EmpresaModel empresaSessao = EmpresaModel();
  static List<ErpTipoPlanoModel> erpTipoPlanList = [];
  static bool empresaComPlanoAtivo = false;
  static bool testMode = true; // TODO: mude para false para produção

	/// populate main objects for the Session
	static Future populateMainObjects() async { 
    Get.lazyPut<PaymentController>(() => PaymentController(), permanent: true);
		Get.lazyPut<LoginController>(() => LoginController());
		Get.lazyPut<FilterController>(() => FilterController(), permanent: true);
	  Get.lazyPut<LookupController>(() => LookupController(lookupRepository: LookupRepository(lookupApiProvider: LookupApiProvider(), lookupDriftProvider: LookupDriftProvider())), permanent: true);

    final loginController = Get.find<LoginController>();
    await loginController.loadPlans();
    // await desconfirmarEmpresaPlanoAtivo(); //TODO: comente ou remova essa linha para não ficar sempre chamando a tela de contratação do plano
    // await confirmarEmpresaPlanoAtivo(); //TODO: use esse comando para testes apenas para já confirmar o plano da empresa sem precisar ir na retaguarda da SH
    await verificarEmpresaPlanoAtivo();
	}

	static setLookupController() {
		Get.lazyPut<LookupController>(() => LookupController(lookupRepository: LookupRepository(lookupApiProvider: LookupApiProvider(), lookupDriftProvider: LookupDriftProvider())));
	}
	
	static PlutoGridLocaleText getLocaleForPlutoGrid() {
		switch (Get.locale.toString()) {
			case 'pt_BR':
				return const PlutoGridLocaleText.brazilianPortuguese();
			case 'es_ES':
				return const PlutoGridLocaleText.spanish();
			default:
				return const PlutoGridLocaleText();
		}
	}

  static Future gravarCnpj() async {
    final Future<SharedPreferences> sharedPreferencesInstance = SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences = await sharedPreferencesInstance;
    sharedPreferences.setString("T2TiERP_EmpresaCNPJ", empresaSessao.cnpj ?? '');
  }

  static Future verificarEmpresaPlanoAtivo() async {
    final Future<SharedPreferences> sharedPreferencesInstance = SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences = await sharedPreferencesInstance;
    final result = sharedPreferences.getString("T2TiERP_EmpresaPlanoAtivo");
    if (testMode) {
      empresaComPlanoAtivo = false;
      Constants.usingLocalDatabase = true;
    } else if (result != null && result == "S") {
      empresaComPlanoAtivo = true;
      Constants.usingLocalDatabase = false;
      final cnpj = sharedPreferences.getString("T2TiERP_EmpresaCNPJ");
      EmpresaApiProvider empresaApiProvider = EmpresaApiProvider();
      empresaSessao = await empresaApiProvider.getEmpresaPorCnpj(cnpj);
      carregarModulos();
    }
  }

  static Future confirmarEmpresaPlanoAtivo() async {
    final Future<SharedPreferences> sharedPreferencesInstance = SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences = await sharedPreferencesInstance;
    sharedPreferences.setString("T2TiERP_EmpresaPlanoAtivo", "S");
    sharedPreferences.setString("T2TiERP_EmpresaCNPJ", "10793118000178");
  }  

  static Future desconfirmarEmpresaPlanoAtivo() async {
    final Future<SharedPreferences> sharedPreferencesInstance = SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences = await sharedPreferencesInstance;
    sharedPreferences.setString("T2TiERP_EmpresaPlanoAtivo", "N");
  }  

  static Future isItCalledByAnotherModule() async {
    final Future<SharedPreferences> sharedPreferencesInstance = SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences = await sharedPreferencesInstance;
    final user = sharedPreferences.getString("T2TiERP_ChamouOutroModulo");
    if (user != null && user.isNotEmpty) {
      Get.offAndToNamed(Routes.homePage);
      sharedPreferences.setString("T2TiERP_ChamouOutroModulo", "");
    } 
  }

  static Future itIsCallingAnotherModule() async {
    final Future<SharedPreferences> sharedPreferencesInstance = SharedPreferences.getInstance();
    final SharedPreferences sharedPreferences = await sharedPreferencesInstance;
    sharedPreferences.setString("T2TiERP_ChamouOutroModulo", "S");
  }

  static void carregarModulos() {
    for (var module in empresaSessao.admModuloModelList ?? []) {
      final bloco = module.bloco;
      final moduleName = module.nome;
      final moduleLink = module.link;

      // Populate sections
      if (!modulosBlocos.containsKey(bloco)) {
        modulosBlocos[bloco] = [];
      }
      modulosBlocos[bloco]!.add(moduleName);

      // Populate links
      if (!modulosLinks.containsKey(bloco)) {
        modulosLinks[bloco] = [];
      }
      modulosLinks[bloco]!.add(moduleLink);
    }    
  }
}