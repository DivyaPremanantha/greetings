import choreotestorganization/accelerator;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + return - string name with hello message or error
    resource function post accountAccessConsent() returns map<json>|error {
        // Send a response back to the caller.
        map<json> accountsData = {
            consentId: "123"
        };
        return accountsData;
    }

    resource function get accountAccessConsent(string clientIdParam, string clientSecretParam) returns string|error? {

        accelerator:Client acceleratorEp = check new (clientConfig = {
            auth: {
                clientId: clientIdParam,
                clientSecret: clientSecretParam
            }
        });
        string getGreetingResponse = check acceleratorEp->getGreeting(name = "Successfull");
        return getGreetingResponse;
    }
}
