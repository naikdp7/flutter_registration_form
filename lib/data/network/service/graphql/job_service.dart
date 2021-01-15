import 'package:registration_form/data/network/graphql/graphql_result.dart';
import 'package:registration_form/data/network/graphql/graphql_service.dart';
import 'package:registration_form/data/network/response/job_response.dart';
import 'package:registration_form/data/network/service/graphql/graphql_endpoint.dart';

class JobService extends GraphQLService {
  Future<JobResponse> getJobs() async {
    GraphQLResult graphQLResult = await super.execute(
      type: GraphQLService.QUERY,
      query: GET_JOBS,
      variables: Map<String, dynamic>(),
      apiIdentifier: 1,
    );

    Map<String, dynamic> result =
        graphQLResult.queryResult.data as Map<String, dynamic>;

    return JobResponse.fromJson(result);
  }
}
