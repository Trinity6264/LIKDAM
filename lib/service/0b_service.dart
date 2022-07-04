import 'package:bloc_practice/model/user_model.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';
import 'package:getwidget/components/search_bar/gf_search_bar.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

import '../objectbox.g.dart';

class ObService {
  /// The Store of this app.
  late final Store _store;

  // Opening store
  Future<void> openStore() async {
    try {
      final directory = await getApplicationDocumentsDirectory();
      _store = Store(
        getObjectBoxModel(),
        directory: join(directory.path, 'likdam'),
      );
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  // closing  store
  Future<void> closeStore() async {
    try {
      _store.close();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
    }
  }

  //Todo: user Authentication

  // create new user

  Future<dynamic> createNewUser({required UserModel userModel}) async {
    try {
      // this piece of code checks the box if the username exist
      final res = _store
          .box<UserModel>()
          .query(
            UserModel_.username.equals(userModel.username),
          )
          .build()
          .count();
      if (res == 1) {
        return 'Username already exist';
      }
      final userBox = _store.box<UserModel>().put(userModel);
      return userBox;
    } on ObjectBoxException catch (e) {
      return e.message;
    } on PlatformException catch (e) {
      return e.message;
    } catch (e) {
      return e.toString();
    }
  }

  // login an existing user
  Future<dynamic> loginUser({
    required String username,
    required String password,
  }) async {
    try {
      final res = _store
          .box<UserModel>()
          .query(
            UserModel_.username.equals(username),
          )
          .build()
          .count();

      if (res == 1) {
        final res = _store
            .box<UserModel>()
            .query(
              UserModel_.password.equals(password),
            )
            .build()
            .count();
        if (res == 1) {
          return res;
        } else {
          return 'Password is incorrect';
        }
      } else {
        return 'Username not found';
      }
    } catch (e) {
      return e;
    }
  }
}
