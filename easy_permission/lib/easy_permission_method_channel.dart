import 'package:flutter/foundation.dart';
import 'package:flutter/services.dart';

import 'easy_permission_platform_interface.dart';

/// An implementation of [EasyPermissionPlatform] that uses method channels.
class MethodChannelEasyPermission extends EasyPermissionPlatform {
  /// The method channel used to interact with the native platform.
  @visibleForTesting
  final methodChannel = const MethodChannel('easy_permission');

  /// 只是查看权限
  @override
  Future<EasyPermissionStatus> cameraStatus() async {
    final status = await methodChannel.invokeMethod<String>('cameraStatus');
    return permisionStatusMap[status] ?? EasyPermissionStatus.notSupported;
  }

  /// 直接申请权限
  @override
  Future<EasyPermissionStatus> requestCamera() async {
    final status = await methodChannel.invokeMethod<String>('requestCamera');
    return permisionStatusMap[status] ?? EasyPermissionStatus.notSupported;
  }

  /// 访问相机权限，没有权限会申请权限
  @override
  Future<EasyPermissionStatus> accessCamera() async {
    final status = await methodChannel.invokeMethod<String>('accessCamera');
    return permisionStatusMap[status] ?? EasyPermissionStatus.notSupported;
  }
}
