import 'package:hearify_it/entities/entity_auth_token.dart';
import 'package:hearify_it/repository/repo.dart';
import 'package:observable/observable.dart';
import 'package:rxdart/rxdart.dart';

class AuthorizationBloc {
  final _repository = RepositoryAuthorization();

  final PublishSubject _authorizationTokenFetcher =
      PublishSubject<AuthorizationModel>();
  final PublishSubject _authorizationCodeFetcher = PublishSubject<String>();

  Observable<ChangeRecord> get authorizationCode =>
      _authorizationCodeFetcher.stream as Observable<ChangeRecord>;
  Observable<ChangeRecord> get authorizationToken =>
      _authorizationTokenFetcher.stream as Observable<ChangeRecord>;

  fetchAuthorizationCode() async {
    String? code = await _repository.fetchAuthorizationCode();
    _authorizationCodeFetcher.sink.add(code);
  }

  fetchAuthorizationToken(String code) async {
    AuthorizationModel authorizationModel =
        await _repository.fetchAuthorizationToken(code);
    _authorizationTokenFetcher.sink.add(authorizationModel);
  }

  disposeCode() {
    _authorizationCodeFetcher.close();
  }

  disposeToken() {
    _authorizationTokenFetcher.close();
  }
}

final AuthorizationBloc authorizationBloc = AuthorizationBloc();
