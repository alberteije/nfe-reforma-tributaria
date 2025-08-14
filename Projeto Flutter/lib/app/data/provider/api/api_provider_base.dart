// import 'package:get/get.dart';
import 'dart:convert';

import 'package:nfe/app/data/model/model_imports.dart';
import 'package:nfe/app/infra/infra_imports.dart';
import 'package:nfe/app/data/provider/provider_base.dart';
import 'package:http/http.dart' show Client;

class ApiProviderBase extends ProviderBase {
	/// defines the header sent in all requests that follow with the JWT Token
  static Map<String, String>? headerRequisition() {
    if (Session.tokenJWT.isEmpty) {
      return {
        "content-type": "application/json",
        "cnpj": "fenix" // se não tem cnpj definido ainda, vamos mandar o banco de dados padrão
//TODO descomente e apague a linha de cima        "cnpj": (Session.empresaSessao.cnpj ?? "fenix") // se não tem cnpj definido ainda, vamos mandar o banco de dados padrão
      };
    } else {
      return {
        "content-type": "application/json", 
        // "authentication": "Bearer ${Session.tokenJWT}", //TODO: para o servidor Delphi mude de authorization para a authentication
        "authorization": "Bearer ${Session.tokenJWT}", 
        "cnpj": "fenix"
// TODO: descomente e apague a linha de cima        "cnpj": (Session.empresaSessao.cnpj!)
      };
    }
  }
	static final httpClient = Client();

	// Server
	static final String _endpoint = '${Constants.serverAddress}:${Constants.serverPort}${Constants.serverAddressComplement}';
	get endpoint => _endpoint;
	static var _url = '';
	get url => _url;

  // Server SH
	static final String _endpointSh = '${Constants.serverShAddress}:${Constants.serverShPort}${Constants.serverShAddressComplement}';
	get endpointSh => _endpointSh;
	static var _urlSh = _endpointSh;
	get urlSh => _urlSh;

	static final _resultJsonErrorObj = ResultJsonError();
	get resultJsonErrorObj => _resultJsonErrorObj;

	// the filter should be shipped as follows: ?filter=field||$condition||value
	// reference: https://github.com/nestjsx/crud/wiki/Requests
	void handleFilter(Filter? filter, String entity) {
		String? stringFilter = '';

    /* Para o servidor Node use o outro comente esse bloco e descomente o outro */
		if (filter != null) {
			if (filter.condition == 'cont') {
				stringFilter = '?filter=${filter.field!}||\$cont||${filter.value!}';
			} else if (filter.condition == 'eq') {
				stringFilter = '?filter=${filter.field!}||\$eq||${filter.value!}';
			} else if (filter.condition == 'between') {
				stringFilter = '?filter=${filter.field!}||\$between||${filter.initialDate!},${filter.finalDate!}';
			} else if (filter.condition == 'where') { // in this case the filter has already been mounted on the window
				stringFilter = filter.where;
			}
		}

    /* Use esse bloco apenas para o servidor Node 
		if (filter != null) {
			if (filter.condition == 'cont') {
				stringFilter = '?filter=${filter.field!.camelCase}||\$cont||${filter.value!}';
			} else if (filter.condition == 'eq') {
				stringFilter = '?filter=${filter.field!.camelCase}||\$eq||${filter.value!}';
			} else if (filter.condition == 'between') {
				stringFilter = '?filter=${filter.field!.camelCase}||\$between||${filter.initialDate!},${filter.finalDate!}';
			} else if (filter.condition == 'where') { // in this case the filter has already been mounted on the window
				stringFilter = filter.where;
			}
		}*/

		_url = _endpoint + entity + stringFilter!;
    _urlSh = _endpointSh + entity + stringFilter;
	}

  Future<List<T>?> getListBase<T>(
    String endpointPath,
    T Function(Map<String, dynamic>) fromJson,
    {Filter? filter}
  ) async {
    List<T> items = [];

    try {
      handleFilter(filter, endpointPath);

      final response = await ApiProviderBase.httpClient.get(
        Uri.tryParse(url)!,
        headers: ApiProviderBase.headerRequisition(),
      );

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          handleResultError(response.body, response.headers);
          return null;
        } else {
          var jsonList = json.decode(response.body) as List<dynamic>;
          for (var jsonItem in jsonList) {
            items.add(fromJson(jsonItem as Map<String, dynamic>));
          }
          return items;
        }
      } else {
        handleResultError(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
      return null;
    }
  }

  Future<T?> getObjectBase<T>(
    String endpointPath,
    dynamic pk,
    T Function(Map<String, dynamic>) fromJson
  ) async {
    try {
      final response = await ApiProviderBase.httpClient.get(
        Uri.tryParse('$endpoint$endpointPath/$pk')!,
        headers: ApiProviderBase.headerRequisition(),
      );

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          handleResultError(response.body, response.headers);
          return null;
        } else {
          return fromJson(json.decode(response.body));
        }
      } else {
        handleResultError(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
      return null;
    }
  }

  Future<T?> insertBase<T>(
    String endpointPath,
    dynamic model,
    T Function(Map<String, dynamic>) fromJson
  ) async {
    try {
      final response = await ApiProviderBase.httpClient.post(
        Uri.tryParse('$endpoint$endpointPath')!,
        headers: ApiProviderBase.headerRequisition(),
        body: model.objectEncodeJson(),
      );

      if (response.statusCode == 200 || response.statusCode == 201) {
        if (response.headers["content-type"]!.contains("html")) {
          handleResultError(response.body, response.headers);
          return null;
        } else {
          return fromJson(json.decode(response.body));
        }
      } else {
        handleResultError(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
      return null;
    }
  }

  Future<T?> updateBase<T>(
    String endpointPath,
    dynamic model,
    T Function(Map<String, dynamic>) fromJson
  ) async {
    try {
      final response = await ApiProviderBase.httpClient.put(
        Uri.tryParse('$endpoint$endpointPath')!,
        headers: ApiProviderBase.headerRequisition(),
        body: model.objectEncodeJson(),
      );

      if (response.statusCode == 200) {
        if (response.headers["content-type"]!.contains("html")) {
          handleResultError(response.body, response.headers);
          return null;
        } else {
          return fromJson(json.decode(response.body));
        }
      } else {
        handleResultError(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
      return null;
    }
  }

  Future<bool?> deleteBase(
    String endpointPath,
    dynamic pk
  ) async {
    try {
      final response = await ApiProviderBase.httpClient.delete(
        Uri.tryParse('$endpoint$endpointPath/$pk')!,
        headers: ApiProviderBase.headerRequisition(),
      );

      if (response.statusCode == 200) {
        return true;
      } else {
        handleResultError(response.body, response.headers);
        return null;
      }
    } on Exception catch (e) {
      handleResultError(null, null, exception: e);
      return null;
    }
  }

}