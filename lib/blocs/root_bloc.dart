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
      _firebaseUser.sink.add(firebaseUser);
    });
  }

  void userLogOut() async {
    await FirebaseAuth.instance.signOut().then((v) => userLogged());
  }

  @override
  void dispose() {
    _firebaseUser.close();
  }

}