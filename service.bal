import choreotestorganization/accelerator;
import ballerina/http;

# A service representing a network-accessible API
# bound to port `9090`.
service / on new http:Listener(9090) {

    # A resource for generating greetings
    # + name - the input string name
    # + return - string name with hello message or error
    resource function post accountAccessConsent() returns map<json>|error {
        // Send a response back to the caller.
        map<json> accountsData = {
            consentId: "123"
        };
        return accountsData;
    }

    resource function get accountAccessConsent() returns string|error? {

        accelerator:Client acceleratorEp = check new (clientConfig = {
            auth: {
                clientId: "wwdJ7QRfazP854o0xU_7mwjiKd8a",
                clientSecret: "PZj5erdQ2BYPl0FK1C4xfidPfGYa"
            }
        });
        return check acceleratorEp->getGreeting(name = "Successfull");
    }
}
