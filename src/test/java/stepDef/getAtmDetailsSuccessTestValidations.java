package stepDef;

import com.APITestingFramework.testBase;
import io.cucumber.java.Before;
import io.cucumber.java.en.Given;
import io.cucumber.java.en.Then;
import io.cucumber.java.en.When;
import io.restassured.RestAssured;
import io.restassured.path.json.JsonPath;
import org.json.JSONArray;
import org.json.JSONException;

import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

import static org.testng.Assert.assertEquals;

public class getAtmDetailsSuccessTestValidations extends testBase {
    String queryParam;
    String value;

    @Before
    public static void setUp() {
        init();
    }

    @Given("{string} number is {string}")
    public void number_is(String tag, String value1) {
        queryParam = tag;
        value = value1;
    }

    @When("user makes a GET call to the api")

    public void user_makes_a_get_call_to_the_api() {
        response = RestAssured.given().queryParam(queryParam, value).log().all().get();
        response.prettyPrint();
    }

    @Then("user get {int} status code")
    public void user_get_status_code(Integer statusCode) {
        assertEquals(testBase.response.statusCode(), statusCode);
    }

    @Then("the response is validated")
    public void the_response_is_validated() {
        try {
            String fileContent = new String(Files.readAllBytes(Paths.get("ExpectedResponse.json")));
            JsonPath expectedJson = new JsonPath(fileContent);
            assertEquals(expectedJson, testBase.response);
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    @Then("{string} is verified as {string}")
    public void is_verified_as(String tag, String value) throws JSONException {
        JSONArray JSONResponseBody = new JSONArray(response.body().asString());
        switch (tag) {
            case "Identification":
                assertEquals(JSONResponseBody.getJSONObject(0).getString(tag), value);
                break;
            case "SupportedCurrencies":
                assertEquals(JSONResponseBody.getJSONObject(0).getJSONArray(tag).getString(0), value);
                break;
            case "AddressLine":
                assertEquals(JSONResponseBody.getJSONObject(0).getJSONObject("Location").getJSONObject("PostalAddress").getJSONArray(tag).get(0), value);
                break;
            case "CountrySubDivision":
                assertEquals(JSONResponseBody.getJSONObject(0).getJSONObject("Location").getJSONObject("PostalAddress").getJSONArray(tag).get(0), value);
                break;
            case "Streetname":
                assertEquals(JSONResponseBody.getJSONObject(0).getJSONObject("Location").getJSONObject("PostalAddress").getString(tag), value);
                break;
            case "TownName":
                assertEquals(JSONResponseBody.getJSONObject(0).getJSONObject("Location").getJSONObject("PostalAddress").getString(tag), value);
                break;
            case "Country":
                assertEquals(JSONResponseBody.getJSONObject(0).getJSONObject("Location").getJSONObject("PostalAddress").getString(tag), value);
                break;
            case "PostCode":
                assertEquals(JSONResponseBody.getJSONObject(0).getJSONObject("Location").getJSONObject("PostalAddress").getString(tag), value);
                break;

        }

    }

}
