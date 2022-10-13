import 'package:plugin_platform_interface/plugin_platform_interface.dart';

import 'easy_permission_method_channel.dart';

enum EasyPermissionStatus {
  /// 已授权
  authorized,

  /// 已拒绝
  denied,

  /// 未申请
  notDetermined,

  /// 不支持
  notSupported,
}

const Map<String, EasyPermissionStatus> permisionStatusMap = {
  'authorized': EasyPermissionStatus.authorized,
  'denied': EasyPermissionStatus.denied,
  'notDetermined': EasyPermissionStatus.notDetermined,
  'notSupported': EasyPermissionStatus.notSupported,
};

abstract class EasyPermissionPlatform extends PlatformInterface {
  /// Constructs a EasyPermissionPlatform.
  EasyPermissionPlatform() : super(token: _token);

  static final Object _token = Object();

  static EasyPermissionPlatform _instance = MethodChannelEasyPermission();

  /// The default instance of [EasyPermissionPlatform] to use.
  ///
  /// Defaults to [MethodChannelEasyPermission].
  static EasyPermissionPlatform get instance => _instance;

  /// Platform-specific implementations should set this with their own
  /// platform-specific class that extends [EasyPermissionPlatform] when
  /// they register themselves.
  static set instance(EasyPermissionPlatform instance) {
    PlatformInterface.verifyToken(instance, _token);
    _instance = instance;
  }

  /// 只是查看权限
  Future<EasyPermissionStatus> cameraStatus();

  /// 直接申请权限
  Future<EasyPermissionStatus> requestCamera();

  /// 访问相机权限，没有权限会申请权限
  Future<EasyPermissionStatus> accessCamera();
}
