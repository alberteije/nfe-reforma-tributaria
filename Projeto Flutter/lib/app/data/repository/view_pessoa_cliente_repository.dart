import 'package:nfe/app/infra/constants.dart';
import 'package:nfe/app/data/provider/api/view_pessoa_cliente_api_provider.dart';
import 'package:nfe/app/data/provider/drift/view_pessoa_cliente_drift_provider.dart';
import 'package:nfe/app/data/model/model_imports.dart';

class ViewPessoaClienteRepository {
  final ViewPessoaClienteApiProvider viewPessoaClienteApiProvider;
  final ViewPessoaClienteDriftProvider viewPessoaClienteDriftProvider;

  ViewPessoaClienteRepository({required this.viewPessoaClienteApiProvider, required this.viewPessoaClienteDriftProvider});

  Future getList({Filter? filter}) async {
    if (Constants.usingLocalDatabase) {
      return await viewPessoaClienteDriftProvider.getList(filter: filter);
    } else {
      return await viewPessoaClienteApiProvider.getList(filter: filter);
    }
  }

  Future<ViewPessoaClienteModel?>? save({required ViewPessoaClienteModel viewPessoaClienteModel}) async {
    if (viewPessoaClienteModel.id != null) {
      if (Constants.usingLocalDatabase) {
        return await viewPessoaClienteDriftProvider.update(viewPessoaClienteModel);
      } else {
        return await viewPessoaClienteApiProvider.update(viewPessoaClienteModel);
      }
    } else {
      if (Constants.usingLocalDatabase) {
        return await viewPessoaClienteDriftProvider.insert(viewPessoaClienteModel);
      } else {
        return await viewPessoaClienteApiProvider.insert(viewPessoaClienteModel);
      }
    }   
  }

  Future<bool> delete({required int id}) async {
    if (Constants.usingLocalDatabase) {
      return await viewPessoaClienteDriftProvider.delete(id) ?? false;
    } else {
      return await viewPessoaClienteApiProvider.delete(id) ?? false;
    }
  }
}