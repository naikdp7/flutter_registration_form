import 'package:graphql/client.dart';

class GraphQLResult {
  final int identifier;
  final QueryResult queryResult;

  GraphQLResult(this.identifier, this.queryResult);
}
