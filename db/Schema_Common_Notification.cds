namespace SNAH.Common.Notification;

entity EmailNotification {
    key errorcode        : String(16);
        errortype        : String(32);
        productline      : String(32);
        packagename      : String(64);
        iflowname        : String(64);
        ordercompany     : String(16);
        toemailaddresses : String(255);
        ccemailaddresses : String(255);
        emailsubject     : String(255);
        lastupdatedby    : String(64);
        lastupdatedtime  : DateTime;

}

entity ErrorCodeXref {
    key errorcode        : String(16);
        errordescription : String(64);
        lastupdatedby    : String(64);
        lastupdatedtime  : DateTime;
}

view ERROREMAILNOTIFICATION_V as
    select
        key en.errorcode              as errorcode,
            codeDesc.errordescription as errordescription,
            en.errortype,
            en.productline,
            en.packagename,
            en.iflowname,
            en.ordercompany,
            en.toemailaddresses,
            en.ccemailaddresses,
            en.emailsubject,
            en.lastupdatedby          as enotifylastupdateby,
            codeDesc.lastupdatedby    as desclastupdatedby,
            en.lastupdatedtime        as enotifylastupdatedtime,
            codeDesc.lastupdatedtime  as desclastupatedtime

    from EmailNotification as en
    join ErrorCodeXref as codeDesc
        on en.errorcode = codeDesc.errorcode;
