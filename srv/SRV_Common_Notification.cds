using SNAH.Common.Notification from '../db/Schema_Common_Notification';

service CatalogEmailNotification {
      @requires: 'authenticated-user'
    entity EmailNotification as projection on Notification.EmailNotification;
     @requires: 'authenticated-user'
    entity EmailDescription as projection on Notification.ErrorCodeXref
     @requires: 'authenticated-user'
    entity emaildescriptionView  as projection on Notification.ERROREMAILNOTIFICATION_V

}