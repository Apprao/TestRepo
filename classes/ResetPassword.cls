public with sharing class ResetPassword {
    
	private ApexPages.StandardController controller {get; set;}
    public ResetPassword(ApexPages.StandardController controller) {
        this.controller = controller;        
    }        
    
    public String password {get;set;}
    public boolean authError {get;set;}
    public String confirmPassword {get;set;}      
    public String email {
        get;
        set {
            email = value;
        }
    }
    public String token {
        get;
        set {
            token = value;
        }
    } 
    public String otp {
        get;
        set {
            otp = value;
        }
    }
    public PageReference onLoadCode(){
        this.email = ApexPages.currentPage().getParameters().get('email');
        this.token = ApexPages.currentPage().getParameters().get('token');
        this.otp = ApexPages.currentPage().getParameters().get('otp');
        
        return null;
    }
        
    public PageReference resetPwd(){
        System.debug('password:'+password);
        System.debug('confirmPassword:'+confirmPassword);
        if(password ==confirmPassword){
			authError = false;
            String serviceURL = '/users/user/saveresetpassword';
            String jsonInput = '{"idUser": "'+token+'","otp":"'+otp+'","txPwd": "'+password+'"}';
            System.debug('jsonInput:'+jsonInput);
            generateResponseStr(serviceURL, jsonInput);
        }else{
            authError = true;
        }        
        return null;
    }
         
    public String generateResponseStr(String serviceURL, String jsonInput){
        List<CustomSetting__c> pos = [SELECT EndPoint_URL__c FROM CustomSetting__c where name= 'WEBSERVICE_URL'];
        String baseURL = '';
        if(pos != null  && pos.size() > 0){
             baseURL = pos.get(0).EndPoint_URL__c; 
        }
                 
        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseURL + serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');        
        req.setBody(jsonInput);
        req.setTimeout(20000); // reduce the timeout once issue is fixed from backend.
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        String responseObjects = '';
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            responseObjects =(String)res.getBody();                      
        }  else {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
  			responseObjects = (String)res.getBody();                               	
        }
        return responseObjects;
    }
}