import 'easy_permission_platform_interface.dart';

class EasyPermission {
  /// 只是查看权限
  Future<EasyPermissionStatus> cameraStatus() {
    return EasyPermissionPlatform.instance.cameraStatus();
  }

  /// 直接申请权限
  Future<EasyPermissionStatus> requestCamera() {
    return EasyPermissionPlatform.instance.requestCamera();
  }

  /// 访问相机权限，没有权限会申请权限
  Future<EasyPermissionStatus> accessCamera() {
    return EasyPermissionPlatform.instance.accessCamera();
  }
}
