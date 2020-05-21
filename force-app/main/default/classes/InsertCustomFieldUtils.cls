public class InsertCustomFieldUtils {
    
    @AuraEnabled(cacheable=true)
    public static String insertField(String objectApiName, String fieldApiName, String fieldLabel, String fieldDescription){
        Http h = new Http();
        HttpRequest requestinside = new HttpRequest();
        requestinside.setHeader('Authorization', 'Bearer ' + UserInfo.getSessionID());
        requestinside.setHeader('Content-Type', 'application/json');
        requestinside.setEndpoint(URL.getSalesforceBaseUrl().toExternalForm()+'/services/data/v41.0/tooling/sobjects/CustomField/');
        requestinside.setMethod('POST');
        String fieldDef = '{"Metadata" : ';
        String metadef = '"type" : "Text","description" : "'+fielddescription+'", "inlineHelpText" : "","precision" : null,"label" : "'+fieldlabel+'","length" : 255,"required" : false';
        fieldDef += '{'+metadef+'},';
        fieldDef += '"FullName" : "'+objectapiname+'.'+fieldapiname+'__c"}';
        system.debug(fieldDef);
        requestinside.setBody(fieldDef);
		HTTPResponse res = new HTTPResponse();
        if(!Test.isRunningTest()){
	        res = h.send(requestinside);
        }
        System.debug(res.getBody());
        return res.getBody();
    }
}