import 'package:firebase_auth/firebase_auth.dart';
import 'package:rxdart/rxdart.dart';
import 'package:tracking_delivery_demo/blocs/bloc_base.dart';

class RootBloc implements BlocBase {
  final _firebaseUser = BehaviorSubject<FirebaseUser>();

  /// Observables
  Observable<FirebaseUser> get firebaseUser => _firebaseUser.stream;

  /// Functions
  void userLogged() async {
    await FirebaseAuth.instance.currentUser().then((firebaseUser){
      print(firebaseUser.toString());
      _firebaseUser.sink.add(firebaseUser);
    });
  }

  @override
  void dispose() {
    _firebaseUser.close();
  }

}