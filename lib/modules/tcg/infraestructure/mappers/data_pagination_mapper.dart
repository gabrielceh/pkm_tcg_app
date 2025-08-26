import 'package:pkm_tcg_app/modules/tcg/domain/entities/entities.dart';
import 'package:pkm_tcg_app/modules/tcg/infraestructure/models/response_data_tcg.dart';

class DataPaginationMapper {
  static DataPaginationTcg dataPaginationToEntity(
    ResponseDataTcg dataPagination,
  ) {
    return DataPaginationTcg(
      page: dataPagination.page,
      pageSize: dataPagination.pageSize,
      count: dataPagination.count,
      totalCount: dataPagination.totalCount,
    );
  }
}
