import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tracking_delivery_demo/blocs/bloc_base.dart';
import 'package:tracking_delivery_demo/blocs/login_validator.dart';

class LoginBloc extends Object with LoginValidator implements BlocBase {
  final _email = BehaviorSubject<String>();
  final _password = BehaviorSubject<String>();
  final _logging = BehaviorSubject<bool>();
  final _message = BehaviorSubject<String>();

  /// Observables
  Stream<String> get email => _email.transform(validateEmail);

  Stream<String> get password => _password.transform(validatePassword);

  Stream<bool> get submitValid =>
      Observable.combineLatest2(email, password, (a, b) => true);

  Observable<bool> get logging => _logging.stream;

  Observable<String> get message => _message.stream;

  /// Functions
  Function(String) get changeEmail => _email.sink.add;

  Function(String) get changePassword => _password.sink.add;

  void logIn() async {
    _logging.sink.add(true);
    await FirebaseAuth.instance
        .signInWithEmailAndPassword(
            email: _email.value, password: _password.value)
        .then((response) {
      print(response);
      _logging.sink.add(false);
      _message.sink.add('Bienvenido!');
    }, onError: (error) {
      print('Error: ${error.toString()}');
      _logging.sink.add(false);
      _message.sink.add('Usuario inválido!');
    });
  }

  @override
  void dispose() {
    _email.close();
    _password.close();
    _logging.close();
    _message.close();
  }
}
