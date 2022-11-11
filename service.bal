import choreotestorganization/accelerator;
import ballerina/http;
import ballerina/io;

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
        io:println("println");
        io:println("clientIdParam", clientIdParam);
        io:println("clientSecretParam", clientSecretParam);
        accelerator:Client acceleratorEp = check new (clientConfig = {
            auth: {
                clientId: clientIdParam,
                clientSecret: clientSecretParam
            }
        });
        io:println("acceleratorEp", acceleratorEp);
        string getGreetingResponse = check acceleratorEp->getGreeting(name = "Successfull");
        io:println("getGreetingResponse", getGreetingResponse);
        return getGreetingResponse;
    }
}
