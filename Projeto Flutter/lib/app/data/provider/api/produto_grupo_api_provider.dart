import 'package:nfe/app/data/provider/api/api_provider_base.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class ProdutoGrupoApiProvider extends ApiProviderBase {
  static const _path = '/produto-grupo';

  Future<List<ProdutoGrupoModel>?> getList({Filter? filter}) {
    return super.getListBase(
      '$_path/',
      (json) => ProdutoGrupoModel.fromJson(json),
      filter: filter,
    );
  }

  Future<ProdutoGrupoModel?> getObject(dynamic pk) {
    return super.getObjectBase(
      _path,
      pk,
      (json) => ProdutoGrupoModel.fromJson(json),
    );
  }

  Future<ProdutoGrupoModel?> insert(ProdutoGrupoModel model) {
    return super.insertBase(
      _path,
      model,
      (json) => ProdutoGrupoModel.fromJson(json),
    );
  }

  Future<ProdutoGrupoModel?> update(ProdutoGrupoModel model) {
    return super.updateBase(
      _path,
      model,
      (json) => ProdutoGrupoModel.fromJson(json),
    );
  }

  Future<bool?> delete(dynamic pk) {
    return super.deleteBase(_path, pk);
  }
}
