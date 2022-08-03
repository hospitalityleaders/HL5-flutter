import 'package:holedo/models/models.dart';

class RequestedConnection extends Model {
  int? id;
  int? connectorId;
  int? connecteeId;
  int? status;
  String? created;
  String? modified;

  RequestedConnection({
    this.id,
    this.connectorId,
    this.connecteeId,
    this.status,
    this.created,
    this.modified,
  });

  factory RequestedConnection.fromJson(Map<String, dynamic> json) {
    return RequestedConnection(
      id: json['id'] as int?,
      connectorId: json['connector_id'] as int?,
      connecteeId: json['connectee_id'] as int?,
      status: json['status'] as int?,
      created: json['created'] as String?,
      modified: json['modified'] as String?,
    );
  }

  Map<String, dynamic> toJson() => {
        'id': id,
        'connector_id': connectorId,
        'connectee_id': connecteeId,
        'status': status,
        'created': created,
        'modified': modified,
      };
}
