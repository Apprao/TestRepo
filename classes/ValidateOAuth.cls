public with sharing class ValidateOAuth {    
    
	private ApexPages.StandardController controller {get; set;}
    public String oauthcode {
        get;
        set {
            oauthcode = value;
        }
    }
    
    public String refreshToken {
        get;
        set {
            refreshToken = value;            
        }
    }
    
    public String instanceURL {
        get;
        set {
            instanceURL = value;
        }
    }
    
    public String sfOrgID {
        get;
        set {
            sfOrgID = value;
        }
    }
    public String stateData {
        get;
        set {
            stateData = value;
        }
    }
    
   public String successMessage {
        get;
        set {
            successMessage = value;
        }
    } 
    
    public boolean returnValue {get; set;}
    
    // initialize the controller
    public ValidateOAuth(ApexPages.StandardController controller) {
        this.controller = controller;        
    }
    
    
    public ValidateOAuth(){
        
    }
    
    public PageReference onLoadCode(){
        System.debug('Step1:');
        String stateStr = ApexPages.currentPage().getParameters().get('state');
        String codeStr = ApexPages.currentPage().getParameters().get('code');
        System.debug('Step1:'+stateStr);
        System.debug('Step1:'+codeStr);
        if(stateStr != null && stateStr != ''){
            successMessage = 'Your salesforce org will be registered. ';
        	String[] userArr = stateStr.split('\\|');
            String orgTitle = '';
            String userName = '';
            String idSfOrg = '';
            if(userArr != null && userArr.size() > 0){
                orgTitle = userArr[0];
                userName = userArr[1];  
                idSfOrg = userArr[2];  
            }
            successMessage += '		Org Title : '+orgTitle;
            successMessage += '  	User Name: '+ userName;
            //successMessage += '  	idSfOrg: '+ idSfOrg;
        }
        return null;
    }

    public PageReference redirect(){
        System.debug('Step1:'+stateData);
        //stateData = 'ICMARC%7Cdev.y%40icmarc.autorabit.com.artest1%7Cundefined%7C0f913a9c-a99e-45fb-adc2-d7c4a9713dce%7CeyJhbGciOiJSUzI1NiJ9.eyJzdWIiOiJBUlZhdWx0IiwiYXVkIjoid2ViIiwicHJvZHVjdElkIjoxLCJjdXN0b21lcklkIjoiMTcyNWFiYzItNjY3ZS00ZDE1LTlmNGUtNDY5MjJhODBkZWUzIiwidXNlck5hbWUiOiJBUlZhdWx0IiwiZXhwIjoxNTI0NTk2NDY4LCJ1c2VySWQiOiIwZjkxM2E5Yy1hOTllLTQ1ZmItYWRjMi1kN2M0YTk3MTNkY2UiLCJpYXQiOjE1MjQ1MTAwNjh9.XcYZu4TYCm-sa__KRcP12bNfaQL-5ULKwcbSaTVdDckEEtfgwCtOmPPaNDQAgWoewTrxVaerMdY_W6-Rzv1vgjpMuZX6kNC1Qoe0s4flW0HxSwhaOe3AXmqobF-dwyhAEe8NRqnbOW2MZGQ9_omCec8tAcPXEONXhgIoOOPSIMt_ySt56flI-qYXafj1iTQtzFQ-FCZi4NQ3b_b7Ajfgki1LUcD4Bv5H9bg49Q4sKlNp5S6rQIY0OmNZSHeekUr_51yuFagCgdlvwtfX4YjQ6VvQbjYrv_4i5h21WCeevtkiYofYGG-wRAGIb6ZP-fvYTtKN6-qU_FTbGV4LmflgSg%7Chttps%3A%2F%2Ficmarc--artest1.cs19.my.salesforce.com';
        List<String> userArr = new List<String>();
        if(stateData != null && stateData.length() > 0){
            String decoded = EncodingUtil.urlDecode(stateData, 'UTF-8');
         	userArr = decoded.split('\\|');  //| 
        }
        String orgTitle, idUser, txARVault,userName, idSfOrg, loginURL  = '';
        if(userArr != null && userArr.size() > 0){
        	orgTitle = userArr.get(0);
        	userName = userArr.get(1);  
            idSfOrg = userArr.get(2);  
            idUser = userArr.get(3);
            txARVault = userArr.get(4);
            loginURL = userArr.get(5);
            /*if(loginURL.contains('TEST')){
                loginURL = 'https://test.salesforce.com';
            }*/
        }
        System.debug('orgTitle:'+orgTitle+'userName:'+userName);
        
        String serviceURL = loginURL  //'https://test1.salesforce.com' //loginURL 
            + '/services/oauth2/token';
        Http h = new Http();     
        System.debug('code:'+oauthcode);
        String reqBody = 'grant_type=authorization_code'
            +'&client_id=3MVG9zlTNB8o8BA2YHUasMGhWsHJ9u4WDfkdIrAoaZiogfGpjkSg1x36V0gIfgJUGp.6HL4QmyHftw5GDi..g&client_secret=6452851928561691716'
            +'&redirect_uri=https://arvaultdev-developer-edition.na59.force.com/apex/testOAuthVfp'
            +'&code='+oauthcode;
        
        HttpRequest req = new HttpRequest();
        req.setEndpoint(serviceURL);
        req.setBody(reqBody);
        req.setMethod('POST');
		req.setHeader('Content-Type', 'application/x-www-form-urlencoded');
        HttpResponse res = h.send(req);
        System.debug('res.body:'+res.getBody());
        Map<String, Object> s1 = (Map<String, Object>) JSON.deserializeUntyped(res.getBody());
        System.debug('s1:'+s1);
        if(s1 != null && s1.size() > 0){
            refreshToken = (String) s1.get('refresh_token');
            instanceURL = (String) s1.get('instance_url');
        }
        System.debug('refreshToken:'+refreshToken+':instanceURL:'+instanceURL);
        System.debug('stateData:'+stateData);
        Map<String, Object> returnObject = new Map<String, Object>();
        if(idSfOrg != 'undefined' && idSfOrg != '' ){
            returnObject = new ValidateOAuth().updateSfOrg(idUser, txARVault, idSfOrg, orgTitle, userName,'', '', 'oauth', refreshToken, loginURL);                  
        }else{ 
            returnObject = new ValidateOAuth().basicAuthCallout(idUser, txARVault, orgTitle, userName, '', '', 'oauth', refreshToken, loginURL);                    
        }
        boolean isError = true;
        if(returnObject != null && returnObject.size() > 0){
            String errorString =  (String) returnObject.get('error');
             if(errorString == null){
                isError = false;
            }
            System.debug('errorString:'+errorString);
        }      
        if(!isError){
            returnValue = true; 
        }else{
            returnValue = false;             
        }
		
        return null;
   }
  /*  public void testbasicAuthCallout(String idUser, String txARVault, String orgName, String userName, String pwd, String sfSecToken, String sfAuthType,
                                     String refreshToken, String instanceURL)
    {
        Map<String, Object> returnObject = new ValidateOAuth().basicAuthCallout(idUser, txARVault, orgName, userName, '', '', 'oauth', refreshToken, instanceURL);                    
        
        boolean isError = true;
        if(returnObject != null && returnObject.size() > 0){
            String errorString =  (String) returnObject.get('error');
            if(errorString == null){
                isError = false;
            }
            System.debug('errorString:'+errorString);
        }      
        if(!isError){
            returnValue = true; 
        }else{
            returnValue = false;             
        }
        System.debug('returnValue:'+returnValue);
    }
    */
    
    public Map<String, Object> basicAuthCallout(String idUser, String txARVault, String orgName, String userName, String pwd, String sfSecToken, String sfAuthType,
                                          			String refreshToken, String instanceURL)
    {
 
        String userInfo = '{"nmLable":"'+orgName
            +'", "sfNmUser":"'+userName
            +'","sfTxPwd":"'+pwd
            +'","sfSecToken":"'+sfSecToken
            +'", "sfAccessToken":"'
            +'", "sfRefreshToken":"'+refreshToken
            +'", "idUser":"'+idUser
            +'","sfAuthType":"'+sfAuthType
			+'", "loginUrl":"'+instanceURL
            +'"}';        
        String serviceURL = '/addSforgEnvi';        
        return generateResponse(txARVault, serviceURL, userInfo);           
   }
    

    public Map<String, Object> updateSfOrg(String idUser, String txARVault, String idSforg, String nmLable, String sfNmUser,String sfTxPwd, String sfSecToken, 
                                     String sfAuthType, String refreshToken, String instanceURL)
    {
			String userInfo = '{"idSforg":"'+idSforg
                +'","nmLable":"'+nmLable
                +'", "sfNmUser": "'+sfNmUser
                +'","sfTxPwd":"'+sfTxPwd
                +'","sfSecToken":"' +sfSecToken
                +'","sfAuthType":"'+sfAuthType
                +'", "idUser": "'+idUser
                +'", "sfAccessToken":"'+
                +'", "sfRefreshToken":"'+refreshToken
                +'", "sfInstanceUrl":"'+instanceURL         
                +'"}';
            System.debug('jsonInput:'+userInfo);
			String serviceURL = '/updateSforgEnvi';
            return generateUpdateResponse(txARVault, serviceURL, userInfo); 
     }                                             
    
/*  public void testUpdateSfOrg(String idUser, String txARVault, String orgName, String userName, String pwd, String sfSecToken, String sfAuthType,
                                     String refreshToken, String instanceURL)
    {
        Map<String, Object> returnObject = new ValidateOAuth().updateSfOrg(idUser, txARVault, '00D3900000040cqEAA', orgName, userName, '', '', 'oauth', refreshToken, instanceURL);                    
        
        boolean isError = true;
        if(returnObject != null && returnObject.size() > 0){
            String errorString =  (String) returnObject.get('error');
            if(errorString == null){
                isError = false;
            }
            System.debug('errorString:'+errorString);
        }      
        if(!isError){
            returnValue = true; 
        }else{
            returnValue = false;             
        }
        System.debug('returnValue:'+returnValue);
    }*/
     public Map<String, Object> generateResponse(String txARVault, String serviceURL, String jsonInput){
        List<CustomSetting__c> pos = [SELECT EndPoint_URL__c FROM CustomSetting__c where name= 'WEBSERVICE_URL'];
        String baseURL = '';
        if(pos != null  && pos.size() > 0){
             baseURL = pos.get(0).EndPoint_URL__c; 
        }
        
         
        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseURL + serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');        
       
        String authorizationHeader = 'Bearer ' + txARVault;
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> responseObjects = new Map<String, Object>();
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            responseObjects =(Map<String, Object>) JSON.deserializeUntyped(res.getBody());                      
        }else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
            String errorString = (String) res.getBody();   
  			responseObjects.put('error', errorString);
                
        }
        return responseObjects;
    }  
    
     public Map<String, Object> generateUpdateResponse(String txARVault, String serviceURL, String jsonInput){
        List<CustomSetting__c> pos = [SELECT EndPoint_URL__c FROM CustomSetting__c where name= 'WEBSERVICE_URL'];
        String baseURL = '';
        if(pos != null  && pos.size() > 0){
             baseURL = pos.get(0).EndPoint_URL__c; 
        }
        
         
        HttpRequest req = new HttpRequest();
        req.setEndpoint(baseURL + serviceURL);
        req.setMethod('POST');
        req.setHeader('Content-type', 'application/json');        
       
        String authorizationHeader = 'Bearer ' + txARVault;
        req.setHeader('Authorization', authorizationHeader);
        req.setBody(jsonInput);
        
        Http http = new Http();
        HTTPResponse res = http.send(req);
        Map<String, Object> responseObjects = new Map<String, Object>();
        if(res.getStatusCode() == 200)
        { 
            system.debug('Authentication success!!!' + res);
            System.debug(res.getBody());
            boolean isUpdated = (boolean) JSON.deserializeUntyped(res.getBody());                                                      
            responseObjects.put('success', isUpdated);
        }else
        {
            system.debug('Authentication failed!!!' + res + res.getStatusCode());
            String errorString = (String) res.getBody();   
  			responseObjects.put('error', errorString);
                
        }
        return responseObjects;
    } 
}