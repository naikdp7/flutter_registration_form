import 'package:flutter/cupertino.dart';
import 'package:graphql/client.dart';
import 'package:registration_form/data/network/graphql/graphql_result.dart';

class GraphQLService {
  static const int QUERY = 1;
  static const int MUTATION = 2;

  GraphQLClient _client;

  GraphQLClient getGraphQLClient(Link httpLink) {
    //_client ??  GraphQLClient( TODO: Removed singleton due to cache problem. Need a fix.
    _client = GraphQLClient(
      link: httpLink,
      cache: InMemoryCache(),
    );
    return _client;
  }

  GraphQLService();

  Future<GraphQLResult> execute({
    @required int type,
    @required String query,
    @required Map<String, dynamic> variables,
    @required int apiIdentifier,
  }) async {
    Future<Link> _getGraphQlLink() async {
      final HttpLink _httpLink = HttpLink(
        uri: 'https://api.graphql.jobs',
      );
      return _httpLink;
    }
    switch (type) {
      case QUERY:
        var result =
        await getGraphQLClient(await _getGraphQlLink(),).query(
            _queryOptions(query, variables));
        _printResponse(result);
        return GraphQLResult(apiIdentifier, result);
      case MUTATION:
        var result = await getGraphQLClient(await _getGraphQlLink(),)
            .mutate(_mutationOptions(query, variables));
        _printResponse(result);
        return GraphQLResult(apiIdentifier, result);
      default:
        throw Exception('invalid type');
    }
  }

  _printResponse(QueryResult queryResult) {
    print("GraphQL Response error: ${queryResult.exception.toString()}");
    if (queryResult?.exception?.clientException?.message
        ?.contains("Failed host lookup") ??
        false) {
      throw Exception();
    }
    print("GraphQL Response data: ${queryResult.data}");
  }

  QueryOptions _queryOptions(String query, Map<String, dynamic> variables) {
    print("GraphQL Request Query: ${query}");
    print("GraphQL Parameters: ${variables.toString()}");
    return QueryOptions(documentNode: gql(query), variables: variables);
  }

  MutationOptions _mutationOptions(String query,
      Map<String, dynamic> variables) {
    print("GraphQL Request Query: ${query}");
    print("GraphQL Parameters: ${variables.toString()}");
    return MutationOptions(documentNode: gql(query), variables: variables);
  }
}
