import 'package:nfe/app/data/provider/api/api_provider_base.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class NfeConfiguracaoApiProvider extends ApiProviderBase {
  static const _path = '/nfe-configuracao';

  Future<List<NfeConfiguracaoModel>?> getList({Filter? filter}) {
    return super.getListBase(
      '$_path/',
      (json) => NfeConfiguracaoModel.fromJson(json),
      filter: filter,
    );
  }

  Future<NfeConfiguracaoModel?> getObject(dynamic pk) {
    return super.getObjectBase(
      _path,
      pk,
      (json) => NfeConfiguracaoModel.fromJson(json),
    );
  }

  Future<NfeConfiguracaoModel?> insert(NfeConfiguracaoModel model) {
    return super.insertBase(
      _path,
      model,
      (json) => NfeConfiguracaoModel.fromJson(json),
    );
  }

  Future<NfeConfiguracaoModel?> update(NfeConfiguracaoModel model) {
    return super.updateBase(
      _path,
      model,
      (json) => NfeConfiguracaoModel.fromJson(json),
    );
  }

  Future<bool?> delete(dynamic pk) {
    return super.deleteBase(_path, pk);
  }
}